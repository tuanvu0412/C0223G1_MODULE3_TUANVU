<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/05/2023
  Time: 09:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm Sản Phẩm Mới</h1>
<form method="post" action="/product-servlet?action=add">
    nhập mã sản phẩm : <input type="number" name="id">
    <br>
    <br>
    nhập tên sản phẩm : <input type="text" name="name">
    <br>
    <br>
    nhập giá sản phẩm : <input type="number" name="price">
    <br>
    <br>
    nhập ngay sản xuất : <input type="text" name="date">
    <br>
    <br>
    <button type="submit">thêm sản phẩm mới</button>
</form>
<p><a href="/product-servlet">trở lại</a></p>
</body>
</html>
