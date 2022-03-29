<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车删除操作</title>
</head>
<body>
<%
    // 获取待删除的书
    String bookname = request.getParameter("bookname");
    List<List<String>> shoplists = (List<List<String>>)session.getAttribute("shoplists");

    // 删除操作
    for (int i = 0; i < shoplists.size(); i++) {
        if (shoplists.get(i).contains(bookname)) {
            shoplists.remove(i);
            break;
        }
    }
    session.setAttribute("shoplists", shoplists);
    response.sendRedirect("shopBucket.jsp");
%>
</body>
</html>
