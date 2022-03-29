<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<body>

<form action="judgeLogin.jsp" method="post">
    用户名：<input name="username" type="text"/><br/>
    密码： <input name="password" type="password"><br/>
    身份：管理员<input type="radio" name="id" value="admin">
    商家<input type="radio" name="id" value="solder">
    用户<input type="radio" name="id" value="user" checked><br/>
    <input type="submit" name="提交"><br/>
</form>
<a href="register.jsp">注册</a>

<h2>书单</h2>
<table>
    <tr>
        <th>书名</th>
        <th>作者</th>
        <th>价格</th>
        <th>商家</th>
    </tr>
    <%
        request.setCharacterEncoding("UTF-8");
        if(application.getAttribute("books") == null) {
            List< Map<String,Object>> books = new ArrayList<>();
            application.setAttribute("books", books);
        }
        List<Map<String,Object>> books = (List< Map<String,Object>>)application.getAttribute("books");
                for (int i = 0; i < books.size(); i++) {

                    out.print("<tr>");
                    List<String> temp = new ArrayList<>();
                    for (Map.Entry<String, Object> entry : books.get(i).entrySet()) {
                        temp.add((String) entry.getValue());
                    }
                    out.print("<td>");
                    out.print(temp.get(2));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(temp.get(0));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(temp.get(1));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(temp.get(3));
                    out.print("</td>");
                    out.print("</tr>");
                }
    %>
</table>

<%
    // 默认一进来就送管理员账号
    if(application.getAttribute("users") == null) {
        List<Map<String,Object>> users = new ArrayList<>();
        application.setAttribute("users", users);
    }
    List<Map<String,Object>> users = (List<Map<String,Object>>) application.getAttribute("users");
    // 用户元组
    Map<String,Object> user = new HashMap<>();
    List<String> pt = new ArrayList<>();
    pt.add("admin");
    pt.add("admin");
    user.put("admin",pt);


    if(!users.contains(user)) {
        users.add(user);
        application.setAttribute("users", users);
    }
%>
</body>
</html>
