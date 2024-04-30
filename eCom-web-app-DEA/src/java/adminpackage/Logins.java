package adminpackage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logins extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("Email");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();
        //Check User is Admin or Not        
        if (email.equals("admin@admin.com") && password.equals("123456")) {
            HttpSession session = request.getSession();
            session.setAttribute("role", "admin");
            response.sendRedirect("admin.jsp");
        //Send an error massage if admin password is wrong
        } else if (email.equals("admin@admin.com") && !(password.equals("123456"))) {
            request.setAttribute("errorMessage", "password error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
            dispatcher.forward(request, response);
            //this execute when user is not using admin email
        } else {
            Dbcon db = new Dbcon();
            try {
                db.connect();
                String query = "SELECT * FROM user WHERE email = ?";
                //check user table have email or not
                ResultSet rs = db.executeQueryWithPreparedStatement(query, email);
                
                if (rs.next()) {
                    String status = rs.getString("status");
                    String id = rs.getString("user_id");
                    //check user is register or not
                    if (status.equals("registered")) {
                        String dbPassword = rs.getString("password");
                        //if user registerted then check his password
                        if (password.equals(dbPassword)) {
                            //creating user session called userId
                            HttpSession session = request.getSession();
                            session.setAttribute("userId", id);
                            response.sendRedirect("index.jsp");
                        } else {
                            //this execte when registered user password is wrong
                            request.setAttribute("errorMessage", "invalid password");
                            RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
                            dispatcher.forward(request, response);
                        }
                    } else {
                        //this execute when user is unregistered 
                        request.setAttribute("errorMessage", "User not found");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {
                    //this execute when user email is not available in user table
                    request.setAttribute("errorMessage", "User not found");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e.getMessage());
            } finally {
                try {
                    db.disconnect();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
