<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/30/2023
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<form method="post">
  <table border="1" cellpadding="5">
    <caption><h2>Update users</h2></caption>
    <tr>
      <th>Name</th>
      <td><input name="name" value="${user.name}"></td>
    </tr>
    <tr>
      <th>Email</th>
      <td><input name="email" value="${user.email}"></td>
    </tr>
    <tr>
      <th>Country</th>
      <td><input name="country" value="${user.country}"></td>
    </tr>
    <tr>
      <th colspan="2">
        <button type="submit"> Update</button>
        <a href="/users">Back to home</a>
      </th>
    </tr>
  </table>
</form>

</body>
</html>
