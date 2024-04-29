<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="adminpackage.Dbcon" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="javax.sql.*" %>
<%@ page import="adminpackage.UserSession" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="navbar.css">
         <script>
        function showLogoutDialog() {
            var confirmLogout = confirm("Are you sure you want to sign out?");
            if (confirmLogout) {
                window.location.href = "/eCom-web-app-DEA/logout.jsp";
            }
        }
    </script>
    </head>
    <body>

        
        
        <%
            String cartDetails1;
            int totalQuantity = 0;
            String Uname = "unknown";
            String userId1 = UserSession.getUserIdFromSession(request);

            if (userId1.equals("0")) {

                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("cart_details")) {
                            cartDetails1 = cookie.getValue();
                            if (cartDetails1 != null && !cartDetails1.isEmpty()) {
                                String[] pairs = cartDetails1.split("/");
                                for (String pair : pairs) {
                                    String[] parts = pair.split(":");
                                    int quantity = Integer.parseInt(parts[1]);
                                    totalQuantity += quantity;
                                }
                            }
                            break;
                        }
                    }
                }
            } else {

                Dbcon dbConn = new Dbcon();
                dbConn.connect();
                ResultSet rsCart = dbConn.executeQuery("SELECT cart_details FROM cart WHERE user_id=" + userId1);
                if (rsCart.next()) {
                    cartDetails1 = rsCart.getString("cart_details");
                    if (cartDetails1 != null && !cartDetails1.isEmpty()) {
                        String[] pairs = cartDetails1.split("/");
                        for (String pair : pairs) {
                            String[] parts = pair.split(":");
                            int quantity = Integer.parseInt(parts[1]);
                            totalQuantity += quantity;
                        }
                    }
                }
            }

        %>
        <header class="site-header">
            <div class="container">
                <div class="logo">


                    <a href="/eCom-web-app-DEA/">
                        <img src="lg.PNG" alt="Cart">
                    </a>


                </div>
                <nav class="main-menu">
                    <ul>
                        <li><a href="/eCom-web-app-DEA/">Home</a></li>
                        <li><a href="/eCom-web-app-DEA/home/service.jsp">Services</a></li>
                        <li><a href="/eCom-web-app-DEA/about.jsp">About</a></li>
                    </ul>
                </nav>
                <div class="user-actions">
                    <%if (userId1.equals("0")) { %>
                    <button ><a href="/eCom-web-app-DEA/login&signup.jsp" class="btn-signin">Sign In</a></button>
                    <%} else {%>
                    <button onclick="showLogoutDialog()"><a href="#" class="btn-signin" >Sign Out</a></button>
                            <%}%>

                    <div class="cart">

                        <a href="/eCom-web-app-DEA/cart.jsp">
                            <img src="icons8-cart-64.png" alt="logo">

                            <span> <%= totalQuantity%> </span>


                        </a>

                    </div>
                </div>
            </div>
        </header>
     
        
        

    </body>
</html>
