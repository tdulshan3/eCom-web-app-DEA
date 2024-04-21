package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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

        if (!pw1.equals(pw2)) {
            request.setAttribute("errorMessage1", "Passwords do not match");
            request.setAttribute("formParam", "signup");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
            dispatcher.forward(request, response);
            return;
        } else {

            try {
                Dbcon dbConnector = new Dbcon();
                dbConnector.connect();

                if (checkEmailExists(dbConnector, email)) {
                    String status = getEmailStatus(dbConnector, email);
                    if ("registered".equals(status)) {
                        request.setAttribute("formParam", "signup");
                        request.setAttribute("errorMessage1", "Email already exists");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
                        dispatcher.forward(request, response);
                        return;
                    } else {
                        String query1 = "UPDATE user SET Password = ?, FirstName = ?, LastName = ?, Address = ?, City = ?, Postcode = ?, Phone = ?, status = ? WHERE email = ?";
                        dbConnector.executePreparedStatement(query1, pw1, firstName, lastName, address, townCity, postcode, phoneNumber, "registered", email);
                    }

                } else {

                    String query = "INSERT INTO user (email, Password, FirstName, LastName, Address, City, Postcode, Phone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    dbConnector.executePreparedStatement(query, email, pw1, firstName, lastName, address, townCity, postcode, phoneNumber, "registered");
                }

                response.sendRedirect(request.getContextPath() + "/login&signup.jsp");

            } catch (ClassNotFoundException | SQLException ex) {
                out.println("Error: " + ex.getMessage());
            }
        }
    }

    private boolean checkEmailExists(Dbcon dbConnector, String email) throws SQLException {
        ResultSet rs = dbConnector.executeQueryWithPreparedStatement("SELECT * FROM user WHERE email = ?", email);
        return rs.next();
    }

    private String getEmailStatus(Dbcon dbConnector, String email) throws SQLException {
        ResultSet rs = dbConnector.executeQueryWithPreparedStatement("SELECT status FROM user WHERE email = ?", email);
        if (rs.next()) {
            return rs.getString("status");
        }
        return null;
    }
}
