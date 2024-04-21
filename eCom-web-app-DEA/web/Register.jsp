<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" type="text/css" href="register.css">
</head>
<body>
<center><h2>Register</h2></center>
<form action="Signup" method="post">
    <input type="email" id="email" name="email" placeholder="E-mail" required>
    <input type="password" id="password" name="password1" placeholder="password" oninput="checkPasswordStrength(this.value)" required>
    <div class="password-strength-meter">
        <div id="strength"></div>
    </div>
    <script>
    function checkPasswordStrength(password) {
        var strengthBar = document.getElementById("strength");
        var strength = 0;

        // Regular expressions to check for various conditions
        var regex = {
            lowerCase: /[a-z]/,
            upperCase: /[A-Z]/,
            numbers: /[0-9]/,
            specialChars: /[!@#$%^&*,.?":{}|<>]/,
            length: /.{8,}/
        };

        // Check  strength 
        strength += password.match(regex.lowerCase) ? 1 : 0;
        strength += password.match(regex.upperCase) ? 1 : 0;
        strength += password.match(regex.numbers) ? 1 : 0;
        strength += password.match(regex.specialChars) ? 1 : 0;
        strength += password.match(regex.length) ? 1 : 0;

        // Change color
        if (strength === 0) {
            strengthBar.className = "weak";
        } else if (strength <= 2) {
            strengthBar.className = "medium";
        } else {
            strengthBar.className = "strong";
        }

        
        strengthBar.style.width = ((strength / 3) * 100) + "%";
    }
</script>
    <input type="password" id="password2" name="password2" placeholder="Retype Password *" required>
    <input type="text" id="firstname" name="firstname" placeholder="Firstname*" maxlength="12" required>
    
    <input type="text" id="lastname" name="lastname" placeholder="Lastname*" maxlength="15" required>
    <input type="text" id="address" name="address" placeholder="Home Address*" maxlength="20" required>
    <input type="text" id="townCity" name="towncity" placeholder="Town/City*" maxlength="20" required>
    <input type="number" id="postcode" name="postcode" placeholder="Postcode/zip*" maxlength="15" required><br>
    <input type="tel" id="pnumber" placeholder="Mobile number*" name="pnumber"><br>
    <input type="submit" value="SIGN UP">
          <% String errorMessage = (String) request.getAttribute("errorMessage");
       if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>
</form>


</body>
</html>
