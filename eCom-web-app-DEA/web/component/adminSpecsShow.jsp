<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Specifications Table</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            Dbcon dbConnector = new Dbcon();
            dbConnector.connect();
            //make int variable by getting specstypeid paramter from url
            int specsTypeId = Integer.parseInt(request.getParameter("specsType_id"));
            //get all details form specs_type table using that parameter vaiable
            ResultSet rs = dbConnector.executeQuery("SELECT * FROM spces_type where spces_type_id=" + specsTypeId);
            if (rs.next()) {
                String specsTypeName = rs.getString("spec_type_name");
                //getting categoryid from that details
                int categoryId = rs.getInt("category_id");
                //getting category name using that id we fetch previosly
                ResultSet rs2 = dbConnector.executeQuery("SELECT * FROM category where category_id=" + categoryId);
                if (rs2.next()) {
                    String categoryName = rs2.getString("category_name");
        %>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h1 class="card-title text-center"> <%= categoryName%>/<%= specsTypeName%> Table</h1>
                    <div class="table-responsive">
                        <table class="table table-striped mx-auto">
                            <thead>
                                <tr>
                                    <th><%= specsTypeName%> Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                            rs2.close();
                                        }
                                        rs.close();
                                    }
                                    try {
                                        //getting specs details form specs table using specs type id
                                        ResultSet rsSpecs = dbConnector.executeQuery("SELECT * FROM specs WHERE specs_type_id=" + specsTypeId);
                                        if (rsSpecs.isBeforeFirst()) {
                                            while (rsSpecs.next()) {
                                                String specsId = rsSpecs.getString("id");
                                                String specName = rsSpecs.getString("spec_name");
                                %>
                                <tr>
                                    <td><%= specName%></td>
                                    <td>
                                        <a href="./SpecsDelete?specs_id=<%= specsId%>" class="btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="2" class="text-center">No records found</td>
                                </tr>
                                <%
                                        }
                                        rsSpecs.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>