package adminpackage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

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

        Dbcon db = new Dbcon();
        try {
            db.connect();
            String query = "SELECT * FROM user WHERE email = ?";
            ResultSet rs = db.executeQueryWithPreparedStatement(query, email);
            if (rs.next()) {
                String status = rs.getString("status");
                if (status.equals("registered")) {
                    String dbPassword = rs.getString("password");
                    if (password.equals(dbPassword)) {
                        response.sendRedirect("index.jsp");
                    } else {
                        response.sendRedirect("login.jsp?error=1");
                    }
                } else {
                    response.sendRedirect("login.jsp?error=3");
                }
            } else {
                response.sendRedirect("login.jsp?error=2");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=4");
        } finally {
            try {
                db.disconnect();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
