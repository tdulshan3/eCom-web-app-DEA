

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="cart" method="post">
            <input type="hidden" name="p_id" value="9" />
            <input type="number" name="qty" value="1"/>
            <input type="submit" value="add to cart">
        </form>
        <form action="cart" method="post">
            <input type="hidden" name="p_id" value="10" />
            <input type="number" name="qty" value="1"/>
            <input type="submit" value="add to cart">
        </form>
    </body>
</html>
