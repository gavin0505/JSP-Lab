<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
</head>
<body>
<%
    String next = request.getParameter("page");
%>
<form action="judgeRegist.jsp" method="post">
    用户名：<input name="username" type="text"><br/>
    密码：<input name="password" type="text"><br/>
    身份： 商家：<input type="radio" name="id" value="solder">
    用户：<input type="radio" name="id" value="user" checked><br/>
    <input type="text" name="next" value="<%=next%>" hidden>
    <input type="submit" value="提交"><br/>
</form>
<a href="<%=next%>">返回</a>
</body>
</html>
