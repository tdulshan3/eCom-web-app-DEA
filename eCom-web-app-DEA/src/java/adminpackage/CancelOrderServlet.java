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
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author Hp
 */
@WebServlet(name = "CancelOrderServlet", urlPatterns = {"/CancelOrderServlet"})
public class CancelOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String status = request.getParameter("status");
        
        // Update status in the database
        Dbcon dbConn = new Dbcon();
        try {
            dbConn.connect();
            dbConn.executePreparedStatement("UPDATE `order` SET status=? WHERE order_id=?", status, orderId);
            response.sendRedirect("adminOrder.jsp"); // Redirect back to the orders page
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