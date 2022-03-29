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
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String type = request.getParameter("id");

    if(application.getAttribute("users") == null) {
        List<Map<String,Object>> users = new ArrayList<>();
        application.setAttribute("users", users);
    }

    List<Map<String,Object>> users = (List<Map<String,Object>>) application.getAttribute("users");
    // 用户元组
    Map<String,Object> user = new HashMap<>();
    List<String> pt = new ArrayList<>();
    pt.add(password);
    pt.add(type);
    user.put(username,pt);

    if(users.contains(user)) {
        session.setAttribute("username", username);
        session.setAttribute("type", type);
        switch (type) {
            case "admin":
                request.getRequestDispatcher("admin.jsp").forward(request,response);
                break;
            case "solder":
                request.getRequestDispatcher("solder.jsp").forward(request,response);
                break;
            case "user":
                request.getRequestDispatcher("user.jsp").forward(request,response);
                break;
            default:
        }
        response.sendRedirect("book.jsp");
    }else {
        response.sendRedirect("error.jsp");
    }
%>

</body>
</html>
