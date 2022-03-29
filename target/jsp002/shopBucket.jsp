<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车界面</title>
</head>
<body>
<hr/>
<h2>"<%=session.getAttribute("username")%>"的购物车</h2>
<table>
    <tr>
        <th>书名</th>
        <th>价格</th>
        <th>操作</th>
    </tr>
    <%
        // 检查购物车是否存在
        if(session.getAttribute("shoplists") == null) {
            List<List<String>> shoplists = new ArrayList<>();
            session.setAttribute("shoplists", shoplists);
        }
        List<List<String>> shoplists = (List<List<String>>)session.getAttribute("shoplists");

        for (int i = 0; i < shoplists.size(); i++) {
            out.print("<tr>");
            out.print("<td>");
            out.print(shoplists.get(i).get(0));
            out.print("</td>");
            out.print("<td>");
            out.print(shoplists.get(i).get(2));
            out.print("</td>");
            out.print("<td>");
    %>
    <a href="shopDelete.jsp?bookname=<%=shoplists.get(i).get(0)%>">删除</a>
    <%
            out.print("</td>");
            out.println("</tr>");
    }
    %>
</table>
<a href="user.jsp">返回</a>
</body>
</html>
