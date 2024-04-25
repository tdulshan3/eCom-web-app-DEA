
<%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <title>Product</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="content-type" content="text/html; charset=utf-8">

        <!--Main Style Sheet-->
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
        <!--scripts-->
        <script src="packages/jQuery/jQuery-2.1.4.min.js"></script>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <!-- ty-contentWrap.start -->
        <div class="ty-contentWrap container-fluid">
            <!-- ty-content.start -->
            <div class="ty-content col-xs-12 clearfix">
                <!-- ty-gameBG.start -->
                <div class="ty-gameBG">
                    <!--background image place-->
                </div>

                <div class="ty-push">
                    <!-- ty-mainContent.start -->
                    <div class="ty-mainContent">
                        <section class="ty-pageContentWrap">
                            <a href="#showHere"></a>




                            <%@ include file="sidebar.jsp" %>

                            <%  Dbcon dbConnector = new Dbcon();
                                dbConnector.connect();
                                int productId = Integer.parseInt(request.getParameter("id"));
                                try {
                                    ResultSet rs = dbConnector.executeQuery("SELECT * FROM products WHERE product_id =" + productId);
                                    if (rs.next()) {
                                        String name = rs.getString("name");
                                        String description = rs.getString("description");
                                        if (description.length() > 400) {
                                            description = description.substring(0, 400) + "...";
                                        }
                                        String specifications = rs.getString("specifications");
                                        if (specifications.length() > 400) {
                                            specifications = specifications.substring(0, 400) + "...";
                                        }
                                        double price = rs.getDouble("price");
                                        int categoryId = rs.getInt("category_id");
                                        int manufacturerId = rs.getInt("manufacturer_id");
                                        int quantity = rs.getInt("quantity");

                                        ResultSet rsCategory = dbConnector.executeQuery("SELECT category_name FROM category WHERE category_id = " + categoryId);
                                        String categoryName = "";
                                        if (rsCategory.next()) {
                                            categoryName = rsCategory.getString("category_name");
                                        }

                                        ResultSet rsManufacturer = dbConnector.executeQuery("SELECT manufacturer_name FROM manufacturer WHERE manufacturer_id = " + manufacturerId);
                                        String manufacturerName = "";
                                        if (rsManufacturer.next()) {
                                            manufacturerName = rsManufacturer.getString("manufacturer_name");
                                        }
                            %>
                            <div class="container">
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
                                        </div>
                                        <div class="ty-productPage-price ty-desktop-price">


                                            <div class="ty-productPage-quoteBtn-wrap">
                                                <h2 class="price">LKR <%=price%></h2>

                                                <form action="../cart" method="post">
                                                    <input type="hidden" name="p_id" value=<%=productId%> />
                                                    <input type="hidden" name="qty" value="1"/>              
                                                    <input type="submit" class="add-to-cart-btn" value="+ Add to Cart"/>
                                                   </form>
                                            </div>
                                        </div>
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

