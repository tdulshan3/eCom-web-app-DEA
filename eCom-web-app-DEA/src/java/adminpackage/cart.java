
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
import javax.servlet.http.Cookie;

public class cart extends HttpServlet {

    @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String p_id = request.getParameter("p_id");
    String qty = request.getParameter("qty");
    String cart_details = p_id + ":" + qty + "/";
    String userId = "0";
    String cartDetailsOld = "";

    Dbcon dbConn = new Dbcon();
    PrintWriter out = response.getWriter();

    try {
        if(!userId.equals("0")){
            dbConn.connect();
            ResultSet rsUser = dbConn.executeQuery("SELECT status FROM user WHERE user_id = " + userId);
            if (rsUser.next()){
                String status = rsUser.getString("status");
                if(status.equals("registered")){
                    ResultSet rs = dbConn.executeQuery("SELECT cart_details FROM cart WHERE user_id = " + userId);

                    if (rs.next()) {
                        String cart_detailsOld = rs.getString("cart_details");
                        String queryOrder = "UPDATE cart SET cart_details = ? WHERE user_id = ?";
                        String newCartDetails = cart_details + cart_detailsOld;
                        dbConn.executePreparedStatement(queryOrder, newCartDetails, userId);
                    } else {
                        String queryOrder = "INSERT INTO cart (user_id, cart_details) VALUES (?, ?)";
                        dbConn.executePreparedStatement(queryOrder, userId, cart_details);
                    }
                }
                response.sendRedirect("test_product.jsp");
            }
            
        }else{
            Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("cart_details")) {
                            cartDetailsOld = cookie.getValue();
                            break;
                        }
                    }
                }
                
                String newCartDetails = cart_details + cartDetailsOld;//Problem
                
                Cookie cartCookie = new Cookie("cart_details", newCartDetails);
                cartCookie.setMaxAge(3600); 
                cartCookie.setPath("/"); // Set cookie path
                
                response.addCookie(cartCookie);
                
                response.sendRedirect("test_product.jsp");
                
        }
        
    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(CheckoutRegservlet.class.getName()).log(Level.SEVERE, null, ex);
    }
}



}
