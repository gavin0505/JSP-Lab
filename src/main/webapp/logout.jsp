<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出登录操作</title>
</head>
<body>
<%
  session.invalidate();
  response.sendRedirect("login.jsp");
%>
</body>
</html>
