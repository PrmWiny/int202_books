<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/10/2566
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customers</title>
</head>
<body>

<div>
    <h1>Add Customer</h1>
    <form action="customers" method="post">
        <input type="hidden" name="action" value="addCustomer"/>
        <label>Name</label>
        <input type="text" name="name"/>
        <br/>
        <label>Phone</label>
        <input type="tel" name="phone"/>
        <br/>
        <button type="submit">
            Add Customer
        </button>
    </form>
</div>

<div>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Details</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${applicationScope.customers}" var="customer">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.name}</td>
                <td>${customer.phone}</td>
                <td>
                    <a href="customers?id=${customer.id}">
                        Details
                    </a>
                </td>
                <td>
                    <form action="customers" method="post">
                        <input type="hidden" name="action" value="deleteCustomer"/>
                        <input type="hidden" name="id" value="${customer.id}"/>
                        <button type="submit">
                            Delete
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>


</body>
</html>
