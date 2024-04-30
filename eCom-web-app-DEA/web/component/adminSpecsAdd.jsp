<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<%@page import="adminpackage.Dbcon"%> 

<div class="card" style="max-width:900px; margin:auto;">
    <%
        try {
            Dbcon dbConnector = new Dbcon();
            dbConnector.connect();
            //getting specstypeid form url parameter 
            int specsTypeId = Integer.parseInt(request.getParameter("specsType_id"));
            //selecting specstype details using specstype id
            ResultSet rs = dbConnector.executeQuery("SELECT * FROM spces_type where spces_type_id=" + specsTypeId);
            if (rs.next()) {
                String specsTypeName = rs.getString("spec_type_name");
                //getting categoryid from that details
                int categoryId = rs.getInt("category_id");
                //getting category name using that id we fetch previosly
                ResultSet rs1 = dbConnector.executeQuery("SELECT * FROM category where category_id=" + categoryId);
                if (rs1.next()) {
                    String categoryName = rs1.getString("category_name");
    %>
    <div class="card-header">
        Add  <%= specsTypeName%> to <%= categoryName%> Category
    </div>
    <div class="card-body">
        <form method="post" action="./SpecsAdd">
            <div class="form-group mb-3">
                <label for="Specs_name" class="mb-2"><%= specsTypeName%> Name</label>
                <input type="text" class="form-control" id="Specs_name" name="Specs_name">
            </div>
            <input type="hidden" name="specsType_id" value="<%= specsTypeId%>">
            <button type="submit" class="btn btn-primary">Add <%= specsTypeName%></button>
        </form>
    </div>
</div>
<%
            }
            rs1.close();
        }
        rs.close();
        dbConnector.disconnect();
    } catch (Exception e) {

    }
%>
