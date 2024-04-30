<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="adminpackage.Dbcon" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.*" %>
<%@page import="javax.naming.*" %>
<%@page import="javax.sql.*" %>
<%@ page import="adminpackage.UserSession" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="style1.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <link rel="icon" type="image/png" sizes="32x32" href="16.png">
        <link rel="icon" type="image/png" sizes="16x16" href="32.png">
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <%
            //get user id using UserSession class
            String userId = UserSession.getUserIdFromSession(request);
            int cartId1 = 0;

        %>
        <div class="container-fluid con1 mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Cart</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="/eCom-web-app-DEA/">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Cart</p>
                </div>
            </div>
        </div>
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
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <%            int price, qty, cartId, total = 0;
                                String productName, cartDetails, ava;
                                Dbcon dbConn = new Dbcon();
                                dbConn.connect();
                                //check user.
                                if (userId.equals("0")) {
                                    //if user is unregistered access cookies to display products.
                                    Cookie[] cookies = request.getCookies();
                                    if (cookies != null) {
                                        for (Cookie cookie : cookies) {
                                            if (cookie.getName().equals("cart_details")) {
                                                cartDetails = cookie.getValue();
                                                if (cartDetails != null && !cartDetails.isEmpty()) {
                                                    //split string for aray from '/'.
                                                    String[] pairs = cartDetails.split("/");
                                                    //productID':'Quantity
                                                    Integer i = 0;
                                                    for (String pair : pairs) {
                                                        i++;
                                                        //split product Id and quantity.
                                                        String[] parts = pair.split(":");
                                                        int productId = Integer.parseInt(parts[0]);
                                                        int quantity = Integer.parseInt(parts[1]);
                                                        //get product details using product id.
                                                        ResultSet rsProduct = dbConn.executeQuery("SELECT name, price, quantity FROM products WHERE product_id=" + productId);
                                                        if (rsProduct.next()) {
                                                            productName = rsProduct.getString("name");
                                                            price = rsProduct.getInt("price");

                                                            qty = rsProduct.getInt("quantity");
                                                            total += price * quantity;
                                                            //check availability of product
                                                            if (qty == 0) {
                                                                ava = "outofstock";
                                                            } else {
                                                                ava = "instock";
                                                            }
                                                            //display product
                                                            out.print("<tr><td>" + Integer.toString(i) + "</td><td>" + productName + "</td><td>" + ava + "</td><td>" + price + "</td><td>"
                                                                    + "<div style='display: flex; align-items: center;'>"
                                                                    + "<form action='cart' method='post' style='margin-right: 5px;'>"
                                                                    + "<input type='hidden' name='p_id' value='" + productId + "' />"
                                                                    + "<input type='hidden' name='qty' value='1' />"
                                                                    + "<input type='submit' class='btn btn-dark' value='+' />"
                                                                    + "</form>"
                                                                    + quantity
                                                                    + "<form action='cart' method='post' style='margin-left: 5px;'>"
                                                                    + "<input type='hidden' name='p_id' value='" + productId + "' />"
                                                                    + "<input type='hidden' name='qty' value='-1' />"
                                                                    + "<input type='submit' class='btn btn-dark' value='-' />"
                                                                    + "</form>"
                                                                    + "</div>"
                                                                    + "</td><td>" + price * quantity + "</td><td><form action='DelCartItemUnreg' method='post'><input type='hidden' name='itemDetails' value='" + productId + ":" + quantity + "'><input type='submit' value='Delete' class='btn btn-danger'></form></td></tr>");
                                                        }
                                                    }
                                                }
                                                //if found cookie then stop serching
                                                break;
                                            }
                                        }
                                    }
                                    //if user is registered.
                                } else {
                                    //get cart details from database
                                    ResultSet rsCart = dbConn.executeQuery("SELECT cart_id, cart_details FROM cart WHERE user_id= " + userId);
                                    if (rsCart.next()) {
                                        cartDetails = rsCart.getString("cart_details");
                                        if (cartDetails != null && !cartDetails.isEmpty()) {
                                            cartId = rsCart.getInt("cart_id");
                                            String[] pairs = cartDetails.split("/");
                                            Integer i = 0;
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
                                                    total += price * quantity;
                                                    if (qty == 0) {
                                                        ava = "outofstock";
                                                    } else {
                                                        ava = "instock";
                                                    }
                                                    out.print("<tr><td>" + Integer.toString(i) + "</td><td>" + productName + "</td><td>" + ava + "</td><td>LKR" + price + "</td><td>"
                                                            + "<div style='display: flex; align-items: center;'>"
                                                            + "<form action='cart' method='post' style='margin-right: 5px;'>"
                                                            + "<input type='hidden' name='p_id' value='" + productId + "' />"
                                                            + "<input type='hidden' name='qty' value='1' />"
                                                            + "<input type='submit' class='btn btn-dark' value='+' />"
                                                            + "</form>"
                                                            + quantity
                                                            + "<form action='cart' method='post' style='margin-left: 5px;'>"
                                                            + "<input type='hidden' name='p_id' value='" + productId + "' />"
                                                            + "<input type='hidden' name='qty' value='-1' />"
                                                            + "<input type='submit' class='btn btn-dark' value='-' />"
                                                            + "</form>"
                                                            + "</div>"
                                                            + "</td><td>LKR "
                                                            + price * quantity + "</td><td><form action='DeleteCartItem' method='post'><input type='hidden' name='itemDetails' value='" + productId + ":" + quantity + "'><input type='submit' class='btn btn-danger' value='Delete'></form></td></tr>");
                                                }
                                            }
                                            cartId1 = cartId;

                                        }
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">

                    <div class="card border-secondary mb-5">
                        <div class="card-header con1 border-0">
                            <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Subtotal</h6>
                                <h6 class="font-weight-medium">LKR <%= total%></h6>
                            </div>
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">LKR <%= total%></h5>
                            </div>
                            <form action="CheckoutRegservlet" method="post">   
                                <input type="submit" class="btn btn-block btn-primary my-3 py-3 w-100" value="Proceed To Checkout">
                            </form>


                            <%
                                //unregister user clear cart button
                                if (userId.equals("0")) {
                            %>

                            <form action='DelCartUnReg' method='post'><input type='submit' class="btn btn-block btn-primary my-3 py-3 w-100" value='Clear All'></form>

                            <%
                                /*register user clear cart button*/
                            } else {
                            %> 

                            <form action='deleteCart' method='post'><input  type='hidden' name='cartId' value=<%=cartId1%>><input class="btn btn-block btn-primary my-3 py-3 w-100" type='submit' value='Clear All'></form>
                                <% }%> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-5">
            <%@ include file="footer.html" %></div>
    </body>


</html>
