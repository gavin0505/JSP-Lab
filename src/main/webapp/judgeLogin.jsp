<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>判断登录</title>
</head>
<body>
<jsp:useBean id="user" class="icu.zxb996.entity.User" scope="application"/>
<jsp:useBean id="userService" class="icu.zxb996.service.impl.UserServiceImpl" scope="application"/>
    <%
        request.setCharacterEncoding("utf-8");

        user = userService.login(request.getParameter("username"),request.getParameter("password"));

        // 登录
        if(user != null) {
            session.setAttribute("user",user);
            //todo 跳转or重定向
            request.getRequestDispatcher("home.jsp").forward(request,response);
        }else {
            response.sendRedirect("login.jsp");
        }

    %>
</body>
</html>
