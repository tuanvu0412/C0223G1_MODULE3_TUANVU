<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01/06/2023
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/user-servlet?action=create">
  <label>nhập tên: </label>
  <input type="text" name="name">
  <br>
  <label>nhập gmail</label>
  <input type="text" name="email">
  <br>
  <label>nhập địa chỉ</label>
  <input type="text" name="country">
  <br>
  <button type="submit">thêm</button>
</form>
</body>
</html>
