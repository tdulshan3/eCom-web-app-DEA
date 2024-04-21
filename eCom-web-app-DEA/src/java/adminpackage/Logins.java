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
        if (email.equals("admin@admin.com") && password.equals("123456")) {
            HttpSession session = request.getSession();
            session.setAttribute("role", "admin");
            response.sendRedirect("index.jsp");
        } else if (email.equals("admin@admin.com") && !(password.equals("123456"))) {
            request.setAttribute("errorMessage", "password error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
            dispatcher.forward(request, response);
        } else {
            Dbcon db = new Dbcon();
            try {
                db.connect();
                String query = "SELECT * FROM user WHERE email = ?";
                ResultSet rs = db.executeQueryWithPreparedStatement(query, email);
                if (rs.next()) {
                    String status = rs.getString("status");
                    String id = rs.getString("user_id");
                    if (status.equals("registered")) {
                        String dbPassword = rs.getString("password");
                        if (password.equals(dbPassword)) {
                            HttpSession session = request.getSession();
                            session.setAttribute("userId", id);
                            response.sendRedirect("index.jsp");
                        } else {
                            request.setAttribute("errorMessage", "invalid password");
                            RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
                            dispatcher.forward(request, response);
                        }
                    } else {
                        request.setAttribute("errorMessage", "User not found");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/login&signup.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {
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
