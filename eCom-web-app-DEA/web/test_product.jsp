<%-- 
    Document   : test_product
    Created on : Apr 11, 2024, 6:23:44 PM
    Author     : tduls
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="cart" method="post">
            <input type="hidden" name="p_id" value="10" />
            <input type="number" name="qty" value="1"/>
            <input type="submit" value="add to cart">
        </form>
    </body>
</html>
