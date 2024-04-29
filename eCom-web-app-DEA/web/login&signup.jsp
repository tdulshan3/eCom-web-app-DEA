<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
        ></script>
        <link rel="stylesheet" href="style.css" />
        <link rel="icon" type="image/png" sizes="32x32" href="16.png">
        <link rel="icon" type="image/png" sizes="16x16" href="32.png">
        <title>Sign in & Sign up Form</title>
    </head>
    <body>
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="./Logins" method="post" class="sign-in-form">
                        <h2 class="title">Sign in</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="Email" name="Email" placeholder="Username"  autocomplete="xyz123"/>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password" placeholder="Password" autocomplete="new-password"/>
                        </div>
                        <input type="submit" value="Login" class="btn solid" />
                        <% 
                //getting an attribute from Logins.java servlet
                String errorMessage = (String) request.getAttribute("errorMessage");
                String errorMessage1 = (String) request.getAttribute("errorMessage1");
                //if there an error this will display it
                if (errorMessage != null) {%>
                        <p style="color: red;"><%= errorMessage%></p>
                        <% } %>
                    </form>
                    <form action="Signup" method="post" class="sign-up-form">
                        <h2 class="title">Sign up</h2>
                        <div class="secnd">
                            <i class=""></i>
                            <input type="email" id="email" name="email" placeholder="E-mail" required  autocomplete="xyz123">
                        </div>
                        <div class="secnd">
                            <i class=""></i>
                            <input type="password" id="password" name="password1" placeholder="password" oninput="checkPasswordStrength(this.value)" required autocomplete="new-password">
                        </div>
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
                        <div class="secnd">
                            <i class=""></i>
                            <input type="password" id="password2" name="password2" placeholder="Retype Password *" required>
                        </div>
                        <div class="secnd">
                            <i class=""></i>
                            <input type="text" id="firstname" name="firstname" placeholder="Firstname*" maxlength="12" required>
                        </div>
                        <div class="secnd">
                            <i class=""></i>
                            <input type="text" id="lastname" name="lastname" placeholder="Lastname*" maxlength="15" required>
                        </div>
                        <div class="secnd">
                            <i class=""></i>
                            <input type="text" id="address" name="address" placeholder="Home Address*" maxlength="20" required>
                        </div>
                        <div class="secnd">
                            <i class=""></i>
                            <input type="text" id="townCity" name="towncity" placeholder="Town/City*" maxlength="20" required>
                        </div>
                        <div class="secnd">
                            <i class=""></i>
                            <input type="number" id="postcode" name="postcode" placeholder="Postcode/zip*" maxlength="15" required><br>
                        </div>
                        <div class="secnd">
                            <i class=""></i>
                            <input type="tel" id="pnumber" placeholder="Mobile number*" name="pnumber"><br>
                        </div>
                        <input type="submit" class="btn" value="SIGN UP" />
                        <%
                //if there an error message this will display it
                if (errorMessage1 != null) {%>
                        <p style="color: red;"><%= errorMessage1%></p>
                        <% }%>
                    </form>
                </div>
            </div>

            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>New here ?</h3>
                        <p>
                            Create your account and unlock exclusive benefits. Start exploring our platform now!
                        </p>
                        <button class="btn transparent" id="sign-up-btn">
                            Sign up
                        </button>
                    </div>
                    <img src="log.svg" class="image" alt="" />
                </div>
                <div class="panel right-panel">
                    <div class="content">
                        <h3>One of us ?</h3>
                        <p>
                            Log in to access your account securely and effortlessly. Your journey continues here.
                        </p>
                        <button class="btn transparent" id="sign-in-btn">
                            Sign in
                        </button>
                    </div>
                    <img src="register.svg" class="image" alt="" />
                </div>
            </div>
        </div>
        <script>
        //this assign the url parameter to formParam  const variable
            const formParam = '<%= request.getAttribute("formParam")%>';
                    const container = document.querySelector(".container");
                    const signInBtn = document.querySelector("#sign-in-btn");
                    const signUpBtn = document.querySelector("#sign-up-btn");
        //this function will show signing form to user
                    function showSignInForm() {
                        container.classList.remove("sign-up-mode");
                    }
        //this function will show signup form to user  
            function showSignUpForm() {
                container.classList.add("sign-up-mode");
            }
        //this will change the form according to the browser url parameter
            if (formParam === 'signup') {
                showSignUpForm();
            } else {
                showSignInForm();
            }

            signInBtn.addEventListener("click", showSignInForm);
            signUpBtn.addEventListener("click", showSignUpForm);
        </script>

    </body>
</html>
