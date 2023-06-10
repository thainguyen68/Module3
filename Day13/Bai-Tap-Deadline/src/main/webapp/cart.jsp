<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/1/2023
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<body>
<h1 style="text-align: center">Cart Home</h1>
<a href="/products" class="btn btn-secondary" style="margin-bottom: 20px; text-decoration: none">Back to home</a>
<%--<table class="table table-bordered border-primary" style="width: 500px;margin-left: 500px">--%>
<table class="table table-striped">
    <thead style="font-weight: bold;">
    <tr>
        <td>ID</td>
        <td>PRODUCT NAME</td>
        <td>PRICE($)</td>
        <td>QUANTITY</td>
        <td>ACTION</td>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="c" items="${cart}">
        <tr>
            <td>${c.id}</td>
            <td>${c.product.name}</td>
            <td>${c.product.price}</td>
            <td>${c.quantity}
                <button class="btn btn-warning" style="float: right"
                        onclick="changeQuantity(${c.quantity},${c.id})">Change quantity
                </button>
            </td>
            <td>
                <button style="border: none; background-color:white"><a class="btn btn-danger"
                         href="/carts?action=delete&id=${c.id}&quantity=${c.quantity}&productId=${c.product.id}">Delete</a>
                </button>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="5">Total price : ${total}$</td>
    </tr>
    </tbody>
</table>
</body>
<script>
    function changeQuantity(quantity, id) {
        let newQuantity = prompt("Enter quantity !!");
        if (newQuantity <= 0) {
            alert("Invalid quantity !!")
        } else {
            let editQuantity = newQuantity - quantity;
            window.location.href = "/carts?action=updateQuantity&quantity=" + editQuantity + "&id=" + id;
        }
    }
</script>
</html>