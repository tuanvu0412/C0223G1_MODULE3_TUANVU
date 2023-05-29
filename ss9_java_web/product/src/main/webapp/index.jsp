
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <style>
    .sum{
      border: 1px blue solid;
      height: 150px;
      width: 200px;
      margin-left: 400px;
      background-color: aqua;
    }
    .result{
      padding-left: 10px ;
      margin: 5px;
    }
  </style>
</head>
<body>
<div class="sum">
  <form method="post" action="/CaculatorServlet">
    <label for="num2">
      Giá niêm yết của sản phẩm :
    </label>
    <input type="number" name="num2" id="num2" class="result">
    <label for="num3">
      Tỷ lệ chiết khấu (phần trăm) :
    </label>
    <input type="number" name="num3" id="num3" class="result">
    <input type="submit" value="sum" class="result">
  </form>
</div>
</body>
</html>