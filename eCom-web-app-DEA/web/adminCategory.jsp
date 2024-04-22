<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="d-flex">
            
            <%@ include file="./component/adminSidebar.html" %>

            <div class="container mt-4">
                <div class="text-center">
                    <button type="button" class="btn btn-primary" id="toggleButton">Add Category</button>
                </div>

                <br>

                <div id="addCategory" style="display: none;">
                    <%@ include file="./component/adminCategoryAdd.html" %>
                </div>

                <div id="showCategory">
                    <%@ include file="./component/adminCategoryShow.jsp" %>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
            
            document.getElementById("toggleButton").addEventListener("click", function () {
                var addCategory = document.getElementById("addCategory");
                var showCategory = document.getElementById("showCategory");
                var toggleButton = document.getElementById("toggleButton");

                if (toggleButton.innerText === "Add Category") {
                    addCategory.style.display = "block";
                    showCategory.style.display = "none";
                    toggleButton.innerText = "Show Category";
                } else {
                    addCategory.style.display = "none";
                    showCategory.style.display = "block";
                    toggleButton.innerText = "Add Category";
                }
            });
        </script>

    </body>
</html>