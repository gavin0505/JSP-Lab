<%@ page import="icu.zxb996.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加收货地址的处理</title>
</head>
<body>
<jsp:useBean id="user" class="icu.zxb996.entity.User" scope="application"/>
<jsp:useBean id="address" class="icu.zxb996.entity.Address" scope="application"/>
<jsp:useBean id="addressService" class="icu.zxb996.service.impl.AddressServiceImpl" scope="application"/>
<%
    request.setCharacterEncoding("utf-8");
    user = (User)session.getAttribute("user");


    address.setName(request.getParameter("name"));
    address.setPhone(request.getParameter("phone"));
    address.setProvince(request.getParameter("province"));
    address.setCity(request.getParameter("city"));
    address.setDistrict(request.getParameter("district"));
    address.setStreet(request.getParameter("street"));
    address.setDetail(request.getParameter("detail"));
    address.setType(Integer.valueOf(request.getParameter("type")));
    address.setUserId(user.getId());

    // 添加地址
    addressService.addAddress(address);
    response.sendRedirect("home.jsp");
%>
</body>
</html>
