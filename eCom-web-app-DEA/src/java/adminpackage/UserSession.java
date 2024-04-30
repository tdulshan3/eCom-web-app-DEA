package adminpackage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UserSession {

    public static String getUserIdFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            //get userid from session
            String userId = (String) session.getAttribute("userId");
            if (userId != null) {
                return userId;
            }
        }
        //if there no session that mean user is unregisterd so default this will 0 
        return "0";
    }
}
