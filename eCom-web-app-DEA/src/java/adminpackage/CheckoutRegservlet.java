package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckoutRegservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String userId = UserSession.getUserIdFromSession(request);
        Dbcon dbConn = new Dbcon();
        //if user is not registered rederect to contact form
        if (userId.equals("0")) {
            response.sendRedirect("non_reg_user_contact_form.jsp");
            //if user registered get confirmation from user
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("var result = confirm('Are you sure you want to confirm the order?');");
            out.println("if (result) {");
            out.println("  alert('Order Confirmed!');");
            out.println("  window.location.href = 'cart.jsp';");
            out.println("} else {");
            out.println("  alert('Cancelled!');");
            out.println("  window.location.href = 'cart.jsp';");
            out.println("}");
            out.println("</script>");
            out.println("Thank you for Ordering....");
            //save order in database.
            try {
                dbConn.connect();
                ResultSet rs = dbConn.executeQuery("SELECT * FROM cart WHERE user_id = " + userId);
                if (rs.next()) {
                    int cartId = rs.getInt("cart_id");
                    String cartDetails = rs.getString("cart_details");
                    String queryDelUser = "DELETE FROM `cart` WHERE cart_id = ?";
                    String queryOrder = "INSERT INTO `order` (user_id,cart_d, status) VALUES (?,?, 'pending')";
                    dbConn.executePreparedStatement(queryOrder, userId, cartDetails);
                    dbConn.executePreparedStatement(queryDelUser, cartId);
                } else {
                    System.out.println("No cart found for user with user_id: " + userId);
                }
                
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(CheckoutRegservlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
