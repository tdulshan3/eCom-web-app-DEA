<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Products</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="content-type" content="text/html; charset=utf-8">

        <!--Main Style Sheet-->
        <link rel="stylesheet" href="css/mainProduct.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="packages/jQuery/jQuery-2.1.4.min.js"></script>
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
                    <div class="ty-gameBG">

                    </div>

                    <div class="ty-push">
                        <!-- ty-mainContent.start -->
                        <div class="ty-mainContent">
                           <%@ include file="navbar.jsp" %> 
                            <!-- ty-pageContentWrap.start -->
                            <section class="ty-pageContentWrap">
                                <%@ include file="sidebar.jsp" %>
                                <!-- ty-pageContent.start -->
                                <div class="ty-pageContent">
                                    <!-- ty-pageTitle.start -->
                                    <div class="ty-catPageTitle-cat">
                                        <% String catId = request.getParameter("cat"); %>
                                        <% if (catId == null || catId.isEmpty()) { %>
                                        <h1 style="text-align:center;">All Products</h1>

                                        <% } else {
                                            Dbcon dbConnector = new Dbcon();
                                             try{
                                            dbConnector.connect();
                                            String sql = "SELECT * FROM category WHERE category_id = " + catId;
                                            ResultSet rs = dbConnector.executeQuery(sql);
                                            if (rs.next()) {
                                                String categoryName = rs.getString("category_name");
                                        %>
                                                     <h1 style="text-align:center;"><%=categoryName  %></h1>

                                        <%}  dbConnector.disconnect(); 
                                } catch (Exception e) {
                                    e.printStackTrace(); 
                                }} %>
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
                                                                   value="Acer">
                                                            <label for="attr-option-20|0"
                                                                   class="ty-filterListItem-label">Acer</label>
                                                        </li>
                                                        <li class="ty-filterListItem">
                                                            <input class="ty-filterListItem-input" type="checkbox"
                                                                   value="Acer">
                                                            <label for="attr-option-20|0"
                                                                   class="ty-filterListItem-label">Acer</label>
                                                        </li>
                                                        <li class="ty-filterListItem">
                                                            <input class="ty-filterListItem-input" type="checkbox"
                                                                   value="Acer">
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
                                                                   value="14 INCHES">
                                                            <label for="attr-option-96|0" id="attr-option-17|5" class="ty-filterListItem-label">14
                                                                INCHES</label>
                                                        </li>
                                                        <li class="ty-filterListItem">
                                                            <input class="ty-filterListItem-input" type="checkbox"
                                                                   value="14 INCHES">
                                                            <label for="attr-option-96|2" class="ty-filterListItem-label">14
                                                                INCHES</label>
                                                        </li>
                                                        <li class="ty-filterListItem">
                                                            <input class="ty-filterListItem-input" type="checkbox"
                                                                   value="14 INCHES">
                                                            <label for="attr-option-96|3" class="ty-filterListItem-label">14
                                                                INCHES</label>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                </div>



                                <div class="content-pro">                                          

                                    <div class="container">
                                        <div class="row row-cols-lg-3 row-cols-md-2 ">
                                            <%                    try {
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
                                                        <img class="product-image" src="../uploads/<%= rs.getString("img_path")%>" alt="">
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

                                <div><div>
                                        </section>











                                    </div><!-- ty-mainContent.end -->

                                </div><!-- ty-push.end -->
                        </div><!-- ty-content.end -->
                    </div></div>



                        <script src="js/app.js"></script>
                        <script src="js/guest/category.js"></script>
                        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
                        <script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js'></script><script  src="./script.js"></script>
                        </body>
                        </html>


