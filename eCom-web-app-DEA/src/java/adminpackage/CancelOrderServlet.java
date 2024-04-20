package adminpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CancelOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        try {
            // Replace with your database connection details
            String url = "jdbc:mysql://localhost:3306/test1";
            String username = "root";
            String password = "";

            // Establish database connection
            Connection conn = DriverManager.getConnection(url, username, password);

            // Prepare SQL query to cancel the order
            String query = "UPDATE `order` SET status = 'canceled' WHERE order_id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, orderId);
            stmt.executeUpdate();

            // Close database resources
            stmt.close();
            conn.close();

            // Redirect to the orders page or display a success message
            response.sendRedirect("OrdersServlet");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}