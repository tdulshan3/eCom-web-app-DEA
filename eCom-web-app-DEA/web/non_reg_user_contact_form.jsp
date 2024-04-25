<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" href="./products/css/font-awesome.min.css">
        <link rel="stylesheet" href="./products/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>

    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="containe">
            <div class="content">
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
                    <div class="image">
                    <div class="payment-options">
                        <h4>Payment</h4>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>
