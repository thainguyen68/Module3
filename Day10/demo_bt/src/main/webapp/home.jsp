<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/27/2023
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h1 style="text-align: center; margin-top: 50px;"> List Students </h1>
    <div class="row">
        <div class="col-lg-8">
            <a class="btn btn-primary" style="text-decoration: none; color: white" href="/students?action=create">Create
                new student</a>
        </div>


        <div class="col-lg-4">
            <form action="/students?action=search" method="post">
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
            <th>Age</th>
            <th>Gender</th>
            <th>Address</th>
            <th colspan="2" style="text-align: center">Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${studentList}" var="s">
            <tr>
                <%--${s.id} lấy giá trị từ danh sách studentList thông qua Servlet( findAdd() )--%>
                <td>${s.id}</td>
                <td>${s.name}</td>
                <td>${s.age}</td>
                <td>${s.gender}</td>
                <td>${s.address}</td>
                <td>
                    <a class="btn btn-warning" href="/students?action=update&&id=${s.id}">Update</a>
                </td>
                <td>
                    <button class="btn btn-danger" onclick="deleteS(${s.id})">Delete</button>
                    <%-- tạo nút xóa bằng  window.location thông qua js --%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
<script>
    <%-- tạo nút xóa bằng  window.location thông qua js --%>
    function deleteS(id) {
        if (confirm("Are you sure?")) {
            window.location.href = `http://localhost:8080/students?action=delete&&id=` + id
        }
    }
</script>
</html>
