<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/25/2023
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<button> <a href="Create.jsp">create</a></button>
<c:forEach var="i" items="${key1}">
    <h4>${i}</h4><br>
</c:forEach>

</body>
</html>
