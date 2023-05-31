<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/05/2023
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Quản Lý Sản Phẩm</h2>
<p>
    <a href="/product-servlet?action=add">thêm mới sản phẩm </a>
</p>
<form method="get" action="/product-servlet">
    <table border="1">
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Price</th>
            <th>Date</th>
        </tr>
        <c:forEach items="${list}" var="s" varStatus="loop">
            <tr>
                <td>
                    <c:out value="${loop.count}"/>
                </td>
                <td>
                    <c:out value="${s.name}"/>
                </td>
                <td>
                    <c:out value="${s.price}"/>
                </td>
                <td>
                    <c:out value="${s.date}"/>
                </td>
                <td>
                    <button><a href="/product-servlet?action=edit&id=${s.id}"/>edit</button>
                </td>
                <td>
                    <button><a href="/product-servlet?action=delete&id=${s.id}"/>delete</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
