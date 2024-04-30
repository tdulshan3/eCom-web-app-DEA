/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 *
 * @author USER
 */
public class SpecsDelete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        //get url parameter and asign into variable called specsid
        String specsId = request.getParameter("specs_id");
        Dbcon dbConnector = new Dbcon();
        try {
            dbConnector.connect();
            //delete row in specs table where id is eequal to variable from url parameter
            String query = "DELETE FROM specs WHERE id = ?";
            dbConnector.executePreparedStatement(query, specsId);
            dbConnector.disconnect();
            out.println("Success");
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }
    }

}
