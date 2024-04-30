<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="adminpackage.Authentication" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="icon" type="image/png" sizes="32x32" href="16.png">
        <link rel="icon" type="image/png" sizes="16x16" href="32.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="./admin.css" rel="stylesheet">
    </head>
    <body>
        <%
            //check user admin or not using Authentication Class
            Authentication.redirectIfNotAuthenticated(request, response);
        %>
        <div class="d-flex " style="min-height: 100vh;"> 
            <%@ include file="./component/adminSidebar.html" %>
            <div class="container mt-4">
                <div class="container"> 
                    <div class="card" style="max-width: 800px; margin: 5rem auto;">
                        <div class="card-body">
                            <%
                                //getting product id from url paramters
                                int productId = Integer.parseInt(request.getParameter("product_id"));
                                //connecting db 
                                Dbcon dbConnector = new Dbcon();
                                dbConnector.connect();
                                try {
                                    //get details from products table using productid
                                    ResultSet rs = dbConnector.executeQuery("SELECT * FROM products WHERE product_id=" + productId);
                                    if (rs.next()) {
                                        String ProductName = rs.getString("name");
                                        int categoryId = rs.getInt("category_id");
                                        //getting each specstype of product from specs_type table using category id
                                        ResultSet rs1 = dbConnector.executeQuery("SELECT * FROM spces_type WHERE category_id=" + categoryId);
                                        while (rs1.next()) {
                                            String SpecsTypeName = rs1.getString("spec_type_name");
                                            int SpecsTypId = rs1.getInt("spces_type_id");
                            %>
                            <%-- rendering specstype as a select element--%>
                            <div class="form-group mb-3">
                                <label for="<%=SpecsTypId%>"><%=SpecsTypeName%></label>
                                <select class="form-control" id="<%=SpecsTypId%>" name="<%=SpecsTypId%>">
                                    <%-- empty option--%>
                                    <option value="" selected disabled>-- Select <%= SpecsTypeName%> --</option>
                                    <%
                                        //getting each specs of specstype from specs table using specs_type_id
                                        ResultSet rs2 = dbConnector.executeQuery("SELECT * FROM specs WHERE specs_type_id =" + SpecsTypId);
                                        while (rs2.next()) {
                                            int SpecId = rs2.getInt("id");
                                            String SpecsName = rs2.getString("spec_name");
                                            
                                    %>
                                    <%-- rendering specs as a options of select element--%>
                                    <option value="<%= SpecId%>"><%= SpecsName%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <%
                                        }
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            %>
                            <button id="submitButton" class="btn btn-primary">Submit</button>
                        </div></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    //when submit button click this will redirect user to ProductSpecsAdd Servlet with parameters 
    document.getElementById('submitButton').addEventListener('click', function () {
        var selectElements = document.querySelectorAll('select');
        var url = './ProductSpecsAdd?id=<%=productId%>&spec=';
        var params = [];
        selectElements.forEach(function (selectElement) {
            var selectId = selectElement.id;
            var selectedOption = selectElement.options[selectElement.selectedIndex];
            if (selectedOption.value !== '') {
                params.push(selectedOption.value);
            }
        });
        url += params.join();
        window.location.href = url;
    });
</script>
</body>
</html>