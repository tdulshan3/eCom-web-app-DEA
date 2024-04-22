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
        <link href="style1.css" rel="stylesheet">
    </head>
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                <tr>
                    <th>No</th>
                    <th>Product</th>
                    <th>Availability</th>
                    <th>Product price</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
               <tbody class="align-middle">
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
          </div>
        <div class="col-lg-4">
               
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium"><%= total %></h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">$160</h5>
                        </div>
                        <form action="CheckoutRegservlet" method="post">   
            <input type="submit" class="btn btn-block btn-primary my-3 py-3" value="Proceed To Checkout">
        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
        
        
   
</html>