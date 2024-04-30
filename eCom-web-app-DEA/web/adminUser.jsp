<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="adminpackage.Dbcon"%>
<%@page import="java.sql.ResultSet"%>
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
        <%
            //check user admin or not using Authentication Class
         Authentication.redirectIfNotAuthenticated(request, response);
        %>
    <div class="d-flex">
        <%@ include file="./component/adminSidebar.html" %>
         <div class="container">
        <div class="d-flex justify-content-center">
    <div class="container mt-4">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title text-center">Users Table</h1>
                <div class="table-responsive">
                    <table class="table table-striped mx-auto">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Full Name</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Dbcon db = new Dbcon();
                        try {
                            db.connect();
                            //get all users from user table
                            ResultSet resultSet = db.executeQuery("SELECT * FROM user");
                            while(resultSet.next()) {
                    %>
                    <tr>
                        <td><%= resultSet.getString("email") %></td>
                        <td><%= resultSet.getString("FirstName")+ " " + resultSet.getString("LastName")%></td>
                        <td><%= resultSet.getString("Address") + ", " + resultSet.getString("City") + ", " + resultSet.getString("Postcode") %></td>
                        <td><%= resultSet.getString("Phone") %></td>
                        <td><%= resultSet.getString("status") %></td>
                        <td><a href="./userDelete?id=<%= resultSet.getString("user_id")%>" class="btn btn-danger">Delete</a></td>
                    </tr>
                    <% 
                            }
                            db.disconnect();
                        } catch(Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
                </div></div></div></div></div></div></div>
    </div>   
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>