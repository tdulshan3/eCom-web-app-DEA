<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<%@page import="adminpackage.Dbcon"%> 

<div class="card" style="max-width:900px; margin:auto;">
    <%
        try {
            Dbcon dbConnector = new Dbcon();
            dbConnector.connect();
            //getting categoryid as a url parameter and get category details using that categoryid 
            ResultSet rs = dbConnector.executeQuery("SELECT * FROM category where category_id=" + request.getParameter("category_id"));
            if (rs.next()) {
                String categoryName = rs.getString("category_name");
    %>
    <div class="card-header">
        Add Specifications to <%= categoryName%> 
    </div>
    <div class="card-body">
        <form method="post" action="./SpecsTypeAdd">
            <div class="form-group mb-3">
                <label for="Specs_name" class="mb-2">Specifications Type Name</label>
                <input type="text" class="form-control" id="Specs_name" name="Specs_name">
            </div>
            <input type="hidden" name="category_id" value="<%= request.getParameter("category_id")%>">
            <button type="submit" class="btn btn-primary">Add Specifications Type</button>
        </form>
    </div>
</div>
<%
        }
        rs.close();
        dbConnector.disconnect();
    } catch (Exception e) {

    }
%>
