<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/05/2023
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="get" action="/customer-servlet">
    <table style="border: 2px black solid">
        <tr>
            <th>STT</th>
            <th>Tên</th>
            <th>Ngày Sinh</th>
            <th>Địa Chỉ</th>
        </tr>

        <c:forEach items="${list}" var="customer" varStatus="loop">
        <tr>
            <td>
                <c:out value="${loop.count}"/>
            </td>
            <td>
                <c:out value="${customer.name}"/>
            </td>
            <td>
                <c:out value="${customer.dateOfBirth}"/>
            </td>
            <td>
                <c:out value="${customer.address}"/>
            </td>
        </tr>
        </c:forEach>
</form>
</table>
</body>
</html>
