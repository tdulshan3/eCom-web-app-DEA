
package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCartItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = UserSession.getUserIdFromSession(request);
        String itemDetails = request.getParameter("itemDetails");
        
        PrintWriter out =response.getWriter();
        
        Dbcon dbConn = new Dbcon();
        try {
        dbConn.connect();
                //delete cart items from database - registered user.
                ResultSet rs = dbConn.executeQuery("SELECT cart_details FROM cart WHERE user_id = " + userId);

                if (rs.next()) {
                    String cartdetailsOld = rs.getString("cart_details");
                    //replace values with "" and update cart with new value.
                    String newCartDetails="";
                    String[] pairs = cartdetailsOld.split("/");
                    int i=0;
                    for (String a : pairs) {
                        
                        if(!pairs[i].equals(itemDetails)){
                            newCartDetails +=pairs[i]+"/";  
                            
                        }
                    i++;
                    
                    }
                    String queryOrder = "UPDATE cart SET cart_details = ? WHERE user_id = ?";
                    dbConn.executePreparedStatement(queryOrder, newCartDetails, userId);
                }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CheckoutRegservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("cart.jsp");
        
    }


}
