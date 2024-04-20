package adminpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendReceiptServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        try {
            // Replace with your database connection details
            String url = "jdbc:mysql://localhost:3306/test1";
            String username = "root";
            String password = "";

            // Establish database connection
            Connection conn = DriverManager.getConnection(url, username, password);

            // Prepare SQL query to retrieve order details
            String query = "SELECT o.order_id, u.FirstName, u.LastName, p.name, p.price, c.cart_details, p.price * c.cart_details AS total "
                    + "FROM `order` o "
                    + "JOIN cart c ON o.cart_id = c.cart_id "
                    + "JOIN user u ON c.user_id = u.userid "
                    + "JOIN products p ON c.cart_details LIKE CONCAT('%', p.product_id, '%') "
                    + "WHERE u.email = ?";

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            // Prepare the receipt content
            StringBuilder receipt = new StringBuilder();
            while (rs.next()) {
                receipt.append("Order ID: ").append(rs.getInt("order_id")).append("\n");
                receipt.append("Customer Name: ").append(rs.getString("FirstName")).append(" ").append(rs.getString("LastName")).append("\n");
                receipt.append("Product: ").append(rs.getString("name")).append("\n");
                receipt.append("Price: ").append(rs.getDouble("price")).append("\n");
                receipt.append("Quantity: ").append(Integer.parseInt(rs.getString("cart_details").split(":")[1])).append("\n");
                receipt.append("Total: ").append(rs.getDouble("total")).append("\n\n");
            }

            // Send the receipt (you can use an email library or service for this)
            sendEmail(email, "Order Receipt", receipt.toString());

            // Close database resources
            rs.close();
            stmt.close();
            conn.close();

            // Redirect to the orders page or display a success message
            response.sendRedirect("OrdersServlet");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void sendEmail(String recipient, String subject, String content) {
        // Implement email sending logic here
        // You can use an email library like JavaMail or a third-party email service
        System.out.println("Sending email to: " + recipient);
        System.out.println("Subject: " + subject);
        System.out.println("Content: " + content);
    }
}