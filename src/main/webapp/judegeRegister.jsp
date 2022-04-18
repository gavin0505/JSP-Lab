<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>判断注册</title>
</head>
<body>
<jsp:useBean id="user" class="icu.zxb996.entity.User" scope="application"/>
<jsp:useBean id="userService" class="icu.zxb996.service.impl.UserServiceImpl" scope="application"/>

<%
    request.setCharacterEncoding("utf-8");

    user.setUsername(request.getParameter("username"));
    user.setPassword(request.getParameter("password"));
    user.setName(request.getParameter("name"));
    user.setPhone(request.getParameter("phone"));

    // 注册，成功则跳转回登录界面
    if(userService.addUser(user)) {
        response.sendRedirect("login.jsp");
    }else {
        response.sendRedirect("register.jsp");
    }
%>
</body>
</html>
