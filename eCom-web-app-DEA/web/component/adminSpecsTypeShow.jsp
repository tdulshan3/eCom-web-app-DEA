<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Specification Type Table</title>

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            Dbcon dbConnector = new Dbcon();
            dbConnector.connect();
            // get all category details from category table using category id as a url parameter and show them in table
            ResultSet rs1 = dbConnector.executeQuery("SELECT * FROM category where category_id=" + request.getParameter("category_id"));
            if (rs1.next()) {
                String categoryName = rs1.getString("category_name");
        %>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h1 class="card-title text-center"><%= categoryName%> Specification Type Table</h1>
                    <div class="table-responsive">
                        <table class="table table-striped mx-auto">
                            <thead>
                                <tr>
                                    <th><%= categoryName%> Specification Type Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        // get all specstype details from specstyple table using category id as a url parameter and show them in table
                                        ResultSet rs = dbConnector.executeQuery("SELECT * FROM spces_type where category_id=" + request.getParameter("category_id"));
                                        while (rs.next()) {
                                            String specsTypeId = rs.getString("spces_type_id");
                                            String specsTypeName = rs.getString("spec_type_name");
                                %>
                                <tr>
                                    <td><%= specsTypeName%></td>
                                    <td>
                                        <a href="./adminSpecs.jsp?specsType_id=<%= specsTypeId%>" class="btn btn-dark">Show Specs Type</a>
                                        <a href="./SpecsTypeDelete?specsType_id=<%= specsTypeId%>" class="btn btn-danger">Delete</a>
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
        <%
            }
        %>
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
