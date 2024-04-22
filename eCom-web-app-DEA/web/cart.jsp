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
            int price, qty, cartId, total=0;
            String productName, cartDetails, ava, userId="0";
            Dbcon dbConn = new Dbcon();
            dbConn.connect();
            if (userId.equals("0")){
                
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("cart_details")) {
                            cartDetails = cookie.getValue();
                            out.println(cartDetails);
                            String[] pairs = cartDetails.split("/");
                            Integer i=0;
                            for (String pair : pairs) {
                                i++;
                                String[] parts = pair.split(":");
                                int productId = Integer.parseInt(parts[0]);
                                int quantity = Integer.parseInt(parts[1]);
                                ResultSet rsProduct =dbConn.executeQuery("SELECT name, price, quantity FROM products WHERE product_id=" +productId);
                                if(rsProduct.next()){
                                    productName = rsProduct.getString("name");
                                    price = rsProduct.getInt("price");
                                    total+=price;
                                    qty = rsProduct.getInt("quantity");
                                    if (qty==0){
                                        ava = "outofstock";
                                    } else{
                                        ava = "instock";      
                                    }
                                    out.print("<tr><td>"+Integer.toString(i)+"</td><td>"+productName+"</td><td>"+ava+"</td><td>"+price+"</td><td>"+quantity+"</td><td>"+price*quantity+"</td><td><form action='DelCartItemUnreg' method='post'><input type='hidden' name='itemDetails' value='" + productId +":"+quantity+"'><input type='submit' value='Delete'></form></td></tr>");
                                }
                            }
                    out.print("<form action='DelCartUnReg' method='post'><input type='submit' value='Delete All'></form>");
                    out.print("Total "+Integer.toString(total));
                            break;
                        }
                    }
                }
                

            } else{
                ResultSet rsCart = dbConn.executeQuery("SELECT cart_id, cart_details FROM cart WHERE user_id= " +userId);
                if(rsCart.next()){
                    cartDetails = rsCart.getString("cart_details");
                    cartId = rsCart.getInt("cart_id");
                    String[] pairs = cartDetails.split("/");
                    Integer i=0;
                    for (String pair : pairs) {
                        i++;
                        String[] parts = pair.split(":");
                        int productId = Integer.parseInt(parts[0]);
                        int quantity = Integer.parseInt(parts[1]);
                        ResultSet rsProduct =dbConn.executeQuery("SELECT name, price, quantity FROM products WHERE product_id=" +productId);
                        if(rsProduct.next()){
                            productName = rsProduct.getString("name");
                            price = rsProduct.getInt("price");
                            total+=price;
                            qty = rsProduct.getInt("quantity");
                            if (qty==0){
                                ava = "outofstock";
                            } else{
                                ava = "instock";      
                            }
                            out.print("<tr><td>"+Integer.toString(i)+"</td><td>"+productName+"</td><td>"+ava+"</td><td>"+price+"</td><td>"+quantity+"</td><td>"+price*quantity+"</td><td><form action='DeleteCartItem' method='post'><input type='hidden' name='itemDetails' value='" + productId +":"+quantity+"'><input type='submit' value='Delete'></form></td></tr>");
                        }
                    }
                    out.print("<form action='deleteCart' method='post'><input type='hidden' name='cartId' value='" + cartId + "'><input type='submit' value='Delete All'></form>");
                    out.print("Total "+Integer.toString(total));
                }
            }
        %>
            </tbody>
        </table>
        <form action="CheckoutRegservlet" method="post">   
            <input type="submit" value="Checkout">
        </form>
        
   
</html>