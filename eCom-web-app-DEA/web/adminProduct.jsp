<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <style>
            .hidden {
                display: none;
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

            <div class="container mt-4">
                <%-- adding admin product adding forum--%>
                <div id="addProduct">
                    <%@ include file="./component/adminProductAdd.jsp" %>
                </div>

            </div>
        </div>
    </body>

</html>
