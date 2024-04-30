<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Products</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="content-type" content="text/html; charset=utf-8">

        <!--Main Style Sheet-->
        
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="navbar.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="icon" type="image/png" sizes="32x32" href="16.png">
        <link rel="icon" type="image/png" sizes="16x16" href="32.png">
        <script src="packages/jQuery/jQuery-2.1.4.min.js"></script>
        <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>  
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%@ include file="../navbar.jsp" %>
        <%
            // Get the manufacturer parameter(s) from the URL
            String[] manufParams1 = request.getParameterValues("manu");
            Set<String> manuSet = manufParams1 != null ? new HashSet<String>(Arrays.asList(manufParams1)) : new HashSet<String>();

            // Get the specification parameter(s) from the URL
            String[] specParams1 = request.getParameterValues("sp");
            Set<String> specSet = specParams1 != null ? new HashSet<String>(Arrays.asList(specParams1)) : new HashSet<String>();
        %>
        <!-- ty-mainWrap.start -->
        <div class="ty-mainWrap">
            <div class="ty-offCanvasNav">
                <button class="ty-catNav-trigger-close"><span><i class="fa fa-times" aria-hidden="true"></i></span></button>
                <h2>Catergories</h2>
            </div>
            <!-- ty-overlay-trigger.start -->

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
                                        <% String catId = request.getParameter("cat"); %>
                                        <% if (catId == null || catId.isEmpty()) { %>
                                        <%-- if there no category parameter in url this will show all products as a title--%>
                                        <h1 style="text-align:center;">All Products</h1>

                                        <% } else {
                                            //if there catgory parameter then this will excute
                                            Dbcon dbConnector = new Dbcon();
                                            try {
                                                dbConnector.connect();
                                                //this will get category details from category table using category id
                                                String sql = "SELECT * FROM category WHERE category_id = " + catId;
                                                ResultSet rs = dbConnector.executeQuery(sql);
                                                if (rs.next()) {
                                                    String categoryName = rs.getString("category_name");
                                        %>
                                        <%-- after getting category name this will display it as a title--%>
                                        <h1 style="text-align:center;"><%=categoryName%></h1>

                                        <%}
                                                    dbConnector.disconnect();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            } %>
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
                                            <%-- this is filtering form--%>
                                            <form action="./productsMain.jsp" method="get">
                                                <% if (!(catId == null || catId.isEmpty())) {%>
                                                <%-- if there categoryid parameter this will make store it on hidden input to send it when form submit--%>
                                                <input type="hidden" name="cat" value="<%=catId%>"> 
                                                <%
                                                    } %>

                                                <span class="filt-btn"><button class="filter-btn" type="submit" >Filter</button></span>    
                                                <!-- ty-catPage-filterWrap.start -->
                                                <div class="ty-catPage-filterWrap">
                                                    <div class="ty-catPage-filter-priceRange-sliderWrap">
                                                        <span>
                                                            <label for="ty-priceRange">Price </label>
                                                            <input type="text" class="ty-priceRange" id="ty-priceRange"
                                                                   readonly>
                                                            <input type="hidden" name="Price" id="ty-priceRange" value="">
                                                        </span>

                                                        <div class="ty-catPage-priceRange-sliderHolder">
                                                            <div data-min="3500" data-max="1500000" data-suffix="LKR"
                                                                 class="ty-catPage-priceRange-slider"></div>
                                                        </div>
                                                    </div>



                                                    <div class="ty-filterListWrap" data-attribute-id="20">
                                                        <h4>MANUFACTURER</h4>

                                                        <ul class="ty-filterList ty-one">
                                                            <%
                                                                Dbcon dbConnector = new Dbcon();
                                                                try {
                                                                    dbConnector.connect();
                                                                    //this will get manufacture id of all products avilable with same category id from url paramter in products table
                                                                    String sql0 = "SELECT DISTINCT manufacturer_id FROM products WHERE category_id =" + catId;
                                                                    ResultSet rs0 = dbConnector.executeQuery(sql0);
                                                                    StringBuilder manuIds = new StringBuilder();
                                                                    while (rs0.next()) {
                                                                        //add those manufacture ids to string
                                                                        manuIds.append(rs0.getInt("manufacturer_id")).append(",");
                                                                    }
                                                                    rs0.close();
                                                                    if (manuIds.length() > 0) {
                                                                        manuIds.setLength(manuIds.length() - 1);
                                                                    }

                                                                    String sqlToExecute;
                                                                    String sqlx = "SELECT * FROM `manufacturer`";
                                                                    String sql = "SELECT * FROM `manufacturer` WHERE manufacturer_id IN (" + manuIds + ")";
                                                                    //if manuid string legth is 0 this will get all manufactures from manufacture table
                                                                    if (manuIds.length() <= 0) {
                                                                        sqlToExecute = sqlx;
                                                                    } else {
                                                                        //else this will only get manufatures who have product in that category 
                                                                        sqlToExecute = sql;
                                                                    }

                                                                    ResultSet rs = dbConnector.executeQuery(sqlToExecute);
                                                                    while (rs.next()) {
                                                                        String manuName = rs.getString("manufacturer_name");
                                                                        int manuId = rs.getInt("manufacturer_id");
                                                            %>
                                                            <li>
                                                                <%-- chis will render checkbox according to the sql command and if we select them data send as a parameter--%>
                                                                <input type="checkbox" name="manu" class="ty-filterListItem-input" value="<%=manuId%>" <%= manuSet.contains(String.valueOf(manuId)) ? "checked" : ""%>>
                                                                <label class="ty-filterListItem-label"><%=manuName%></label>
                                                            </li>
                                                            <%}
                                                                    dbConnector.disconnect();
                                                                } catch (Exception e) {
                                                                    e.printStackTrace();
                                                                } %>
                                                        </ul>
                                                    </div>
                                                    <% if (!(catId == null || catId.isEmpty())) {
                                                            dbConnector.connect();
                                                    %> 
                                                    <!-- ty-filterListWrap.start -->
                                                    <div class="ty-filterListWrap">
                                                        <%
                                                            try {
                                                                dbConnector.connect();
                                                                //this will get all specstype in specstype table using category id as paramter
                                                                String sql = "SELECT * FROM `spces_type` WHERE category_id = " + catId;
                                                                ResultSet rs = dbConnector.executeQuery(sql);

                                                                while (rs.next()) {
                                                                    String specsName = rs.getString("spec_type_name");
                                                                    int specsId = rs.getInt("spces_type_id");
                                                        %>
                                                        <%-- now ths will render those data as a titles of filters--%>
                                                        <h4><%=specsName%></h4>

                                                        <ul class="ty-filterList ty-one">
                                                            <%
                                                                //this will get all specs in specs table using spectypeid from previos sql excute
                                                                String sql1 = "SELECT * FROM `specs` WHERE specs_type_id = " + specsId;
                                                                ResultSet rs1 = dbConnector.executeQuery(sql1);
                                                                while (rs1.next()) {
                                                                    String specName = rs1.getString("spec_name");
                                                                    int specId = rs1.getInt("id");
                                                            %>
                                                            <li>
                                                                <input type="checkbox" name="sp" class="ty-filterListItem-input" value="<%=specId%>" <%= specSet.contains(String.valueOf(specId)) ? "checked" : ""%>>
                                                                <label class="ty-filterListItem-label"><%=specName%></label>
                                                            </li>
                                                            <%
                                                                }
                                                                rs1.close();
                                                            %>
                                                        </ul>
                                                        <%
                                                                }
                                                                rs.close();
                                                                dbConnector.disconnect();
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            }
                                                        %>
                                                    </div>
                                                    <% }  %>
                                                </div>

                                            </form>
                                        </div>
                                </div>



                                <div class="content-pro">                                          

                                    <div class="container">
                                        <div class="row row-cols-lg-3 row-cols-md-2 ">
                                            <%                    try {

                                                    dbConnector.connect();
                                                    //this will a half written sql 
                                                    String query = "SELECT * FROM products WHERE 1=1";
                                                    //if there any catgoryid param this will add to that query
                                                    String catParam = request.getParameter("cat");
                                                    if (catParam != null && !catParam.isEmpty()) {
                                                        query += " AND category_id = " + catParam;
                                                    }
                                                    //if there any price param this will add to that query as a price range
                                                    String priceParam = request.getParameter("Price");
                                                    if (priceParam != null && !priceParam.isEmpty()) {
                                                        String[] prices = priceParam.split("-");
                                                        double minPrice = Double.parseDouble(prices[0].replace(" LKR", "").trim());
                                                        double maxPrice = Double.parseDouble(prices[1].replace(" LKR", "").trim());
                                                        query += " AND price BETWEEN " + minPrice + " AND " + maxPrice;
                                                    }
                                                    //if there any manufactureids param this will add to that query
                                                    String[] manufParams = request.getParameterValues("manu");
                                                    if (manufParams != null && manufParams.length > 0) {

                                                        query += " AND manufacturer_id IN (";
                                                        for (int i = 0; i < manufParams.length; i++) {
                                                            query += manufParams[i];
                                                            if (i < manufParams.length - 1) {
                                                                query += ", ";
                                                            }
                                                        }
                                                        query += ")";
                                                    }

                                                    // if there any specs parameters this will Get the specification parameter(s) and add them to query
                                                    String[] specParams = request.getParameterValues("sp");
                                                    if (specParams != null && specParams.length > 0) {
                                                        String regexPattern = "(^|,)(" + String.join("|", specParams) + ")(,|$)";
                                                        query += " AND specs REGEXP '" + regexPattern + "'";
                                                    }

                                                    ResultSet rs = dbConnector.executeQuery(query);

                                                    while (rs.next()) {
                                                        String id = rs.getString("product_id");
                                                        String name = rs.getString("name");
                                                        double price = rs.getDouble("price");

                                            %>
                                            
                                            <%-- this will render those data as a card--%>

                                            <div class="col-lg-4 col-md-6 mb-4">
                                                <a class="a-product" href="productSingle.jsp?id=<%=id%>">
                                                    <div class="box">

                                                        <div class="product-card1">
                                                            <img class="product-image" src="../uploads/<%= rs.getString("img_path")%>" alt="">
                                                            <div class="product-info">
                                                                <h4 class="product-title"><%=name%></h4>
                                                                <div class="product-price">LKR <%=price%></div>
                                                                <form action="../cart" method="post">
                                                                    <input type="hidden" name="p_id" value=<%=id%> />
                                                                    <input type="hidden" name="qty" value="1"/>              
                                                                    <input type="submit" class="plus-btn-a" value="+"/>
                                                                </form>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </a>               
                                            </div>
                                            <%
                                                    }
                                                    dbConnector.disconnect();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
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
                        <script src="js/app.js"></script>
                        <script src="js/guest/category.js"></script>
                        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
                        <script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js'></script><script  src="./script.js"></script>
                        </body>
                        </html>


