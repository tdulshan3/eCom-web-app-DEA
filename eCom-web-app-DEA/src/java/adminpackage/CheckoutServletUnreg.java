package adminpackage;

import javax.servlet.http.Cookie;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckoutServletUnreg extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        //get parameters from contact form.
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String address = request.getParameter("address");
        String townCity = request.getParameter("towncity");
        String postcode = request.getParameter("postcode");
        String phoneNumber = request.getParameter("pnumber");
        String userstatus = "unregistered";
        String cart_details;
        //get cart details from cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart_details")) {
                    cart_details = cookie.getValue();
                    Dbcon dbConn = new Dbcon();
                    try {
                        dbConn.connect();

                        // Delete Duplicates
                        String queryDelUser = "DELETE FROM user WHERE email = ?";
                        dbConn.executePreparedStatement(queryDelUser, email);

                        // Insert user data into the user table
                        String queryUser = "INSERT INTO user (email, FirstName, LastName, Address, City, Postcode, Phone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                        dbConn.executePreparedStatement(queryUser, email, firstName, lastName, address, townCity, postcode, phoneNumber, userstatus);

                        // Select user_id from user where email = email
                        ResultSet rs = dbConn.executeQuery("SELECT user_id FROM user WHERE email = '" + email + "'");
                        if (rs.next()) {
                            int userId = rs.getInt("user_id");
                            // Insert data into the cart table
                            String queryOrder = "INSERT INTO `order` (user_id,cart_d, status) VALUES (?,?, 'pending')";
                            dbConn.executePreparedStatement(queryOrder, userId, cart_details);
                            request.getRequestDispatcher("DelCartUnReg").forward(request, response);
                            
                        } else {
                            out.println("No user found with the given email.");
                        }

                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(CheckoutServletUnreg.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        }
    }

}
