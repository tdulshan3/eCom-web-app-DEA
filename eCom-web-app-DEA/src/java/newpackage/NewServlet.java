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
        String query = "SELECT * FROM register WHERE Email = ? AND password = ?";
        ResultSet rs = db.executeQueryWithPreparedStatement(query, email, password);
        if (rs.next()) {
            // Login successful
            // Redirect to a success page or do further processing
            response.sendRedirect("index.html");
        } else {
            // Login failed
            // Redirect back to the login page with an error message
            response.sendRedirect("login.jsp?error=1");
        }
    } catch (ClassNotFoundException | SQLException e) {
        // Handle exceptions
        e.printStackTrace();
        // Redirect back to the login page with an error message
        response.sendRedirect("login.jsp?error=2");
    } finally {
        try {
            db.disconnect();
        } catch (SQLException e) {
            // Handle disconnect error
            e.printStackTrace();
        }
    }
}}