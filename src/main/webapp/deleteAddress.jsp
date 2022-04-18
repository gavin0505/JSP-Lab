<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除收货地址</title>
</head>
<body>
<jsp:useBean id="addressService" class="icu.zxb996.service.impl.AddressServiceImpl" scope="application"/>
<%
    request.setCharacterEncoding("utf-8");
    Integer id = Integer.valueOf(request.getParameter("id"));
    addressService.deleteAddress(id);
    response.sendRedirect("home.jsp");
%>
</body>
</html>
