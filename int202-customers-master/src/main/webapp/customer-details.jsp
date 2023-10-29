<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/10/2566
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer Details</title>
</head>
<body>
<form action="customers" method="post">
    <input type="hidden" name="action" value="updateCustomer"/>
    <input type="hidden" name="id" value= "${requestScope.customer.id}"/>

    <label>Name</label>
    <input type="text" name="name" value="${requestScope.customer.name}"/>
    <br/>
    <label>Phone</label>
    <input type="tel" name="phone" value="${requestScope.customer.phone}"/>
    <br/>
    <button type="submit">
        Update Customer
    </button>
</form>

<form action="customers" method="post">
    <input type="hidden" name="action" value="deleteCustomer"/>
    <input type="hidden" name="id" value="${requestScope.customer.id}"/>
    <button type="submit">
        Delete
    </button>
</form>

</body>
</html>
