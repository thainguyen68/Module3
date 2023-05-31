<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/30/2023
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
          crossorigin="anonymous"></script>
  <style>
    a {
      text-decoration: none;
      color: white;
    }
  </style>
</head>
<body>
<h1 style="text-align: center">User Management</h1>
<h2 style="text-align: center">
  <a class="btn btn-primary" href="/users?action=create">Add New User</a>
</h2>
<div align="center">
  <table border="1" cellpadding="5" style="text-align: center">
    <h2>List of Users</h2>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
      <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${listUser}">
      <tr>
        <td>${user.getId()}</td>
        <td>${user.getName()}</td>
        <td>${user.getEmail()}</td>
        <td>${user.getCountry()}</td>
        <td>
          <a class="btn btn-info" href="/users?action=edit&id=${user.id}">Edit</a>
          <a class="btn btn-danger" onclick="deleteU(${user.id})">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
<script>
  function deleteU(id) {
    if (confirm("Delete?")) {
      window.location.href = "/users?action=delete&id=" + id
    }
  }
</script>
</html>
