<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="adminpackage.Dbcon" %>
<%@ page import="java.sql.ResultSet" %>
<%
    Dbcon dbConnector = new Dbcon();
    dbConnector.connect();
//getting all manufaturer details from manufacturer table
    ResultSet rs = dbConnector.executeQuery("SELECT * FROM manufacturer");
    //get all categories details from category table 
    ResultSet rs1 = dbConnector.executeQuery("SELECT * FROM category");
%>
<div class="card" style="max-width: 800px; margin: 5rem auto;">
    <div class="card-header">
        <h2>Add Product</h2>
    </div>
    <div class="card-body">
        <div class="container">
            <form action="./ProductAdd" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="name" class="form-label">Product Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Description:</label>
                            <textarea class="form-control" id="description" name="description" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="specifications" class="form-label">Specifications:</label>
                            <textarea class="form-control" id="specifications" name="specifications" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="form-label">Price:</label>
                            <input type="number" class="form-control" id="price" name="price" step="0.01" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="category" class="form-label">Category :</label>
                            <select class="form-control" id="category" name="category_id" required>
                                <option value="" selected disabled>-- Select category --</option>
                                <%
                                    while (rs1.next()) {
                                        //rendering all categories in category table as a select eleemtns inside option eleemnt
%>
                                <option value="<%= rs1.getInt("category_id")%>"><%= rs1.getString("category_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="manufacturer" class="form-label">Manufacturer :</label>
                            <select class="form-control" id="manufacturer" name="manufacturer_id" required>
                                <option value="" selected disabled>-- Select Manufacturer --</option>
                                <%
                                    while (rs.next()) {
                                        //rendering all manufacturer in manuafacturer table as a select eleemtns inside option eleemnt
%>
                                <option value="<%= rs.getInt("manufacturer_id")%>"><%= rs.getString("manufacturer_name")%></option>
                                <%
                                    }
                                %>
                                d
                            </select>


                        </div>
                        <div class="mb-3">
                            <label for="quantity" class="form-label">Quantity:</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" required>
                        </div>
                        <div class="mb-3">
                            <label for="image" class="form-label">Product Image:</label>
                            <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Add Product</button>
            </form>
        </div>
    </div>
    <%
        dbConnector.disconnect();
    %>