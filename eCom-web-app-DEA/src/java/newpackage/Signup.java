package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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

        out.println("Entering doPost method");

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
            out.println("Received parameters");

            
            
            String query = "INSERT INTO register (Email, Password, FirstName, LastName, Address, City, Postcode, Phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            Dbcon dbConnector = new Dbcon();
            try {
                out.println("Attempting database connection");
                dbConnector.connect();
                out.println("Connected to database");
                    // Check if the email already exists in the database
        String emailCheckQuery = "SELECT * FROM register WHERE Email = ?";
        ResultSet rs = dbConnector.executeQueryWithPreparedStatement(emailCheckQuery, email);
        if (rs.next()) {
            // Email already exists, set error message and forward to registration page
            request.setAttribute("errorMessage2", "Email already exists");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
            dispatcher.forward(request, response);
            return; // Stop further execution of the servlet
        }
                dbConnector.executePreparedStatement(query, email, pw1, firstName, lastName, address, townCity, postcode, phoneNumber);
                out.println("Executed database query");
                dbConnector.disconnect();
                out.println("Disconnected from database");
                out.println("done");
            } catch (ClassNotFoundException ex) {
                out.println("ClassNotFoundException: " + ex.getMessage());
            } catch (SQLException ex) {
                out.println("SQLException: " + ex.getMessage());
            }
        } else {
            request.setAttribute("errorMessage", "Passwords do not match");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
        dispatcher.forward(request, response);

    }
}
