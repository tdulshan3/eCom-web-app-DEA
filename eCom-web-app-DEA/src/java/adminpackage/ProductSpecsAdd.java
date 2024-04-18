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

public class ProductSpecsAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Dbcon dbConnector = new Dbcon();
        String specString = request.getParameter("spec");
        String productId = request.getParameter("id");
        PrintWriter out = response.getWriter();
        try {
            dbConnector.connect();
            String updateQuery = "UPDATE products SET specs = ? WHERE product_id = ?";
            dbConnector.executePreparedStatement(updateQuery, specString, productId);
            dbConnector.disconnect();
            out.println("Success ");
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Exception occurred: " + ex.getMessage());
        }
    }
}
