package adminpackage;
import javax.servlet.http.Cookie;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DelCartItemUnreg extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String itemDetails = request.getParameter("itemDetails");
        
        String cartdetailsOld;
        Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("cart_details")) {
                            cartdetailsOld = cookie.getValue();
                            
                            String newCartDetails="";
                            String[] pairs = cartdetailsOld.split("/");
                            int i=0;
                            for (String a : pairs) {

                                if(!pairs[i].equals(itemDetails)){
                                    newCartDetails +=pairs[i]+"/";  
                            
                                }
                                i++;
                                
                            }
                            Cookie cartCookie = new Cookie("cart_details", newCartDetails);
                            cartCookie.setMaxAge(3600); 
                            cartCookie.setPath("/"); // Set cookie path

                            response.addCookie(cartCookie);
                            response.sendRedirect("cart.jsp");
                        }
                    }
                }
                    
    }

}
