<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Table</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h1 class="card-title text-center">Product Table</h1>
                    <div class="table-responsive">
                        <table class="table table-striped mx-auto">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Dbcon dbConnector = new Dbcon();
                                        dbConnector.connect();
                                        // get all products details from products table and show them in table
                                        ResultSet rs = dbConnector.executeQuery("SELECT product_id,name, description, price, quantity FROM products");
                                        while (rs.next()) {
                                            String id = rs.getString("product_id");
                                            String name = rs.getString("name");
                                            String description = rs.getString("description");
                                            if (description.length() > 150) {
                                                description = description.substring(0, 150) + "...";
                                            }
                                            double price = rs.getDouble("price");
                                            int quantity = rs.getInt("quantity");
                                %>
                                <tr>
                                    <td><a href="./adminProductInfo.jsp?id=<%=id%>" ><%= name%></a></td>
                                    <td><%= description%></td>
                                    <td>$<%= price%></td>
                                    <td><%= quantity%></td>
                                </tr>
                                <%
                                        }
                                        dbConnector.disconnect();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
