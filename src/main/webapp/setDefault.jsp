<%@ page import="icu.zxb996.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设为默认收货地址</title>
</head>
<body>
<jsp:useBean id="addressSevice" class="icu.zxb996.service.impl.AddressServiceImpl" scope="application"/>
<jsp:useBean id="user" class="icu.zxb996.entity.User" scope="application"/>

<%
    request.setCharacterEncoding("utf-8");
    Integer id = Integer.valueOf(request.getParameter("id"));
    user = (User) session.getAttribute("user");

    // 先取消默认地址
    addressSevice.setNotDefaultAddress(user.getId());
    // 再设置默认地址
    addressSevice.makeDefaultAddress(id);
    response.sendRedirect("home.jsp");
%>

</body>
</html>
