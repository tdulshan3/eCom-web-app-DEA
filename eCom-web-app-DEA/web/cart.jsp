<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="adminpackage.Dbcon" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.*" %>
<%@page import="javax.naming.*" %>
<%@page import="javax.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style1.css" rel="stylesheet">
    </head>
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                <tr>
                    <th>No</th>
                    <th>Product</th>
                    <th>Availability</th>
                    <th>Product price</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
               <tbody class="align-middle">
        <%
            int price, qty, cartId, total=0;
            String productName, cartDetails, ava, userId="0";
            Dbcon dbConn = new Dbcon();
            dbConn.connect();
            if (userId.equals("0")){
                
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("cart_details")) {
                            cartDetails = cookie.getValue();
                            out.println(cartDetails);
                            String[] pairs = cartDetails.split("/");
                            Integer i=0;
                            for (String pair : pairs) {
                                i++;
                                String[] parts = pair.split(":");
                                int productId = Integer.parseInt(parts[0]);
                                int quantity = Integer.parseInt(parts[1]);
                                ResultSet rsProduct =dbConn.executeQuery("SELECT name, price, quantity FROM products WHERE product_id=" +productId);
                                if(rsProduct.next()){
                                    productName = rsProduct.getString("name");
                                    price = rsProduct.getInt("price");
                                    total+=price;
                                    qty = rsProduct.getInt("quantity");
                                    if (qty==0){
                                        ava = "outofstock";
                                    } else{
                                        ava = "instock";      
                                    }
                                    out.print("<tr><td>"+Integer.toString(i)+"</td><td>"+productName+"</td><td>"+ava+"</td><td>"+price+"</td><td>"+quantity+"</td><td>"+price*quantity+"</td><td><form action='DelCartItemUnreg' method='post'><input type='hidden' name='itemDetails' value='" + productId +":"+quantity+"'><input type='submit' value='Delete'></form></td></tr>");
                                }
                            }
                    out.print("<form action='DelCartUnReg' method='post'><input type='submit' value='Delete All'></form>");
                    out.print("Total "+Integer.toString(total));
                            break;
                        }
                    }
                }
                

            } else{
                ResultSet rsCart = dbConn.executeQuery("SELECT cart_id, cart_details FROM cart WHERE user_id= " +userId);
                if(rsCart.next()){
                    cartDetails = rsCart.getString("cart_details");
                    cartId = rsCart.getInt("cart_id");
                    String[] pairs = cartDetails.split("/");
                    Integer i=0;
                    for (String pair : pairs) {
                        i++;
                        String[] parts = pair.split(":");
                        int productId = Integer.parseInt(parts[0]);
                        int quantity = Integer.parseInt(parts[1]);
                        ResultSet rsProduct =dbConn.executeQuery("SELECT name, price, quantity FROM products WHERE product_id=" +productId);
                        if(rsProduct.next()){
                            productName = rsProduct.getString("name");
                            price = rsProduct.getInt("price");
                            total+=price;
                            qty = rsProduct.getInt("quantity");
                            if (qty==0){
                                ava = "outofstock";
                            } else{
                                ava = "instock";      
                            }
                            out.print("<tr><td>"+Integer.toString(i)+"</td><td>"+productName+"</td><td>"+ava+"</td><td>"+price+"</td><td>"+quantity+"</td><td>"+price*quantity+"</td><td><form action='DeleteCartItem' method='post'><input type='hidden' name='itemDetails' value='" + productId +":"+quantity+"'><input type='submit' value='Delete'></form></td></tr>");
                        }
                    }
                    out.print("<form action='deleteCart' method='post'><input type='hidden' name='cartId' value='" + cartId + "'><input type='submit' value='Delete All'></form>");
                    out.print("Total "+Integer.toString(total));
                }
            }
        %>
            </tbody>
        </table>
          </div>
        <div class="col-lg-4">
               
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium"><%= total %></h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">$160</h5>
                        </div>
                        <form action="CheckoutRegservlet" method="post">   
            <input type="submit" class="btn btn-block btn-primary my-3 py-3" value="Proceed To Checkout">
        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
        
        
   
<!--<%-- 
    Document   : productMain
    Created on : Apr 18, 2024, 3:30:19 PM
    Author     : Madushani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Laptops</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">

    <!--Main Style Sheet-->
    <link rel="stylesheet" href="css/mainProduct.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="packages/jQuery/jQuery-2.1.4.min.js"></script>
        <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>  
