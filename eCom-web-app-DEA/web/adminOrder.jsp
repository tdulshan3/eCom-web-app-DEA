<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Orders</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Admin Orders</h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>Order ID</th>
            <th>User Name</th>
            <th>Contact Number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Product Name</th>
            <th>Status</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.userName}</td>
                <td>${order.contactNumber}</td>
                <td>${order.email}</td>
                <td>${order.address}</td>
                <td>${order.productName}</td>
                <td>${order.status}</td>
                <td>${order.price}</td>
                <td>${order.quantity}</td>
                <td>${order.total}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
