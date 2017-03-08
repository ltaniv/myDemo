<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/7
  Time: 6:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="j_spring_security_check" method="post" id="loginForm">
    <input class="x-input" type="text" class="x-form-input" id="VUsername" name="j_username" autofocus/><br />
    <input class="x-input" type="password" class="x-form-input" id="VPassword" name="j_password"/><br />
    <button type="submit">submit</button>
</form>
</body>
</html>
