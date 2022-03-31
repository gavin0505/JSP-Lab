<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>错误界面</title>
</head>
<body>
<h2>错误</h2>
<%
    String next = (String) request.getAttribute("page");
    String className = request.getParameter("className") + "?page=" + next;
    response.setHeader("refresh", "3, URL=" + className);
%>
</body>

</html>
