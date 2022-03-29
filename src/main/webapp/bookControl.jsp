<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍处理</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    if(application.getAttribute("books") == null) {
        List<Map<String,Object>> books = new ArrayList<>();
        application.setAttribute("books", books);
    }
    Map<String,Object> book = new HashMap<>();
    book.put("bookname", request.getParameter("bookname"));
    book.put("author", request.getParameter("author"));
    book.put("price", request.getParameter("price"));
    book.put("userid", request.getParameter("userid"));

    List<Map<String,Object>> books = (List<Map<String,Object>>)application.getAttribute("books");
    books.add(book);
    application.setAttribute("books", books);
    response.sendRedirect("solder.jsp");
%>
</body>
</html>
