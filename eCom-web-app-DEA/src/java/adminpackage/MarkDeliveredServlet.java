/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * This servlet handles marking an order as delivered.
 */
package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import adminpackage.Dbcon;
import java.sql.ResultSet;

/**
 *
 * @author Hp
 */
@WebServlet(name = "MarkDeliveredServlet", urlPatterns = {"/MarkDeliveredServlet"})
public class MarkDeliveredServlet extends HttpServlet {
     /*
     * Handles the HTTP POST request to mark an order as delivered.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve order ID and new status from request parameters
        String orderId = request.getParameter("orderId");
        String status = request.getParameter("status");
        
        // Update status in the database
          // Initialize database connection
        Dbcon dbConn = new Dbcon();
        try {
            dbConn.connect();            // Connect to the database

            ResultSet ord = dbConn.executeQuery("SELECT * FROM `order` WHERE order_id=" + orderId);// Retrieve order details from the database
            if(ord.next()){
            String cartD = ord.getString("cart_d"); // Retrieve cart details for the order
            String[] productIdQtyPairs = cartD.split("/"); // Split cart details into individual productId:quantity pairs
            // Update product quantities in the database based on cart details
            for (String pair : productIdQtyPairs) {
                String[] productIdQty = pair.split(":");
                int productId = Integer.parseInt(productIdQty[0]);
                int quantity = Integer.parseInt(productIdQty[1]);

                dbConn.executePreparedStatement("UPDATE products SET quantity = quantity - ? WHERE product_id = ?", quantity, productId); // Update product quantity in the database
            }
            }
            // Update the order status in the database
            dbConn.executePreparedStatement("UPDATE `order` SET status=? WHERE order_id=?", status, orderId);
            
            response.sendRedirect("adminOrder.jsp"); // Redirect back to the admin order page after successful status update
        } catch (Exception e) {
            // Handle error
            e.printStackTrace();
            response.getWriter().println("Error updating status: " + e.getMessage());
        } finally {
            try {
                dbConn.disconnect();    // Disconnect from the database
            } catch (Exception e) {
                // Handle error
                e.printStackTrace();
                response.getWriter().println("Error disconnecting from database: " + e.getMessage());
            }
        }
    }
}