
package adminpackage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckoutServletReg extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutReg</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutReg at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out =response.getWriter();
        
        String userId="0";
        Dbcon dbConn = new Dbcon();
        if (userId.equals("0")) {
            
            response.sendRedirect("non_reg_user_contact_form.jsp");
            
        }else {
            
            out.println("<script type=\"text/javascript\">");
            out.println("var result = confirm('Are you sure you want confirm order?');");
            out.println("if (result) {");
            out.println("  alert('Order Confirmed!');"); // You can replace this with your logic
            out.println("} else {");
            out.println("  alert('Cancelled!');");
            out.println("  window.location.href = 'cart.jsp';");
            out.println("}");
            out.println("</script>");
            
            try{
            dbConn.connect();
            
                // Select cart_id from cart where user_id = userId
                ResultSet rs = dbConn.executeQuery("SELECT cart_id FROM cart WHERE user_id = " + userId);
                if (rs.next()) {
                    int cartId = rs.getInt("cart_id");

                    // Insert data into the order table
                    String queryOrder = "INSERT INTO `order` (cart_id, status) VALUES (?, 'confirm')";
                    dbConn.executePreparedStatement(queryOrder, String.valueOf(cartId));
                } else {
                    System.out.println("No cart found for user with user_id: " + userId);
                }
            

            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(checkoutForm.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
