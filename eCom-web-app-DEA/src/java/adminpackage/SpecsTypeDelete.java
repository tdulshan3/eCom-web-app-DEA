
package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

public class SpecsTypeDelete extends HttpServlet {

    


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        //getting url paramter
        String specsTypeId = request.getParameter("specsType_id");
        Dbcon dbConnector = new Dbcon();
         try {
            dbConnector.connect();
             //delete the row where specstype id equal to url parameter in specstype table
            String query = "DELETE FROM spces_type WHERE spces_type_id = ?";
            dbConnector.executePreparedStatement(query, specsTypeId);
            dbConnector.disconnect();
            out.println("Success");
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }
    }

    

}