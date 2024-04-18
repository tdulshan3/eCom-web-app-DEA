package adminpackage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UserSession {

    public static String getUserIdFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false); 
        if (session != null) {
            String userId = (String) session.getAttribute("userId");
            if (userId != null) {
                return userId;
            }
        }
        return "not registered";
    }
}