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

/**
 *
 * @author USER
 */
public class SpecsTypeAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Dbcon dbConnector = new Dbcon();
        PrintWriter out = response.getWriter();
        //getting paramaetrs and assign them to variable called name and categoryid 
        String name = Optional.ofNullable(request.getParameter("Specs_name"))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .orElse(null);
        int categoryId = Optional.ofNullable(request.getParameter("category_id"))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(Integer::parseInt)
                .orElse(0);

        try {

            dbConnector.connect();
            //insert those varibles to specs_type table 
            String insertQuery = "INSERT INTO spces_type (category_id,spec_type_name) VALUES (?,?)";
            dbConnector.executePreparedStatement(insertQuery, categoryId, name);
            dbConnector.disconnect();
            out.println("Success");
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }
    }
}
