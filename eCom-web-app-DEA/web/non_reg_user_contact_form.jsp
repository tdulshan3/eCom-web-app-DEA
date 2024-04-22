
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style1.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Checkout</p>
            </div>
        </div>
    </div>
        <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                    <div class="row">
        <form action="CheckoutServletUnreg" method="POST" >
        <div class="col-md-6 form-group">
            <label>Email</label>
            <input class="form-control" type="email" id="email" name="email"  required/>
        </div>
            <div class="col-md-6 form-group">
                <label>First Name</label>
            <input class="form-control" type="text" id="firstname" name="firstname"  required>
             </div>
            <div class="col-md-6 form-group">
                <label>Last Name</label>
            <input class="form-control" type="text" id="lastname" name="lastname"  required/>
             </div>
            <div class="col-md-6 form-group">
                <label>Home Address</label>
            <input class="form-control" type="text" id="address" name="address"  required/>
             </div>
            <div class="col-md-6 form-group">
                <label>Town/City</label>
            <input class="form-control" type="text" id="townCity" name="towncity"  required/>
             </div>
            <div class="col-md-6 form-group">
                <label>Postcode/zip</label>
            <input class="form-control" type="number" id="postcode" name="postcode" required/>
             </div>
            <div class="col-md-6 form-group">
                 <label>Mobile number</label>
            <input class="form-control" type="tel" id="pnumber"  name="pnumber" required/>
             </div>
            <div class="col-md-6 form-group">

                        
                                                </div>
                    </div>
                </div>
            </div><div class="col-lg-4">
                        <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Payment</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                                <label class="custom-control-label" for="directcheck">Direct Check</label>
                            </div>
                        </div>
                        <div class="">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="banktransfer">
                                <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <input type="submit" value="Place Order" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">
                    </div>
                            
            
        </form>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
