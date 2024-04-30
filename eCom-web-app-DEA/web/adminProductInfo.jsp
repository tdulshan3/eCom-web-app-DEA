<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="adminpackage.Authentication" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <link rel="icon" type="image/png" sizes="32x32" href="16.png">
        <link rel="icon" type="image/png" sizes="16x16" href="32.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="./admin.css" rel="stylesheet">
        <style>
            .card-container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
        </style>
    </head>
    <body>
        <%
            //check user admin or not using Authentication Class
     Authentication.redirectIfNotAuthenticated(request, response);
        %>
        <div class="d-flex">
            <%@ include file="./component/adminSidebar.html" %>
            <div class="container mt-4 card-container">
                <div class="col-md-9">
                    <div class="text-center">
                        <div class="card">
                            <div class="card-body">
                                <%
                                    //connecting database
                                    Dbcon dbConnector = new Dbcon();
                                    dbConnector.connect();
                                    //getting productid parameter form url
                                    int productId = Integer.parseInt(request.getParameter("id"));
                                    try {
                                        //gathering product data form products table using produt id
                                        ResultSet rs = dbConnector.executeQuery("SELECT * FROM products WHERE product_id =" + productId);
                                        if (rs.next()) {
                                            String name = rs.getString("name");
                                            String description = rs.getString("description");
                                            //this will crop string if it have very big length
                                            if (description.length() > 400) {
                                                description = description.substring(0, 400) + "...";
                                            }
                                            String specifications = rs.getString("specifications");
                                            //this will crop string if it have very big length
                                            if (specifications.length() > 400) {
                                                specifications = specifications.substring(0, 400) + "...";
                                            }
                                            double price = rs.getDouble("price");
                                            int categoryId = rs.getInt("category_id");
                                            int manufacturerId = rs.getInt("manufacturer_id");
                                            int quantity = rs.getInt("quantity");

                                            ResultSet rsCategory = dbConnector.executeQuery("SELECT category_name FROM category WHERE category_id = " + categoryId);
                                            String categoryName = "";
                                            if (rsCategory.next()) {
                                                categoryName = rsCategory.getString("category_name");
                                            }

                                            ResultSet rsManufacturer = dbConnector.executeQuery("SELECT manufacturer_name FROM manufacturer WHERE manufacturer_id = " + manufacturerId);
                                            String manufacturerName = "";
                                            if (rsManufacturer.next()) {
                                                manufacturerName = rsManufacturer.getString("manufacturer_name");
                                            }
                                %>
                                <img src="./uploads/<%= rs.getString("img_path")%>" class="card-img-top img-fluid" style="max-width: 300px;" alt="Product Image">

                                <div class="mt-3">
                                    <h4><%= name%></h4>
                                    <p><%= description%></p>
                                    <p><strong>Specifications:</strong> <%= specifications%></p>
                                    <p><strong>Price:</strong> $<%= price%></p>
                                    <p><strong>Category:</strong> <%= categoryName%></p>
                                    <p><strong>Manufacturer:</strong> <%= manufacturerName%></p>
                                    <p><strong>Quantity:</strong> <%= quantity%></p>

                                    <div class="d-flex flex-column align-items-start">

                                        <div class="d-flex mb-2">

                                            <form action="updatePrice" method="GET" class="me-2">
                                                <input type="hidden" name="id" value="<%= productId%>">
                                                <div class="input-group">
                                                    <input type="number" name="price" class="form-control" placeholder="New Price" required>
                                                    <button type="submit" class="btn btn-primary">Update Price</button>
                                                </div>
                                            </form>
                                            <form action="updateQuantity" method="GET">
                                                <input type="hidden" name="id" value="<%= productId%>">
                                                <div class="input-group">
                                                    <input type="number" name="quantity" class="form-control" placeholder="New Quantity" required>
                                                    <button type="submit" class="btn btn-primary">Update Quantity</button>
                                                </div>
                                            </form>
                                            &nbsp  &nbsp  &nbsp  
                                            <a href="deleteProduct?id=<%= productId%>" class="btn btn-danger mb-2">Delete Product</a>
                                        </div>
                                    </div>

                                </div>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
