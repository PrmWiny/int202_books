<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/10/2566
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Session</h1>
<form action="user-session" method="post">
    <label>Username</label>
    <input type="text" name="username">
<%-- input username & password --%>
    <label>Password</label>
    <input type="password" name="password">

    <input type="submit" value="Login">
</form>

<h1>Cookie</h1>
<form action="user-cookie" method="post">
    <label>Username</label>
    <input type="text" name="username">

    <label>Password</label>
    <input type="password" name="password">

    <input type="submit" value="Login">
</form>
</body>
</html>
