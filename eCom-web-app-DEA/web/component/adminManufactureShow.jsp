<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manufacturer Table</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h1 class="card-title text-center">Manufacturer Table</h1>
                    <div class="table-responsive">
                        <table class="table table-striped mx-auto">
                            <thead>
                                <tr>
                                    <th>Manufacturer Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Dbcon dbConnector = new Dbcon();
                                        dbConnector.connect();
                                        // get all manufacturer details from manufacturer table and show them in table
                                        ResultSet rs = dbConnector.executeQuery("SELECT * FROM manufacturer");
                                        while (rs.next()) {
                                            String manufacturerId = rs.getString("manufacturer_id");
                                            String manufacturerName = rs.getString("manufacturer_name");
                                %>
                                <tr>
                                    <td><%= manufacturerName%></td>
                                    <td>
                                        <a href="./ManufacturerDelete?manufacturer_id=<%= manufacturerId%>" class="btn btn-danger">Delete</a>
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
