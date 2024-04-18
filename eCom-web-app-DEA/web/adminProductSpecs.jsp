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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="./admin.css" rel="stylesheet">
    </head>
    <body>
            <%
         Authentication.redirectIfNotAuthenticated(request, response);
        %>
        <div class="d-flex " style="min-height: 100vh;"> 
            <%@ include file="./component/adminSidebar.html" %>
            <div class="container mt-4">
                <div class="container"> 
                     <div class="card" style="max-width: 800px; margin: 5rem auto;">
                     <div class="card-body">
                        <%
                            int productId = Integer.parseInt(request.getParameter("product_id"));
                            Dbcon dbConnector = new Dbcon();
                            dbConnector.connect();
                            try {
                                ResultSet rs = dbConnector.executeQuery("SELECT * FROM products WHERE product_id=" + productId);
                                if (rs.next()) {
                                    String ProductName = rs.getString("name");
                                    int categoryId = rs.getInt("category_id");
                                    ResultSet rs1 = dbConnector.executeQuery("SELECT * FROM spces_type WHERE category_id=" + categoryId);
                                    while (rs1.next()) {
                                        String SpecsTypeName = rs1.getString("spec_type_name");
                                        int SpecsTypId = rs1.getInt("spces_type_id");
                        %>
                        <div class="form-group mb-3">
                            <label for="<%=SpecsTypId%>"><%=SpecsTypeName%></label>
                            <select class="form-control" id="<%=SpecsTypId%>" name="<%=SpecsTypId%>">
                                <option value="" selected disabled>-- Select <%= SpecsTypeName%> --</option>
                                <%
                                    ResultSet rs2 = dbConnector.executeQuery("SELECT * FROM specs WHERE specs_type_id =" + SpecsTypId);
                                    while (rs2.next()) {
                                        int SpecId = rs2.getInt("id");
                                        String SpecsName = rs2.getString("spec_name");
                                %>
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
        document.getElementById('submitButton').addEventListener('click', function () {
            var selectElements = document.querySelectorAll('select');
            var url = './ProductSpecsAdd?id=<%=productId%>&spec=';
            var params = [];
            selectElements.forEach(function (selectElement) {
                var selectId = selectElement.id;
                var selectedOption = selectElement.options[selectElement.selectedIndex];
                if (selectedOption.value !== '') {
                    params.push(selectId + ':' + selectedOption.value + ';');
                }
            });
            url += params.join();
            window.location.href = url;
        });
    </script>
</body>
</html>