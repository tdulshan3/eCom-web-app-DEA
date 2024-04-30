<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Table</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title text-center">Category Table</h1>
                <div class="table-responsive">
                    <table class="table table-striped mx-auto">
                        <thead>
                            <tr>
                                <th>Category Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                try {
                                    Dbcon dbConnector = new Dbcon();
                                    dbConnector.connect();
                                    //get all categories details from category table and show them in table
                                    ResultSet rs = dbConnector.executeQuery("SELECT * FROM category");
                                    while (rs.next()) {
                                        String categoryId = rs.getString("category_id");
                                        String categoryName = rs.getString("category_name");
                            %>
                            <tr>
                                <td><%= categoryName %></td>
                                <td>
                                   <a href="./adminSpecsType.jsp?category_id=<%= categoryId %>" class="btn btn-dark">Show Specs</a>

                                    <a href="./CategoryDelete?category_id=<%= categoryId %>" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                            <% 
                                    }
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
