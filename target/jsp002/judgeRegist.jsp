<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
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

        response.sendRedirect("error.jsp");
    }else {
        users.add(user);
        application.setAttribute("users", users);
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>
