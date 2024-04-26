package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CheckoutServletReg", urlPatterns = {"/CheckoutServletUnreg"})
public class CheckoutServletUnreg extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminservlet</title>");            
            out.println("</head>");
            out.println("<body>");
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

        String userEmail = request.getParameter("email");
        String cart_details = "1:4;2:1";
        
// Checkout
        String userstatus= "unregistered";
        placeOrder(userEmail, userstatus, cart_details);
    }

    private void placeOrder(String email, String userstatus, String cart_details) {
        checkoutForm.placeOrder(email, userstatus, cart_details);
    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
