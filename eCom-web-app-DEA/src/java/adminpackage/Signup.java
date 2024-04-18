package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Signup extends HttpServlet {

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    PrintWriter out = response.getWriter();

    String email = request.getParameter("email");
    String pw1 = request.getParameter("password1");
    String pw2 = request.getParameter("password2");
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String address = request.getParameter("address");
    String townCity = request.getParameter("towncity");
    String postcode = request.getParameter("postcode");
    String phoneNumber = request.getParameter("pnumber");

    if (pw1.equals(pw2)) {
        
        Dbcon dbConnector = new Dbcon();
        try {
            boolean emailExists = checkEmailExists(email);
            dbConnector.connect();
            if (!emailExists) {
                String query = "INSERT INTO user (email, Password, FirstName, LastName, Address, City, Postcode, Phone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                dbConnector.executePreparedStatement(query, email, pw1, firstName, lastName, address, townCity, postcode, phoneNumber, "registered");
                response.sendRedirect(request.getContextPath() + "/Login.jsp");
                return;
            } else {
                String status = getEmailStatus(email);
                if (!"registered".equals(status)) {
                    String query1 = "UPDATE user SET Password = ?, FirstName = ?, LastName = ?, Address = ?, City = ?, Postcode = ?, Phone = ?, status = ? WHERE email = ?";
                    dbConnector.executePreparedStatement(query1, pw1, firstName, lastName, address, townCity, postcode, phoneNumber, "registered", email);
                    response.sendRedirect(request.getContextPath() + "/Login.jsp");
                    return;
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Error: " + ex.getMessage());
        } finally {
            try {
                dbConnector.disconnect();
            } catch (SQLException ex) {
                out.println("Error: " + ex.getMessage());
            }
        }
    } else {
        request.setAttribute("errorMessage", "Passwords do not match");
    }

    RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
    dispatcher.forward(request, response);
}


    private boolean checkEmailExists(String email) throws SQLException, ClassNotFoundException {
        Dbcon dbConnector = new Dbcon();
        dbConnector.connect();
        boolean emailExists = false;
        try {
           emailExists = dbConnector.executeQueryWithPreparedStatement("SELECT * FROM user WHERE email = ?", email).next();
            dbConnector.disconnect();
           
        } catch (SQLException ex) {

        }
        return emailExists;
    }

    private String getEmailStatus(String email) throws SQLException, ClassNotFoundException {
        Dbcon dbConnector = new Dbcon();
        dbConnector.connect();
        String status = null;
        try {
            status = dbConnector.executeQueryWithPreparedStatement("SELECT status FROM user WHERE email = ?", email).getString("status");
        } catch (SQLException ex) {

        }
        dbConnector.disconnect();
        return status;
    }
}
