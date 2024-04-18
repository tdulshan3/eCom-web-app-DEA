<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="adminpackage.Dbcon" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.*" %>
<%@page import="javax.naming.*" %>
<%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <table border="0" cellpadding="5">
        <thead>
            <tr>
                <th>No</th>
                <th>Product</th>
                <th>Availability</th>
                <th>Product price</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <%
                int price, qty;
                String productName, cartDetails, ava, userId = "1";
                Dbcon dbConn = new Dbcon();
                try {
                    dbConn.connect();
                    if ((userId) == null) {
                    } else {
                        ResultSet rsCart = dbConn.executeQuery("SELECT cart_details FROM cart WHERE user_id= " + userId);
                        if (rsCart.next()) {
                            cartDetails = rsCart.getString("cart_details");
                            String[] pairs = cartDetails.split(";");
                            Integer i = 1;
                            for (String pair : pairs) {
                                i++;
                                String[] parts = pair.split(":");
                                int productId = Integer.parseInt(parts[0]);
                                int quantity = Integer.parseInt(parts[1]);
                                ResultSet rsProduct = dbConn.executeQuery("SELECT name, price, quantity FROM products WHERE product_id=" + productId);
                                if (rsProduct.next()) {
                                    productName = rsProduct.getString("name");
                                    price = rsProduct.getInt("price");
                                    qty = rsProduct.getInt("quantity");
                                    if (qty == 0) {
                                        ava = "outofstock";
                                    } else {
                                        ava = "instock";
                                    }
                                    out.print("<tr><td>" + Integer.toString(i) + "</td><td>" + productName + "</td><td>" + ava + "</td><td>" + price + "</td><td>" + quantity + "</td><td>" + price * quantity + "</td></tr>");
                                }
                            }
                        }
                    }
                    dbConn.disconnect();
                } catch (ClassNotFoundException ex) {
                    out.println(ex.getMessage());
                } catch (SQLException ex) {
                    out.println(ex.getMessage());
                }
            %>
        </tbody>
    </table>
    <form action="CheckoutRegservlet" method="post">
        <input type="submit" value="Checkout">
    </form>
</html>