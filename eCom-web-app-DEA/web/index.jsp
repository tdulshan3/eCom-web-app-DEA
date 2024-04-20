
<%-- 
    Document   : index.jsp
    Created on : Apr 2, 2024, 10:00:57 PM
    Author     : tduls
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.UserSession" %>
<%
    String userId = UserSession.getUserIdFromSession(request);

%>
    <p>User ID: <%= userId %></p>
