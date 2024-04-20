package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DelCartUnReg extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie cartCookie = new Cookie("cart_details", "-1:-1/");
        cartCookie.setMaxAge(1); 
        cartCookie.setPath("/"); // Set cookie path
        response.addCookie(cartCookie);
        response.sendRedirect("test_product.jsp");
        
    }


}
