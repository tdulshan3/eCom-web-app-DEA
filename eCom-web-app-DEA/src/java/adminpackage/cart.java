
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

public class cart extends HttpServlet {

    @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String p_id = request.getParameter("p_id");
    String qty = request.getParameter("qty");
    String cart_details = p_id + ":" + qty + ";";
    String userId = "1"; 

    Dbcon dbConn = new Dbcon();
    PrintWriter out = response.getWriter();

    try {
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
            else{
                //----------
            }
        }
        
    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(CheckoutRegservlet.class.getName()).log(Level.SEVERE, null, ex);
    }
}



}
