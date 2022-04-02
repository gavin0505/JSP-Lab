<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>登录判断处理</title>
</head>
<body>
<%
    // 获取登录表单内容
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String type = request.getParameter("id");

    if(application.getAttribute("users") == null) {
        List<Map<String,Object>> users = new ArrayList<>();
        application.setAttribute("users", users);
    }

    // 获取用户表
    List<Map<String,Object>> users = (List<Map<String,Object>>) application.getAttribute("users");
    // 创建新的用户元组
    Map<String,Object> user = new HashMap<>();
    List<String> pt = new ArrayList<>();
    pt.add(password);
    pt.add(type);
    user.put(username,pt);

    // 登录验证
    if(users.contains(user)) {
        session.setAttribute("username", username);
        session.setAttribute("type", type);
        switch (type) {
            case "admin":
                response.sendRedirect("admin.jsp");
                break;
            case "solder":
                response.sendRedirect("solder.jsp");
                break;
            case "user":
                response.sendRedirect("user.jsp");
                break;
            default:
        }
    }else {
        request.getRequestDispatcher("error.jsp").forward(request,response);
    }
%>
</body>
</html>
