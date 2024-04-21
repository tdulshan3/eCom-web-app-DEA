<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="./admin.css" rel="stylesheet">
</head>
<body>
    <div class="d-flex">
        <%@ include file="./component/adminSidebar.html" %>
        <div class="container mt-5">
            <h1 class="mb-4">Orders</h1>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Order ID</th>
                          
                        <th> userName</th>
                        <th> contactNumber</th>
                        <th> email</th>
                        <th>address</th>
                        <th> productName</th>
                        <th>  status</th>
                        <th> price</th>
                        <th>quantity</th>
                        <th>total</th>
                        <th>Action</th>
                        
                        <!-- Add other table headings -->
                    </tr>
                </thead>
                <tbody>
                    <% 
                        String orderId;
                        String userName;
                        String contactNumber;
                         String email;
                         String address;
                         String productName;
                         String  status;
                         String price;
                         String quantity;
                         String total;
                        Dbcon dbConn = new Dbcon();
            dbConn.connect();

                ResultSet rsCart = dbConn.executeQuery("SELECT o.order_id, u.FirstName AS userName, u.Phone AS contactNumber, u.email, u.Address, p.name AS product_name, o.status, p.price, p.quantity AS quantity,(p.quantity * p.price) AS total " +
                           "FROM `order` o " +
                           "JOIN cart c ON o.cart_id = c.cart_id " +
                           "JOIN user u ON c.user_id = u.user_id " +
                           "JOIN products p ON CAST(SUBSTRING_INDEX(c.cart_details, '/', 1) AS UNSIGNED) = p.product_id"

            );
               while (rsCart.next()) {
    orderId = rsCart.getString("order_id");
    userName = rsCart.getString("userName");
    contactNumber = rsCart.getString("contactNumber");
    email = rsCart.getString("email");
    address = rsCart.getString("Address");
    productName = rsCart.getString("product_name");
    status = rsCart.getString("status");
    price = rsCart.getString("price");
    quantity = rsCart.getString("quantity");
    total = rsCart.getString("total");

    out.println("<tr>");
    out.print("<td>" + orderId + "</td>");
    out.print("<td>" + userName + "</td>");
    out.print("<td>" + contactNumber + "</td>");
    out.print("<td>" + email + "</td>");
    out.print("<td>" + address + "</td>");
    out.print("<td>" + productName + "</td>");
    out.print("<td>" + status + "</td>");
    out.print("<td>" + price + "</td>");
    out.print("<td>" + quantity + "</td>");
    out.print("<td>" + total + "</td>");
     out.print("<td>");
            out.print("<button type='button' class='btn btn-danger btn-cancel'>Cancel</button>");
            out.print("<button type='button' class='btn btn-primary btn-change-status'>Change Status</button>");
     
   out.print("</td>");
 out.println("</tr>");
}


                    
                    %>
                                
                 
                </tbody>
            </table>
        </div>
    </div>
  
                   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
                  


</body>
</html>