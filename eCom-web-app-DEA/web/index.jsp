
<%-- 
    Document   : index.jsp
    Created on : Apr 2, 2024, 10:00:57 PM
    Author     : tduls
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.UserSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
     <%@ include file="./nav,about/navbar.jsp" %>
<%
    String userId = UserSession.getUserIdFromSession(request);

%>
    <p>User ID: <%= userId %></p>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
