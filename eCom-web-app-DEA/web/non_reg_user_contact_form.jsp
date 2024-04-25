<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout Page</title>
        <link rel="stylesheet" href="./products/css/main.css">
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container-form">
            <div class="left-container">
                <!-- Content for the left container -->
                <h2 class="form-title">Billing Information</h2>
                <form action="CheckoutServletUnreg" method="POST" class="checkout-form">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="firstname">First Name</label>
                        <input type="text" id="firstname" name="firstname" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Home Address</label>
                        <input type="text" id="address" name="address" required>
                    </div>
                    <div class="form-group">
                        <label for="townCity">Town/City</label>
                        <input type="text" id="townCity" name="towncity" required>
                    </div>
                    <div class="form-group">
                        <label for="postcode">Postcode/ZIP</label>
                        <input type="text" id="postcode" name="postcode" required>
                    </div>
                    <div class="form-group">
                        <label for="pnumber">Mobile Number</label>
                        <input type="tel" id="pnumber" name="pnumber" required>
                    </div>

            </div>
            
            <div class="right-container">
                <!-- Content for the right container -->
                
                <div class="payment-options">
            <h2>Payment</h2>
            <div class="form-group">
                <input type="radio" id="directcheck" name="payment">
                <label for="directcheck">Direct Check</label>
            </div>

            <div class="form-group">
                <input type="radio" id="banktransfer" name="payment">
                <label for="banktransfer">Bank Transfer</label>
            </div>

            <input type="submit" value="Place Order" class="submit-button">
        </div>
            
            </form>
            </div>
        </div>
    </body>
</html>
