package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cartId = request.getParameter("cartId");

        Dbcon dbConn = new Dbcon();
        try {
            dbConn.connect();
            //reset cart value to "".
            String queryDelcart = "UPDATE cart SET cart_details = '' WHERE cart_id = ?";
            dbConn.executePreparedStatement(queryDelcart, cartId);
        } catch (SQLException ex) {
            Logger.getLogger(deleteCart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(deleteCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        String referer = request.getHeader("referer");
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {

        }
    }
}
