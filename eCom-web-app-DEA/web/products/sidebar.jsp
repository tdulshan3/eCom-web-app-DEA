<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<div class="ty-cat">
    <ul class="ty-catList">
         <li class="ty-catListItem">
                <a href="/eCom-web-app-DEA/products/productsMain.jsp">
                    <div class="ty-catContent">
                        <div class="ty-catIconWrap"></div>
                        <div class="ty-catTitle">
                             <span>All Products</span>
                        </div>
                    </div>
                </a>
            </li>
    
<% 
    try {
        Dbcon dbConnector = new Dbcon();
        dbConnector.connect();
        //getting all details from category table and render them as list items
        ResultSet rs = dbConnector.executeQuery("SELECT * FROM category ORDER BY category_name ASC");

        while (rs.next()) {
            String categoryId = rs.getString("category_id");
            String categoryName = rs.getString("category_name");
%>
            <!-- ty-catListItem.start -->
            <li class="ty-catListItem">
                <a href="/eCom-web-app-DEA/products/productsMain.jsp?cat=<%=categoryId%>">
                    <div class="ty-catContent">
                        <div class="ty-catIconWrap"></div>
                        <div class="ty-catTitle">
                             <span><%= categoryName %></span>
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