
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <title>Product</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="content-type" content="text/html; charset=utf-8">

        <!--Main Style Sheet-->
        <link rel="stylesheet" href="./products/css/font-awesome.min.css">
<link rel="icon" type="image/png" sizes="32x32" href="16.png">
<link rel="icon" type="image/png" sizes="16x16" href="32.png">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="packages/jQuery/jQuery-2.1.4.min.js"></script>
        <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--scripts-->
        <script src="packages/jQuery/jQuery-2.1.4.min.js"></script>

    </head>
    <body>
        
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
                           <%@ include file="../navbar.jsp" %>
                            <section class="ty-pageContentWrap">
                                <a href="#showHere"></a>



                                <%@ include file="sidebar.jsp" %>

                                <%  
                                    
                                    Dbcon dbConnector = new Dbcon();
                                    dbConnector.connect();
                                    //creating prooductid variable and asign a url parameter value to it
                                    int productId = Integer.parseInt(request.getParameter("id"));
                                    try {
                                        //getting products details from product table using productid variable 
                                        ResultSet rs = dbConnector.executeQuery("SELECT * FROM products WHERE product_id =" + productId);
                                        if (rs.next()) {
                                            
                                            String name = rs.getString("name");
                                            String description = rs.getString("description");
                                            //crop description length if its longer 
                                            if (description.length() > 400) {
                                                description = description.substring(0, 400) + "...";
                                            }
                                            //crop specification length if its longer 
                                            String specifications = rs.getString("specifications");
                                            if (specifications.length() > 400) {
                                                specifications = specifications.substring(0, 400) + "...";
                                            }
                                            double price = rs.getDouble("price");
                                            int categoryId = rs.getInt("category_id");
                                            

                                            //get category name fromc category table using product table category id
                                            ResultSet rsCategory = dbConnector.executeQuery("SELECT category_name FROM category WHERE category_id = " + categoryId);
                                            String categoryName = "";
                                            if (rsCategory.next()) {
                                                categoryName = rsCategory.getString("category_name");
                                            }

                                            
                                %>
                                <div class="container-main">
                                    <div class="content">
                                        <h1 class="ty-productTitle">
                                            <%=name%>
                                            <span class="half-line"></span>
                                        </h1>
                                        <h3 class="ty-productCategory"><%=categoryName%></h3>
                                        <div class="ty-productPage-content">
                                            <div class="ty-productPage-info">
                                                <p >
                                                    <%=description%>
                                                </p>
                                                <br>
                                                <p ><b>Specifications : </b><span style="font-size: 15px;"><%=specifications%></span></p>
                                            </div>

                                            <h2 class="price">LKR <%=price%></h2>

                                            <form action="../cart" method="post">
                                                <input type="hidden" name="p_id" value=<%=productId%> />
                                                <input type="hidden" name="qty" value="1"/>
                                                <input class="add-to-cart-btn" type="submit" value="+ Add to Cart" > 
                                            </form>
                                        </div>



                                    </div>

                                    <div class="image">
                                        <img src="../uploads/<%= rs.getString("img_path")%>" alt="">

                                    </div>
                                </div>
                                <%
                                        }
                                        dbConnector.disconnect(); // Close the database connection after use
                                    } catch (Exception e) {
                                        e.printStackTrace(); // Handle any exceptions
                                    }
                                %>
                            </section>
                        </div>
                        <!-- ty-mainContent.end -->

                    </div><!-- ty-push.end -->
                </div><!-- ty-content.end -->
            </div>
            <!-- ty-contentWrap.end -->
        </div>
        <!-- ty-mainWrap.end -->

        <!--scripts-->
        <script src="js/app.js"></script>
        <script src="packages/sequence/sequence.min.js"></script>

    </body>
</html>

