<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout Page</title>
        <link rel="stylesheet" href="./products/css/main.css">
        <link rel="stylesheet" href="./products/css/mainProduct.css">
        <link rel="stylesheet" href="./products/css/font-awesome.min.css">
        <script src="./products/packages/jQuery/jQuery-2.1.4.min.js"></script>
        <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>  
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
    </head>
    <body>
        
        <!-- ty-mainWrap.start -->
        <div class="ty-mainWrap">
            <div class="ty-offCanvasNav">
                <button class="ty-catNav-trigger-close"><span><i class="fa fa-times" aria-hidden="true"></i></span></button>
            </div>
            <!-- ty-overlay-trigger.start -->
            <div class="ty-overlay-trigger ty-catNav-trigger-close"></div>
            <!-- ty-contentWrap.start -->
            <div class="ty-contentWrap container-fluid">
                <!-- ty-content.start -->
                <div class="ty-content col-xs-12 clearfix">
                    <!-- ty-gameBG.start -->
                    <div class="ty-gameBG"></div>
                    <div class="ty-push">
                        <!-- ty-mainContent.start -->
                        <div class="ty-mainContent">
                            <%@ include file="navbar.jsp" %>
                            <section class="ty-pageContentWrap">
                                <%@ include file="./products/sidebar.jsp" %>
                                <!-- ty-pageContent.start -->
                                <div class="ty-cat"></div>
                                <div class="ty-pageContent">
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
                                            <h2 class="form-title">Payment</h2>
                                            <div class="form-group">
                                                <input class="radio-bt" type="radio" id="directcheck" name="payment">
                                                <label for="directcheck">Direct Check</label>
                                            </div>
                                            <div class="form-group">
                                                <input class="radio-bt" type="radio" id="banktransfer" name="payment">
                                                <label for="banktransfer">Bank Transfer</label>
                                            </div>
                                            <div class="bt-wrap-sub">
                                                <input type="submit" value="Place Order" class="add-to-cart-btn">
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--scripts-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
