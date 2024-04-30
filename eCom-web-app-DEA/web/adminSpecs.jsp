<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<div class="d-flex">
    <%@ include file="./component/adminSidebar.html" %>
    <%-- getting parameter--%>
    <% String specsTypeId = request.getParameter("specsType_id"); %>

    <div class="container mt-4">
        <div class="text-center">
            <button type="button" class="btn btn-primary" id="toggleButton">Add Specs</button>
        </div>

        <br>

        <div id="addSpecs" style="display: none;">
            <%-- sending specstypeid parameter to a admin specs adding form jsp component--%>
            <jsp:include page ="./component/adminSpecsAdd.jsp" >
                <jsp:param name="specsType_id" value="<%= specsTypeId %>" />
            </jsp:include>
        </div>

        <div id="showSpecs">
            <%-- sending specstypeid parameter to a admin specs table jsp component--%>
            <jsp:include page ="./component/adminSpecsShow.jsp" >
            <jsp:param name="specsType_id" value="<%= specsTypeId %>"/>
            </jsp:include>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    //change form and table using button
    document.getElementById("toggleButton").addEventListener("click", function () {
        var addSpecs = document.getElementById("addSpecs");
        var showSpecs = document.getElementById("showSpecs");
        var toggleButton = document.getElementById("toggleButton");

        if (toggleButton.innerText === "Add Specs") {
            addSpecs.style.display = "block";
            showSpecs.style.display = "none";
            toggleButton.innerText = "Show Specs";
        } else {
            addSpecs.style.display = "none";
            showSpecs.style.display = "block";
            toggleButton.innerText = "Add Specs";
        }
    });
</script>
</body>
</html>
