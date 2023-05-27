<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/25/2023
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<form action="/create" method="get">
  <label> Nhập id <br>
    <input type="text" name="id" placeholder="Nhập id"><br>
  </label>
    <label> Nhập tên <br>
        <input type="text" name="name" placeholder="Nhập tên"><br>
    </label>
    <button type="submit">Create</button>
</form>
</body>
</html>
