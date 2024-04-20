package newpackage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NewServlet extends HttpServlet {

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String email = request.getParameter("Email");
    String password = request.getParameter("password");

    Dbcon db = new Dbcon();
    try {
        db.connect();
        String query = "SELECT * FROM register WHERE Email = ?";
        ResultSet rs = db.executeQueryWithPreparedStatement(query, email);
        if (rs.next()) {
            String storedPassword = rs.getString("password");
            if (password.equals(storedPassword)) {
                // Passwords match, login successful
                // Redirect to a success page or do further processing
                response.sendRedirect("index.html");
            } else {
                // Passwords don't match, login failed
                // Set error message attribute and redirect back to the login page
                request.setAttribute("errorMessage", "Incorrect password");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } else {
            // User not found, login failed
            // Set error message attribute and redirect back to the login page
            request.setAttribute("errorMessage", "User not found");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    } catch (ClassNotFoundException | SQLException e) {
        // Handle exceptions
        e.printStackTrace();
        // Set error message attribute and redirect back to the login page
        request.setAttribute("errorMessage", "Database error");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } finally {
        try {
            db.disconnect();
        } catch (SQLException e) {
            // Handle disconnect error
            e.printStackTrace();
        }
    }
}}