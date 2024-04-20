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

public class CategoryDelete extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();

        String categoryId = request.getParameter("category_id");
        Dbcon dbConnector = new Dbcon();
         try {
            dbConnector.connect();
            String query = "DELETE FROM category WHERE category_id = ?";
            dbConnector.executePreparedStatement(query, categoryId);
            dbConnector.disconnect();
            out.println("Success");
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }
    }
}