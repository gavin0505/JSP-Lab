<%@ page import="icu.zxb996.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="user" class="icu.zxb996.entity.User" scope="application"/>

<%
    user = null;
    user = (User) session.getAttribute("user");
    if(user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%=user.getName()%>


</body>
</html>
