package adminpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CheckoutServletReg", urlPatterns = {"/CheckoutServletUnreg"})
public class CheckoutServletUnreg extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        String email = request.getParameter("email");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String address = request.getParameter("address");
        String townCity = request.getParameter("towncity");
        String postcode = request.getParameter("postcode");
        String phoneNumber = request.getParameter("pnumber");

        String cart_details = "1:4;2:1";
        
// Checkout
        String userstatus= "unregistered";
        placeOrder(email, firstName, lastName, address, townCity, postcode, phoneNumber, userstatus, cart_details);
    }

    private void placeOrder(String email, String firstName,  String lastName, String address, String townCity, String postcode, String phoneNumber, String userstatus, String cart_details) {
        checkoutForm.placeOrder(email, firstName, lastName, address, townCity, postcode, phoneNumber, userstatus, cart_details);
    }
    



    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
