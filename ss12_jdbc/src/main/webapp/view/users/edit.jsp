<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01/06/2023
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management Application</title>
</head>
<body>
<div align="center">
  <form method="post" action="/user-servlet?action=edit">
    <table border="1" cellpadding="5">
      <label>id</label>
      <input type="number" name="id" value="${user.getId()}" readonly>
      <label>name</label>
      <input type="text" name="name" value="${user.getName()}">
      <label>price</label>
      <input type="text" name="gmail" value="${user.getEmail()}">
      <label>date</label>
      <input type="text" name="country" value="${user.getCountry()}">
      <button type="submit">sửa</button>
    </table>
  </form>
</div>
</body>
</html>