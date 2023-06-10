<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/1/2023
  Time: 8:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h1 style="text-align: center">List Product</h1>
    <div class="row">
        <div class="col-lg-2">
            <a class="btn btn-success" style="text-decoration: none; color: white" href="/products?action=create">Create
                new product</a>
        </div>
        <div class="col-lg-2">
            <a class="btn btn-warning" style="text-decoration: none; color: white" href="/categories">Home Category</a>
        </div>
        <div class="col-lg-4">
            <a class="btn btn-info" style="text-decoration: none; color: white" href="/carts">Home Cart</a>
        </div>
        <div class="col-lg-4">
            <form action="/products?action=search" method="post">
                <input type="text" name="search">
                <button class="btn btn-info" type="submit">Search</button>
            </form>
        </div>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>PRICE($)</th>
            <th>QUANTITY</th>
            <th>CATEGORY</th>
            <th colspan="2" style="text-align: center">Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${product}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.price}</td>
                <td>${p.quantity}</td>
                <td>${p.category.name}</td>
                <td>
                    <a class="btn btn-warning" href="/products?action=update&&id=${p.id}">Update</a>
                </td>
                <td>
                    <button class="btn btn-danger" onclick="deleteS(${p.id})">Delete</button>
                </td>
                <td>
                    <button class="btn btn-info" onclick="addToCart(${p.id},${p.quantity})">Add to cart</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script>
    function deleteS(id) {
        if (confirm("Are you sure?")) {
            window.location.href = `http://localhost:8080/products?action=delete&&id=` + id
        }
    }
        function addToCart(id, totalQuantity) {
            let quantity = prompt("Enter quantity !!");
            if (quantity > totalQuantity) {
                alert("out of stock !!")
            } else if (quantity <= 0) {
                alert("quantity not valid !!")
            } else {
                alert("add success !!");
                window.location.href = "/carts?action=add&id=" + id + "&quantity=" + quantity;
            }
        }

</script>
</html>
