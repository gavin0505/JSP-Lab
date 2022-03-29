<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户界面</title>
</head>
<body>
<h2>欢迎用户"<%=session.getAttribute("username")%>"</h2>
<a href="index.jsp">返回</a>
<table>
    <tr>
        <th>书名</th>
        <th>作者</th>
        <th>价格</th>
        <th>商家</th>
        <th>操作</th>
    </tr>
    <%
        List< Map<String,Object>> books = (List<Map<String,Object>>)application.getAttribute("books");
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
    out.print("<td>");
    %>
    <a href="shopList.jsp?bookname=<%=temp.get(2)%>">加入购物车</a>
    <%
    out.print("</td>");
    out.print("</tr>");
    }
    %>
</table>
</body>
</html>