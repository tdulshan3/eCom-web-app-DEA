/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * This servlet handles the cancellation of an order.
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
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author Hp
 */
@WebServlet(name = "CancelOrderServlet", urlPatterns = {"/CancelOrderServlet"})
public class CancelOrderServlet extends HttpServlet {
     /*
     * Handles the HTTP POST request to cancel an order.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // Retrieve order ID and new status from request parameters
        String orderId = request.getParameter("orderId");
        String status = request.getParameter("status");
        
        // Update status in the database
        Dbcon dbConn = new Dbcon();
        try {
            dbConn.connect();  // Connect to the database
            dbConn.executePreparedStatement("UPDATE `order` SET status=? WHERE order_id=?", status, orderId);// Update the order status in the database
            response.sendRedirect("adminOrder.jsp"); // Redirect back to the orders page
        } catch (Exception e) {
            // Handle error
            e.printStackTrace();
            response.getWriter().println("Error updating status: " + e.getMessage());
        } finally {
            try {
                dbConn.disconnect();// Disconnect from the database
            } catch (Exception e) {
                // Handle error
                e.printStackTrace();
                response.getWriter().println("Error disconnecting from database: " + e.getMessage());
            }
        }
    }
}