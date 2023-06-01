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
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<h2>Quản Lý Sản Phẩm</h2>
<p>
    <a href="/product-servlet?action=showListAdd">thêm mới sản phẩm </a>
</p>
<form method="get" action="/product-servlet">
    <table border="1">
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Price</th>
            <th>Date</th>
        </tr>
        <c:forEach items="${list}" var="product" varStatus="loop">
            <tr>
                <td>
                    <c:out value="${loop.count}"/>
                </td>
                <td>
                    <c:out value="${product.name}"/>
                </td>
                <td>
                    <c:out value="${product.price}"/>
                </td>
                <td>
                    <c:out value="${product.date}"/>
                </td>
                <td>
                    <button><a href="/product-servlet?action=edit&id=${product.id}"/>edit</button>
                </td>
                <td>
                    <button type="button" class="btn btn-primary"
                            data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick="remove(${product.id},'${product.name}')">Xóa
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
   <form method="get" action="/product-servlet">
       <input name="action" value="find" hidden>
       <input name="name">
       <input type="submit">
   </form>
</form>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Xóa sản phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3>Bạn có chắc chắn xóa sản phẩm có tên:
                    <span style="color:red" id="nameDelete"></span>
                </h3>
            </div>
            <div class="modal-footer">
                <form action="/product-servlet?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Có</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="bootstrap520/js/bootstrap.bundle.js"></script>
<script>
    function remove(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;
    }
</script>
</body>
</html>
