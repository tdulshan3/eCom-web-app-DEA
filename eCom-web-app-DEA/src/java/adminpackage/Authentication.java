package adminpackage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Authentication {

    public static void redirectIfNotAuthenticated(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            //check the role of user is admin or not if he is not admin he will redirect into loginpage
            String userRole = (String) session.getAttribute("role");
            if (userRole != null) {
                if (!(userRole.equals("admin"))) {
                    response.sendRedirect("login&signup.jsp");
                }
            } else {
                response.sendRedirect("login&signup.jsp");
            }
        }

    }
}
