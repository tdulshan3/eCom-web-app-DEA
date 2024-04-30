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

public class SpecsAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Dbcon dbConnector = new Dbcon();
        PrintWriter out = response.getWriter();
        //getting parameters and assign them to variables called name & specsId
        String name = Optional.ofNullable(request.getParameter("Specs_name"))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .orElse(null);
        int specsTypeId = Optional.ofNullable(request.getParameter("specsType_id"))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(Integer::parseInt)
                .orElse(0);

        try {

            dbConnector.connect();
            //insert data to specs table that we grabbed using paramters
            String insertQuery = "INSERT INTO specs (specs_type_id,spec_name) VALUES (?,?)";
            dbConnector.executePreparedStatement(insertQuery, specsTypeId, name);
            dbConnector.disconnect();
            out.println("Success");
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }
    }
}
