<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
</head>
<body>
<%
    // 获取注册表单内容
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String type = request.getParameter("id");
    String next = request.getParameter("next");

    if(application.getAttribute("users") == null) {
        List<Map<String,Object>> users = new ArrayList<>();
        application.setAttribute("users", users);
    }

    // 获取用户表
    List<Map<String,Object>> users = (List<Map<String,Object>>) application.getAttribute("users");
    // 新建用户元组
    Map<String,Object> user = new HashMap<>();
    List<String> pt = new ArrayList<>();
    pt.add(password);
    pt.add(type);
    user.put(username,pt);

    boolean flag = true;
    // 判断用户名重名
    for (int i = 0; i < users.size(); i++) {
        for(String key : users.get(i).keySet()) {
            if(key.equals(username)) {
                flag = false;
                break;
            }
        }
    }

    // 注册跳转
    if(flag) {
        users.add(user);
        application.setAttribute("users", users);
        response.sendRedirect(next);
    }else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
