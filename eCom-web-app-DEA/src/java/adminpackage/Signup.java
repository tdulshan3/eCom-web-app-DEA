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
//getting parameters from login&signup.jsp 
        String email = request.getParameter("email");
        String pw1 = request.getParameter("password1");
        String pw2 = request.getParameter("password2");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String address = request.getParameter("address");
        String townCity = request.getParameter("towncity");
        String postcode = request.getParameter("postcode");
        String phoneNumber = request.getParameter("pnumber");
//check both password and confirm password are equal or not
        if (!pw1.equals(pw2)) {
            request.setAttribute("errorMessage1", "Passwords do not match");
            request.setAttribute("formParam", "signup");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
            dispatcher.forward(request, response);
            return;

        } else {
//if both password's are equal this execute
            try {
                Dbcon dbConnector = new Dbcon();
                dbConnector.connect();
//check user already have an account
                if (checkEmailExists(dbConnector, email)) {
                    String status = getEmailStatus(dbConnector, email);
                    //if user account is already exist check it status is registered or unregistered
                    if ("registered".equals(status)) {
                        //if user is already registered then send an error massage 
                        request.setAttribute("formParam", "signup");
                        request.setAttribute("errorMessage1", "Email already exists");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
                        dispatcher.forward(request, response);
                        return;
                    } else {
                        //if user is unregistered this will update his details and chenge status to registered
                        String query1 = "UPDATE user SET Password = ?, FirstName = ?, LastName = ?, Address = ?, City = ?, Postcode = ?, Phone = ?, status = ? WHERE email = ?";
                        dbConnector.executePreparedStatement(query1, pw1, firstName, lastName, address, townCity, postcode, phoneNumber, "registered", email);
                    }

                } else {
                    //if user detail not available in user table this will create a record about user
                    String query = "INSERT INTO user (email, Password, FirstName, LastName, Address, City, Postcode, Phone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    dbConnector.executePreparedStatement(query, email, pw1, firstName, lastName, address, townCity, postcode, phoneNumber, "registered");
                }
//this will redirect to login&signup.jsp
                response.sendRedirect(request.getContextPath() + "/login&signup.jsp");

            } catch (ClassNotFoundException | SQLException ex) {
                out.println("Error: " + ex.getMessage());
            }
        }
    }
//this function will check email is exist on user table or not by using email as a parameter 

    private boolean checkEmailExists(Dbcon dbConnector, String email) throws SQLException {
        ResultSet rs = dbConnector.executeQueryWithPreparedStatement("SELECT * FROM user WHERE email = ?", email);
        return rs.next();
    }
//this function will check, status of user in user table using email as a parameter

    private String getEmailStatus(Dbcon dbConnector, String email) throws SQLException {
        ResultSet rs = dbConnector.executeQueryWithPreparedStatement("SELECT status FROM user WHERE email = ?", email);
        if (rs.next()) {
            return rs.getString("status");
        }
        return null;
    }
}
