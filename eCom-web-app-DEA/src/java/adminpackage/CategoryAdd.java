package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Optional;

public class CategoryAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Dbcon dbConnector = new Dbcon();
        PrintWriter out = response.getWriter();
        //get parameter from post request
        String name = Optional.ofNullable(request.getParameter("Category_name"))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .orElse(null);

        try {

            dbConnector.connect();
            //insert name variable into category table
            String insertQuery = "INSERT INTO category (category_name) VALUES (?)";
            dbConnector.executePreparedStatement(insertQuery, name);
            dbConnector.disconnect();
            out.println("Success");
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }
    }
}
