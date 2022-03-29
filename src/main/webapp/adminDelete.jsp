<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员删除操作</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String type = request.getParameter("id");
    List<Map<String,Object>> users = (List<Map<String,Object>>) application.getAttribute("users");
    for(int i = 0; i < users.size(); i++) {
        for(String key : users.get(i).keySet()) {
            if (key.equals(username)) {
                List<String> list = (List<String>) users.get(i).get(key);
                String temp = list.get(1);
                if(temp.equals(type)) {
                    users.remove(i);
                    break;
                }
            }
        }
    }
    application.setAttribute("users", users);
    response.sendRedirect("admin.jsp");
%>
</body>
</html>
