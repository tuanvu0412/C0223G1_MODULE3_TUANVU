<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/05/2023
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Chỉnh Sửa Sản Phẩm</h1>
<form method="post" action="/product-servlet?action=edit">
    <label>id</label>
    <input type="number" name="id" value="${product.getId()}" readonly>
    <label>name</label>
    <input type="text" name="name" value="${product.getName()}">
    <label>price</label>
    <input type="text" name="price" value="${product.getPrice()}">
    <label>date</label>
    <input type="text" name="date" value="${product.getDate()}">
    <button type="submit">sửa</button>
</form>
<button><a href="/product-servlet"></a>back</button>
</body>
</html>
