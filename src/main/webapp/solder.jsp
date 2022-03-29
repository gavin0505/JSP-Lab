<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商户界面</title>
</head>
<body>
<h2>欢迎"<%=session.getAttribute("username")%>"老板</h2>

新增书单：
<form action="bookControl.jsp" method="post">
    书名：<input name="bookname" type="text"><br/>
    作者：<input name="author" type="text"><br/>
    价格：<input name="price" type="text"><br/>
    商家：<input name="userid" type="text" value="<%=session.getAttribute("username")%>" readonly><br/>
    <input type="submit" value="提交">
</form>
<%
    request.setCharacterEncoding("UTF-8");
    if(application.getAttribute("books") == null) {
        List< Map<String,Object>> books = new ArrayList<>();
        application.setAttribute("books", books);
    }
%>
<table>
    <tr>
        <th>书名</th>
        <th>作者</th>
        <th>价格</th>
        <th>商家</th>
    </tr>
<%
    String username = (String) session.getAttribute("username");
    List< Map<String,Object>> books = (List< Map<String,Object>>)application.getAttribute("books");
    for (int i = 0; i < books.size(); i++) {
        out.print("<tr>");
        List<String> temp = new ArrayList<>();
        for (Map.Entry<String,Object> entry : books.get(i).entrySet()) {
            temp.add((String) entry.getValue());
        }
        if(temp.get(3).equals(username)) {
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
    }
%>
</table>

<a href="index.jsp">退出</a>
</body>
</html>
