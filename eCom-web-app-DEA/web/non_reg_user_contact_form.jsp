<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout Page</title>
        <link rel="icon" type="image/png" sizes="32x32" href="16.png">
        <link rel="icon" type="image/png" sizes="16x16" href="32.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./products/css/main.css">
        <link rel="stylesheet" href="./products/css/mainProduct.css">
        <link rel="stylesheet" href="./products/css/font-awesome.min.css">
        <link href="style1.css" rel="stylesheet">
        <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>  
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container-fluid con1 mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="/eCom-web-app-DEA/">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Checkout</p>
                </div>
            </div>
        </div>
        <div class="card" style="max-width:900px; margin:auto;">
            <div class="card-header">
                Billing Information
            </div>
            <div class="card-body mb-10">
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
                        <label for="lastname">Last Name</label>
                        <input type="text" id="firstname" name="lastname" required>
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
           
            <div class="bt-wrap-sub ">
                <input type="submit" value="Place Order" class="btn btn-primary">
            </div>        </form>

                     </div>
    </div>
</div>

 <%@ include file="footer.html" %>
<!--scripts-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
