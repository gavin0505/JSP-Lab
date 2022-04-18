<%@ page import="icu.zxb996.entity.User" %>
<%@ page import="icu.zxb996.entity.Address" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="user" class="icu.zxb996.entity.User" scope="application"/>
<jsp:useBean id="addressService" class="icu.zxb996.service.impl.AddressServiceImpl" scope="application"/>
<%
    request.setCharacterEncoding("utf-8");
    user = null;
    user = (User) session.getAttribute("user");
    if(user == null) {
        response.sendRedirect("login.jsp");
    }
    List<Address> addressList = addressService.getUserAddresses(user.getId());
%>
<h1>欢迎"${user.username}"</h1>
<hr/>
<table>
    <tr>
        <th>收件人</th>
        <th>收件地址</th>
        <th>联系电话</th>
        <th>操作</th>
    </tr>
    <c:forEach items="<%=addressList%>" var="address">
        <tr>
        <td>${address.name}</td>
        <td>${address.province}省${address.city}市${address.district}${address.street}${address.detail}
        <c:if test="${address.type == 1}">
            <span style="color: gray">（默认地址）</span>
        </c:if>
        </td>
        <td>${address.phone}</td>
        <td><a href="deleteAddress.jsp?id=${address.id}">删除</a>
            <a href="setDefault.jsp?id=${address.id}">设为默认</a>
        </td>
        </tr>
    </c:forEach>
</table>
<a href="newAddress.jsp">新增地址</a>
<br/>
<a href="logout.jsp">退出登录</a>
</body>
</html>
