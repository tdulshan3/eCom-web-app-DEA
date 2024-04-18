<%-- 
    Document   : Login
    Created on : 26/03/2024, 12:13:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Page</title>
            <link rel="stylesheet" type="text/css" href="register.css">
   
    </head>
    <body>
        <h1>Log In</h1>
        <h3>Welcome back! Sign in to your account. </h3>
             <form action="./Logins" method="post">
                 Username or email address *<input type="Email" name="Email" placeholder="Email" required>
                 Password *<input type="password" name="password" placeholder="Password" required>
                 <input type="checkbox" name="remember" value="">Remember me
                 <button type="submit">Login</button><br>
             <input type="button" name="createaccount" value="Create Account" onclick="window.location.href='Register.jsp';">
             
        </form>
    </body>
</html>
