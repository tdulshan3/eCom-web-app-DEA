<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<div class="ty-cat">
    <ul class="ty-catList">
<% 
    try {
        Dbcon dbConnector = new Dbcon();
        dbConnector.connect();
        ResultSet rs = dbConnector.executeQuery("SELECT * FROM category ORDER BY category_name ASC");

        while (rs.next()) {
            String categoryId = rs.getString("category_id");
            String categoryName = rs.getString("category_name");
%>
            <!-- ty-catListItem.start -->
            <li class="ty-catListItem">
                <a href="<%= categoryId %>.html"> <!-- Assuming categoryId corresponds to the page URL -->
                    <div class="ty-catContent">
                        <div class="ty-catIconWrap"></div>
                        <div class="ty-catTitle">
                            <a style="text-decoration:none;" href="productsMain.jsp?cat=<%=categoryId%>"> <span><%= categoryName %></span> </a>
                        </div>
                    </div>
                </a>
            </li>
            <!-- ty-catListItem.start -->
<%
        }
        dbConnector.disconnect(); // Close the database connection after use
    } catch (Exception e) {
        e.printStackTrace(); // Handle any exceptions
    }
%>
    </ul></div>