
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="CheckoutServletUnreg" method="POST" >
        
            <input type="email" id="email" name="email" placeholder="E-mail" required/>
            <input type="text" id="firstname" name="firstname" placeholder="Firstname*" maxlength="12" required>
            <input type="text" id="lastname" name="lastname" placeholder="Lastname*" maxlength="15" required/>
            <input type="text" id="address" name="address" placeholder="Home Address*" maxlength="20" required/>
            <input type="text" id="townCity" name="towncity" placeholder="Town/City*" maxlength="20" required/>
            <input type="number" id="postcode" name="postcode" placeholder="Postcode/zip*" required/>
            <input type="tel" id="pnumber" placeholder="Mobile number*" name="pnumber" required/>
            <input type="submit">
            
        </form>
    </body>
</html>
