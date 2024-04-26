/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String status = request.getParameter("status");
        
        // Update status in the database
        Dbcon dbConn = new Dbcon();
        try {
            dbConn.connect();
            ResultSet ord = dbConn.executeQuery("SELECT * FROM `order` WHERE order_id=" + orderId);
            if(ord.next()){
            String cartD = ord.getString("cart_d");
            String[] productIdQtyPairs = cartD.split("/");
            for (String pair : productIdQtyPairs) {
                String[] productIdQty = pair.split(":");
                int productId = Integer.parseInt(productIdQty[0]);
                int quantity = Integer.parseInt(productIdQty[1]);

                dbConn.executePreparedStatement("UPDATE products SET quantity = quantity - ? WHERE product_id = ?", quantity, productId);
            }
            }
            dbConn.executePreparedStatement("UPDATE `order` SET status=? WHERE order_id=?", status, orderId);
            
            response.sendRedirect("adminOrder.jsp"); 
        } catch (Exception e) {
            // Handle error
            e.printStackTrace();
            response.getWriter().println("Error updating status: " + e.getMessage());
        } finally {
            try {
                dbConn.disconnect();
            } catch (Exception e) {
                // Handle error
                e.printStackTrace();
                response.getWriter().println("Error disconnecting from database: " + e.getMessage());
            }
        }
    }
}