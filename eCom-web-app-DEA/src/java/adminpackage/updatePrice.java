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
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author USER
 */
public class updatePrice extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //getting url parameters
        int productId = Integer.parseInt(request.getParameter("id"));
        double newPrice = Double.parseDouble(request.getParameter("price"));
        Dbcon dbConnector = new Dbcon();
        try {
            dbConnector.connect();
            //update products price where product id is equal to url parametrs
            dbConnector.executePreparedStatement("UPDATE products SET price = ? WHERE product_id = ?", newPrice, productId);
            dbConnector.disconnect();
           
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            
        }
    }
}