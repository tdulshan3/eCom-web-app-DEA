<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<div class="d-flex">
    <%@ include file="./component/adminSidebar.html" %>
    <% String categoryId = request.getParameter("category_id"); %>

    <div class="container mt-4">
        <div class="text-center">
            <button type="button" class="btn btn-primary" id="toggleButton">Add Specs Type</button>
        </div>

        <br>

        <div id="addSpecsType" style="display: none;">
            <jsp:include page ="./component/adminSpecsTypeAdd.jsp" >
                <jsp:param name="category_id" value="<%= categoryId %>" />
            </jsp:include>
        </div>

        <div id="showSpecsType">
            <jsp:include page ="./component/adminSpecsTypeShow.jsp" >
            <jsp:param name="category_id" value="<%= categoryId %>"/>
            </jsp:include>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    document.getElementById("toggleButton").addEventListener("click", function () {
        var addSpecs = document.getElementById("addSpecsType");
        var showSpecs = document.getElementById("showSpecsType");
        var toggleButton = document.getElementById("toggleButton");

        if (toggleButton.innerText === "Add Specs Type") {
            addSpecs.style.display = "block";
            showSpecs.style.display = "none";
            toggleButton.innerText = "Show Specs Type";
        } else {
            addSpecs.style.display = "none";
            showSpecs.style.display = "block";
            toggleButton.innerText = "Add Specs Type";
        }
    });
</script>
</body>
</html>
