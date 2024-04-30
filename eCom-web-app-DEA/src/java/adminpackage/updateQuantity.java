/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class updateQuantity extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //getting url parameters
        int productId = Integer.parseInt(request.getParameter("id"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));
        Dbcon dbConnector = new Dbcon();
        try {
            dbConnector.connect();
            //update products quantity where product id is equal to url parametrs
            dbConnector.executePreparedStatement("UPDATE products SET quantity = ? WHERE product_id = ?", newQuantity, productId);
            dbConnector.disconnect();

        } catch (ClassNotFoundException | SQLException e) {

        }
    }
}