</head>
<body>

    <!-- ty-mainWrap.start -->
    <div class="ty-mainWrap">
        <div class="ty-offCanvasNav">
            <button class="ty-catNav-trigger-close"><span><i class="fa fa-times" aria-hidden="true"></i></span></button>

            <h2>Catergories</h2>
            
        </div>


        <!-- ty-overlay-trigger.start -->
        <div class="ty-overlay-trigger ty-catNav-trigger-close"></div>


        <!-- ty-contentWrap.start -->
        <div class="ty-contentWrap container-fluid">
            <!-- ty-content.start -->
            <div class="ty-content col-xs-12 clearfix">
                <!-- ty-gameBG.start -->
                <div class="ty-gameBG">
                   
                </div>

                <div class="ty-push">
                    <!-- ty-mainContent.start -->
                    <div class="ty-mainContent">

                        <!-- ty-pageContentWrap.start -->
                        <section class="ty-pageContentWrap">
                            <a href="#showHere"></a>

                            <%@ include file="sidebar.jsp" %>
                            <!-- ty-pageContent.start -->
                            <div class="ty-pageContent">
                                <!-- ty-pageTitle.start -->
                                <div class="ty-catPageTitle-cat">
                                    <h1>Laptops</h1>

                                    <ul class="ty-catPage-baseFilters">
                                        <li class="active"><button data-value="all">All</button></li>
                                    </ul>
                                </div>

                                <!-- ty-catPage-productWrap.start -->
                                <section class="ty-catPage-productWrap ">

                                    <!-- ty-catPage-filters.start -->
                                    <div class="ty-catPage-filters">
                                        <div class="ty-catPage-filters-triggerWrap">
                                            <button id="ty-catPage-filters-trigger">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </button>
                                        </div>

                                        <!-- ty-catPage-filterWrap.start -->
                                        <div class="ty-catPage-filterWrap">
                                            <div class="ty-catPage-filter-priceRange-sliderWrap">
                                                <span>
                                                    <label for="ty-priceRange">Price</label>
                                                    <input type="text" class="ty-priceRange" id="ty-priceRange"
                                                        readonly>
                                                </span>

                                                <div class="ty-catPage-priceRange-sliderHolder">
                                                    <div data-min="3500" data-max="1679001" data-suffix="LKR"
                                                        class="ty-catPage-priceRange-slider"></div>
                                                </div>
                                            </div>

                                            
                                            
                                            <div class="ty-filterListWrap" data-attribute-id="20">
                                                <h4>MANUFACTURER</h4>
                                                <ul class="ty-filterList ty-one">
                                                    <li class="ty-filterListItem">
                                                        <input class="ty-filterListItem-input" type="checkbox"
                                                            id="attr-option-20|0" value="Acer">
                                                        <label for="attr-option-20|0"
                                                            class="ty-filterListItem-label">Acer</label>
                                                    </li>
                                                    
                                                </ul>
                                            </div>
                                            <!-- ty-filterListWrap.start -->
                                            <div class="ty-filterListWrap" data-attribute-id="96">
                                                <h4>Specs</h4>
                                                <ul class="ty-filterList ty-one">
                                                    <!-- ty-filterListItem.start -->
                                                    <li class="ty-filterListItem">
                                                        <input class="ty-filterListItem-input" type="checkbox"
                                                            id="attr-option-96|0" value="14 INCHES">
                                                        <label for="attr-option-96|0" class="ty-filterListItem-label">14
                                                            INCHES</label>
                                                    </li>
                                                    
                                                </ul>
                                            </div>
                                        </div>
                                        
                                    </div>





                                    <div >
                                        <ul >
                                            <!-- ty-catPage-productListItem.start -->
                                            
                                            <div class="section__content">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="filter__grid-wrapper u-s-m-t-30">
                                                                <div class="row">
                                                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item headphone">
                                                                        <div class="product-o product-o--hover-on product-o--radius">
                                                                            <div class="product-o__wrap">
                                            
                                                                                <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">
                                            
                                                                                    <img class="aspect__img" src="https://www.nanotek.lk/uploads/product/127-20240314173757-e69d5f40b185a1f5c347924cbcdc2179_800x800.png" alt=""></a>
                                                                                
                                                                            </div>
                                            
                                                                            <span class="product-o__category">
                                            
                                                                                <a href="shop-side-version-2.html">Electronics</a></span>
                                            
                                                                            <span class="product-o__name">
                                            
                                                                                <a href="product-detail.html">Yellow Wireless Headphone</a></span>
                                                                            
                                            
                                                                            <span class="product-o__price">$125.00
                                            
                                                                                <span class="product-o__discount">$160.00</span></span>
                                                                        </div>
                                                                    </div>
                                            
                                                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item headphone">
                                                                        <div class="product-o product-o--hover-on product-o--radius">
                                                                            <div class="product-o__wrap">
                                            
                                                                                <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">
                                            
                                                                                    <img class="aspect__img" src="https://www.nanotek.lk/uploads/product/127-20240314173757-e69d5f40b185a1f5c347924cbcdc2179_800x800.png" alt=""></a>
                                                                                
                                                                            </div>
                                            
                                                                            <span class="product-o__category">
                                            
                                                                                <a href="shop-side-version-2.html">Electronics</a></span>
                                            
                                                                            <span class="product-o__name">
                                            
                                                                                <a href="product-detail.html">Yellow Wireless Headphone</a></span>
                                                                            
                                            
                                                                            <span class="product-o__price">$125.00
                                            
                                                                                <span class="product-o__discount">$160.00</span></span>
                                                                        </div>
                                                                    </div>
                                            
                                                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item headphone">
                                                                        <div class="product-o product-o--hover-on product-o--radius">
                                                                            <div class="product-o__wrap">
                                            
                                                                                <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">
                                            
                                                                                    <img class="aspect__img" src="https://www.nanotek.lk/uploads/product/127-20240314173757-e69d5f40b185a1f5c347924cbcdc2179_800x800.png" alt=""></a>
                                                                                
                                                                            </div>
                                            
                                                                            <span class="product-o__category">
                                            
                                                                                <a href="shop-side-version-2.html">Electronics</a></span>
                                            
                                                                            <span class="product-o__name">
                                            
                                                                                <a href="product-detail.html">Yellow Wireless Headphone</a></span>
                                                                            
                                            
                                                                            <span class="product-o__price">$125.00
                                            
                                                                                <span class="product-o__discount">$160.00</span></span>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--<div class="col-lg-12">
                                                            <div class="load-more">
                                            
                                                                <button class="btn btn--e-brand" type="button">Load More</button></div>
                                                        </div>
                                                    </div>-->
                                                </div>
                                            </div>
                                        </ul>
                                    </div>

                                </section>
                            </div>
                        </section>
                    </div><!-- ty-mainContent.end -->
                </div><!-- ty-push.end -->
            </div><!-- ty-content.end -->
        </div><!-- ty-contentWrap.end -->


        
    </div><!-- ty-mainWrap.end -->
    
    <script src="js/guest/category.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js'></script><script  src="./script.js"></script>
</body>
</html>


