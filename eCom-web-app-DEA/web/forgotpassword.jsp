<%-- 
    Document   : ForgotPassword
    Created on : 02/04/2024, 12:13:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Forgot Password</title>
    <link rel="stylesheet" type="text/css" href="forgotpassword.css"> 
</head>
<body>
    <h1>Forgot Password ?</h1>
    <h3>Enter your email address to reset your password.</h3>
    <form action="PasswordResetServlet" method="post"> 
        Email address *<input type="email" name="email" placeholder="Email Address" required>
        <button type="submit">Reset Password</button><br>
    </form>
    <a href="Login.jsp">Return to Login</a> 
</body>
</html>
