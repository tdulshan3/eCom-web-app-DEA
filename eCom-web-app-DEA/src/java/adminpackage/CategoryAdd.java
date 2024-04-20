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
import java.util.Optional;
public class CategoryAdd extends HttpServlet {

    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Dbcon dbConnector = new Dbcon();
        PrintWriter out = response.getWriter();
        String name = Optional.ofNullable(request.getParameter("Category_name"))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .orElse(null);

        try {

            dbConnector.connect();
            String insertQuery = "INSERT INTO category (category_name) VALUES (?)";
            dbConnector.executePreparedStatement(insertQuery, name);
            dbConnector.disconnect();
            out.println("Success");
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }
    }}