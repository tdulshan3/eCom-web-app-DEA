<%@ page import="adminpackage.UserSession" %>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Product</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <!--Main Style Sheet-->
        <link rel="stylesheet" href="./products/css/main.css">
        <link rel="stylesheet" href="./products/css/font-awesome.min.css">
        <link rel="stylesheet" href="./products/css/mainProduct.css">
        <link rel="stylesheet" href="./products/css/main.css">
        <link rel="stylesheet" href="./products/css/font-awesome.min.css">
        <script src="./products/packages/jQuery/jQuery-2.1.4.min.js"></script>
        <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--scripts-->
        <script src="packages/jQuery/jQuery-2.1.4.min.js"></script>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
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
                            <!-- ty-pageContentWrap.start -->
                            <section class="ty-pageContentWrap">
                                <a href="#showHere"></a>
                                <%@ include file="./products/sidebar.jsp" %>
                                <!-- ty-pageContent.start -->
                                <div class="ty-cat">

                                </div>
                                <div class="ty-pageContent">
                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <video class="top-video" autoplay muted loop>
                                                    <source class="d-block w-100" src="hp-hero-dualchamber.webm" type="video/mp4">
                                                </video>

                                            </div>
                                            <div class="carousel-item">
                                                <video class="top-video" autoplay muted loop>
                                                    <source class="d-block w-100" src="hp_icue-link-hx.webm" type="video/mp4">

                                                </video>
                                            </div>
                                            <div class="carousel-item">
                                                <video class="top-video" autoplay muted loop>
                                                    <source class="d-block w-100" src="hp-loop-k65-plus-wl.webm" type="video/mp4">

                                                </video>
                                            </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>




                                    <div class="content-home-pro">                                          
                                        <h1 class="ty-productTitle-home">
                                            Featured Products
                                            <span class="half-line-home"></span>
                                        </h1>
                                        
                                        <div class="container">
                                            <div class="row row-cols-lg-3 row-cols-md-2 ">

                                                <%  try {
                                                        Dbcon dbConnector = new Dbcon();
                                                        dbConnector.connect();
                                                        ResultSet rs = dbConnector.executeQuery("SELECT * FROM products");

                                                        while (rs.next()) {
                                                            String id = rs.getString("product_id");
                                                            String name = rs.getString("name");
                                                            double price = rs.getDouble("price");

                                                %>
                                                <div class="col-lg-4 col-md-6 mb-4">
                                                    <div class="box">  
                                                        <div class="product-card">
                                                            <img class="product-image" src="./uploads/<%= rs.getString("img_path")%>" alt="">
                                                            <div class="product-info">
                                                                <a style="color:black;text-decoration:none;" href="productSingle.jsp?id=<%=id%>"> <h4 class="product-title"><%=name%></h4></a>
                                                                <div class="product-price">LKR <%=price%></div>
                                                                <form action="../cart" method="post">
                                                                    <input type="hidden" name="p_id" value=<%=id%> />
                                                                    <input type="hidden" name="qty" value="1"/>              
                                                                    <input type="submit" class="plus-btn-a" value="+"/>
                                                                </form>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                        }
                                                        dbConnector.disconnect(); // Close the database connection after use
                                                    } catch (Exception e) {
                                                        e.printStackTrace(); // Handle any exceptions
                                                    }
                                                %>
                                            </div>
                                        </div>

                                    </div>
                                </div>



                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--scripts--><script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="./products/js/app.js"></script>
        <script src="./products/packages/sequence/sequence.min.js"></script>
    </body>
</html>