<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form method="get" action="/calculator-servlet">
    <label>
        Nhập số thứ nhất:
    </label>
    <input type="number" name="number1" >
    <select  name="option" >
        <option value="+">Cộng</option>
        <option value="-">Trừ</option>
        <option value="*">Nhân</option>
        <option value="/">Chia</option>
    </select>
    <label>
        Nhập số thứ hai:
    </label>
    <input type="number" name="number2" >
    <button type="submit">submit</button>
</form>
</body>
</html>