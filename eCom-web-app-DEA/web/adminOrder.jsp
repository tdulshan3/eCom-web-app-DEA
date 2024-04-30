<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="adminpackage.Authentication" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="icon" type="image/png" sizes="32x32" href="16.png">
        <link rel="icon" type="image/png" sizes="16x16" href="32.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="./admin.css" rel="stylesheet">
    </head>
    <body>
  <%-- 
    This section checks if the user is authenticated. 
    If not authenticated, it redirects the user to the login page.
--%>
        <%
            Authentication.redirectIfNotAuthenticated(request, response);
        %>
         <%--  Display a table to show order details.
                Each row represents an order with its corresponding information.
         --%>
        <div class="d-flex">
            <%@ include file="./component/adminSidebar.html" %>
            <div class="container">
                <div class="d-flex justify-content-center">
                    <div class="container mt-4">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="card-title text-center">Order Table</h1>
                                <div class="table-responsive">
                                    <table class="table table-striped mx-auto">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>userName</th>
                                                <th>Contact Number</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Products</th>
                                                <th>Total</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                 // Establish a database connection
                                                Dbcon dbConn = new Dbcon();
                                                dbConn.connect();
                                                
                                                 // Execute a SQL query to retrieve order data

                                                ResultSet rs1 = dbConn.executeQuery("SELECT * FROM `order`");
                                                
                                                // Iterate over the result set to fetch each order record

                                                while (rs1.next()) {
                                                    String orderId = rs1.getString("order_id");
                                                    int userId = rs1.getInt("user_id");
                                                    String status = rs1.getString("status");
                                                    String cartDetails = rs1.getString("cart_d");
                                                    // Retrieve user information associated with the order
                                                    ResultSet rs2 = dbConn.executeQuery("SELECT * FROM user WHERE user_id=" + userId);
                                                    if (rs2.next()) {
                                                        String userName = rs2.getString("FirstName") + " " + rs2.getString("LastName");
                                                        String contactNumber = rs2.getString("Phone");
                                                        String email = rs2.getString("email");
                                                        String address = rs2.getString("Address") + ", " + rs2.getString("City") + ", " + rs2.getString("Postcode");
                                                        String productDetails = getProductDetails(cartDetails, dbConn);
                                                        int total = getTotalAmount(cartDetails, dbConn);
                                                         // Display order details in table rows
                                                        out.println("<tr>");
                                                        out.print("<td>" + orderId + "</td>");
                                                        out.print("<td>" + userName + "</td>");
                                                        out.print("<td>" + contactNumber + "</td>");
                                                        out.print("<td>" + email + "</td>");
                                                        out.print("<td>" + address + "</td>");
                                                        out.print("<td>" + productDetails + "</td>");
                                                        out.print("<td>" + total + "</td>");
                                                        out.print("<td>" + status + "</td>");
                                                        out.print("<td>");
                                                        // Form for canceling order
                                                        if (status.equals("pending")) {
                                            %>
                                            
                                        <form action='CancelOrderServlet' method='post'>
                                            <input type='hidden' name='orderId' value='<%= orderId%>'/>
                                            <input type='hidden' name='status' value='canceled'/>
                                            <button type='submit' class='btn btn-danger'>Cancel</button>
                                        </form> <br>
                                        <%
                                            }
                                            // Form for marking as delivered
                                            if (status.equals("pending")) {
                                        %>
                                        <form action='MarkDeliveredServlet' method='post'>
                                            <input type='hidden' name='orderId' value='<%= orderId%>'/>
                                            <input type='hidden' name='status' value='delivered'/>
                                            <button type='submit' class='btn btn-primary'>Delivered</button>
                                        </form>
                                        <%
                                                    }
                                                    out.print("</td>");
                                                    out.println("</tr>");
                                                }
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>

<%!
    //Retrieves product details from the database based on cart details
    String getProductDetails(String cartDetails, Dbcon dbConn) throws SQLException {
// Initialize a StringBuilder to construct the product details HTML
        StringBuilder productDetails = new StringBuilder();
        productDetails.append("<ul>");
  // Split the cart details into individual pairs (product ID and quantity)
        String[] pairs = cartDetails.split("/");
 // Iterate over each pair in the cart details
        for (String pair : pairs) {
            // Split the pair into product ID and quantity

            String[] parts = pair.split(":");
              // Extract product ID and quantity

            int productId = Integer.parseInt(parts[0]);

            int quantity = Integer.parseInt(parts[1]);
            // Execute a query to retrieve product information based on product ID

            ResultSet rsProduct = dbConn.executeQuery("SELECT name, price, quantity FROM products WHERE product_id=" + productId);
           // Iterate over the result set to fetch product details
            while (rsProduct.next()) {
          // Retrieve product name from the result set
                String productName = rsProduct.getString("name");
         // Retrieve product price from the result set
                int price = rsProduct.getInt("price");
        // Retrieve product quantity from the result set
                int qty = rsProduct.getInt("quantity");
          // Append product details to the StringBuilder
                productDetails.append("<li>").append(productName).append(" (Qty: ").append(quantity).append(")</li>");

            }
            // Close the result set after use
            rsProduct.close();

        }

        productDetails.append("</ul>");

        return productDetails.toString();

    }
%>

<%!
    //Calculates the total amount of the products in the cart.
    int getTotalAmount(String cartDetails, Dbcon dbConn) throws SQLException {
      // Initialize total amount to zero
        int total = 0;
        // Split the cart details into individual pairs (product ID and quantity)
        String[] pairs = cartDetails.split("/");
       // Iterate over each pair in the cart details
        for (String pair : pairs) {
            // Split the pair into product ID and quantity
            String[] parts = pair.split(":");
            // Extract product ID and quantity
            int productId = Integer.parseInt(parts[0]);
            int quantity = Integer.parseInt(parts[1]);
            // Execute a query to retrieve the price of the product based on product ID
            ResultSet rsProduct = dbConn.executeQuery("SELECT price FROM products WHERE product_id=" + productId);
            if (rsProduct.next()) {
                // Retrieve the price of the product from the result set
                int price = rsProduct.getInt("price");
                // Calculate the subtotal for the current product and add it to the total
                total += price * quantity;
            }
            // Close the result set after use
            rsProduct.close();
        }

        return total;
    }
%>