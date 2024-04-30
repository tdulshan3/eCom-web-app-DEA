package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
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
        //get parameters from product pages and cart.
        String p_id = request.getParameter("p_id");
        String qty = request.getParameter("qty");
        //setup cart details using product Id and quantity.
        String cart_details = p_id + ":" + qty + "/";
        String userId = UserSession.getUserIdFromSession(request);
        String cartDetailsOld = "";

        Dbcon dbConn = new Dbcon();
        PrintWriter out = response.getWriter();

        try {
            //check user is registered or not.
            if (!userId.equals("0")) {
                //if user is registered
                dbConn.connect();
                ResultSet rsUser = dbConn.executeQuery("SELECT status FROM user WHERE user_id = " + userId);
                if (rsUser.next()) {
                    String status = rsUser.getString("status");
                    if (status.equals("registered")) {
                        ResultSet rs = dbConn.executeQuery("SELECT cart_details FROM cart WHERE user_id = " + userId);
                        Map<String, Integer> cartMap = new HashMap<>();
                        if (rs.next()) {
                            String cart_detailsOld = rs.getString("cart_details");
                            String[] oldCartItems = cart_detailsOld.split("/");
                            for (String item : oldCartItems) {
                                if (!item.isEmpty()) {
                                    String[] parts = item.split(":");
                                    String productId = parts[0];
                                    int quantity = Integer.parseInt(parts[1]);
                                    cartMap.put(productId, quantity);
                                }
                            }

                            String[] newCartItems = cart_details.split("/");
                            for (String item : newCartItems) {
                                if (!item.isEmpty()) {
                                    String[] parts = item.split(":");
                                    String productId = parts[0];
                                    int quantity = Integer.parseInt(parts[1]);
                                    cartMap.put(productId, cartMap.getOrDefault(productId, 0) + quantity);
                                }
                            }

                            StringBuilder newCartDetails = new StringBuilder();
                            for (Map.Entry<String, Integer> entry : cartMap.entrySet()) {
                                newCartDetails.append(entry.getKey()).append(":").append(entry.getValue()).append("/");
                            }

                            if (newCartDetails.length() > 0) {
                                newCartDetails.deleteCharAt(newCartDetails.length() - 1);
                            }
                            String newd = newCartDetails.toString() + "/";
                            String queryOrder = "UPDATE cart SET cart_details = ? WHERE user_id = ?";

                            dbConn.executePreparedStatement(queryOrder, newd, userId);
                        } else {
                            String queryOrder = "INSERT INTO cart (user_id, cart_details) VALUES (?, ?)";
                            dbConn.executePreparedStatement(queryOrder, userId, cart_details);
                        }
                    }
                    String referer = request.getHeader("referer");
                    if (referer != null && !referer.isEmpty()) {
                        response.sendRedirect(referer);
                    } else {

                    }
                }

            } else {
                Cookie[] cookies = request.getCookies();
                Map<String, Integer> cartMap = new HashMap<>();

                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("cart_details")) {
                            cartDetailsOld = cookie.getValue();
                            break;
                        }
                    }
                }

                String[] oldCartItems = cartDetailsOld.split("/");
                for (String item : oldCartItems) {
                    if (!item.isEmpty()) {
                        String[] parts = item.split(":");
                        String productId = parts[0];
                        int quantity = Integer.parseInt(parts[1]);
                        cartMap.put(productId, quantity);
                    }
                }

                String[] newCartItems = cart_details.split("/");
                for (String item : newCartItems) {
                    if (!item.isEmpty()) {
                        String[] parts = item.split(":");
                        String productId = parts[0];
                        int quantity = Integer.parseInt(parts[1]);
                        cartMap.put(productId, cartMap.getOrDefault(productId, 0) + quantity);
                    }
                }

                StringBuilder newCartDetails = new StringBuilder();
                for (Map.Entry<String, Integer> entry : cartMap.entrySet()) {
                    newCartDetails.append(entry.getKey()).append(":").append(entry.getValue()).append("/");
                }

                if (newCartDetails.length() > 0) {
                    newCartDetails.deleteCharAt(newCartDetails.length() - 1);
                }
                String newd = newCartDetails.toString() + "/";
                Cookie cartCookie = new Cookie("cart_details", newd);
                cartCookie.setMaxAge(3600);
                cartCookie.setPath("/");
                response.addCookie(cartCookie);
                String referer = request.getHeader("Referer");
                if (referer != null && !referer.isEmpty()) {
                    response.sendRedirect(referer);
                }

            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CheckoutRegservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
