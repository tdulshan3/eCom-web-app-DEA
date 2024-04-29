<%-- 
    Document   : service
    Created on : Apr 18, 2024, 10:56:41 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/service.css">
        <link rel="icon" type="image/png" sizes="32x32" href="16.png">
        <link rel="icon" type="image/png" sizes="16x16" href="32.png">
        <title>Service</title>
    </head>
    <body>

        <%@ include file="../navbar.jsp" %>
        <div class="con">

            <h1><b class="white-text">SERVICES</b></h1>
            <div class="topic-container">
                <img src="images/warranty.png" width="39" height="41"> <span>Warranty</span>
            </div>
            <p class="topic-text">If your product is defective, we have a warranty and a reliable complaints procedure to ensure that your needs are addressed as quickly as possible. Most of our providers are local, so we can make sure that we can provide the best service according to the conditions below.</p>
            <h2><span class="list-text">Conditions</span></h2>
            <ul>
                <li>Warranties are only valid to the extent of the warranty and the supplier's terms and conditions.</li>
                <li>The warranty is only valid for the period stated on each line item on your invoice.</li>
                <li>The packaging with the serial number must be intact when making a complaint.</li>
                <li>The warranty covers manufacturing defects only.</li>
                <li>The warranty does not cover physical damage.</li>
                <li>The warranty is only valid to the extent of the proof of purchase provided. If this evidence is not there, no warranty can be claimed.
                </li>
                <li>The supplier reserves the right to exchange / return / repair or exchange with another model.</li>
            </ul>


            <div class="topic-container">
                <img src="images/customorder.png" width="39" height="41"> <span>Custom Orders</span>
            </div>
            <p class="topic-text">If your needs exceed what the local market offers, we provide support to meet those needs. We will continue to discover and meet these demands across the horizon. The following conditions apply.</p>
            <h2><span class="list-text">Conditions</span></h2>
            <ul>
                <li>To complete an individual order, a prepayment of 50% is required.</li>
                <li>Payments made for personal orders are non-refundable.</li>
            </ul>

            <div class="topic-container">
                <img src="images/homedeliver.png" width="39" height="41"> <span>Home Delivery</span>
            </div>
            <p class="topic-text">For easy access to your needs, we offer tailored delivery directly to your home within Sri Lankan borders. So far, we are also in touch with our valued customers in Jaffna. We guarantee that we are ready to deliver to any part of Sri Lanka subject to the following conditions.</p>
            <h2><span class="list-text">Conditions</span></h2>
            <ul>
                <li>100% full payment is required.</li>
                <li>Payment will be made directly to our bank account. Details available upon request.</li>
                <li>Delivery is entrusted to specialized delivery companies.</li>
            </ul>
        </div>
        <%@ include file="../footer.html" %>
    </body>
</html>

