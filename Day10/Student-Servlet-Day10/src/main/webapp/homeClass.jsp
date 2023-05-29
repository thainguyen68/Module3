<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/29/2023
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Home Class</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<h1 style="text-align: center; margin-top: 50px;"> List Classes </h1>

<table class="table table-striped" style="text-align: center">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th colspan="3" style="text-align: center">Action</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${classes}" var="c">
        <tr>
            <td>${c.idClass}</td>
            <td>${c.nameClass}</td>
            <td>
                <a class="btn btn-success" href="/students?action=createClass&&id=${c.idClass}">Create</a>
            </td>
            <td>
                <a class="btn btn-warning" href="/students?action=updateClass&&id=${c.idClass}">Update</a>
            </td>
            <td>
                <button class="btn btn-danger" onclick="deleteS(${c.idClass})">Delete</button>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script>
    function deleteS(id) {
        if (confirm("Are you sure?")) {
            window.location.href = `http://localhost:8080/students?action=deleteClass&&id=` + id
        }
    }
</script>
</html>
