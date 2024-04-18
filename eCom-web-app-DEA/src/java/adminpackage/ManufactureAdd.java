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
import java.util.Optional;
import java.sql.SQLException;

public class ManufactureAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Dbcon dbConnector = new Dbcon();
        PrintWriter out = response.getWriter();
        String name = Optional.ofNullable(request.getParameter("Manufacturer_name"))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .orElse(null);

        try {

            dbConnector.connect();
            String insertQuery = "INSERT INTO manufacturer (manufacturer_name) VALUES (?)";
            dbConnector.executePreparedStatementInt(insertQuery, name);
            dbConnector.disconnect();
            out.println("Success");
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }
    }

}
