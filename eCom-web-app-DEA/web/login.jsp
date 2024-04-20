<%-- 
    Document   : login
    Created on : Apr 18, 2024, 11:11:17 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Page</title>
            <link rel="stylesheet" type="text/css" href="login.css">
   
    </head>
    <body>
        <h1>Log In</h1>
        <h3>Welcome back! Sign in to your account. </h3>
             <form action="./Logins" method="post">
                 <label>Username or email address *</label><input type="Email" name="Email" placeholder="Email" required>
                 <label>Password *</label><input type="password" name="password" placeholder="Password" required>
                 <input type="checkbox" name="remember" value=""><label>Remember me</label>
                 <button type="submit">Login</button><br>
<!--             <input type="button" name="createaccount" value="Create Account" onclick="window.location.href='Register.jsp';">-->
            <a href="register.jsp">Create Account</a>
        </form>
    </body>
</html>
