<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员界面</title>
</head>
<body>
<h1>管理员界面</h1>
<a href="index.jsp">返回</a>
<%
    // 管理员可以增加/删除用户和商家。将用户的信息保存到application内置对象中。
    if(application.getAttribute("users") == null) {
        List<Map<String,Object>> users = new ArrayList<>();
        application.setAttribute("users", users);
    }

%>
<table>
    <tr>
        <th>用户名</th>
        <th>密码</th>
        <th>权限</th>
        <th>操作</th>
    </tr>
<%
    List<Map<String,Object>> users = (List<Map<String,Object>>) application.getAttribute("users");
    for (int i = 0; i < users.size(); i++) {
        Map<String, Object> user = users.get(i);
        for (String key : user.keySet()) {
            List<String> list = (List<String>) user.get(key);
            out.print("<tr>");
            // 用户名
            out.print("<td>");
            out.print(key);
            out.print("</td>");
            // 密码
            out.print("<td>");
            out.print(list.get(0));
            out.print("</td>");
            // 权限
            out.print("<td>");
            out.print(list.get(1));
            out.print("</td>");
            // 添加删除操作
            if(!list.get(1).equals("admin")) {
                out.print("<td>");
%>
<a href="adminDelete.jsp?username=<%=list.get(0)%>&emsp;id=<%=list.get(1)%>">删除</a>
<%
                out.print("</td>");
                }
                out.print("</tr>");
            }
    }
%>
    <a href="register.jsp">添加</a>
</table>
<form></form>
</body>
</html>
