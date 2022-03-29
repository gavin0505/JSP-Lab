<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>加入购物车操作</title>
</head>
<body>
<%
    String bookname = request.getParameter("bookname");
    //  单项购物单
    List<String> shoplist = new ArrayList<>();

    List<Map<String,Object>> books = (List<Map<String,Object>>)application.getAttribute("books");
    for (int i = 0; i < books.size(); i++) {

        List<String> temp = new ArrayList<>();
        for (Map.Entry<String, Object> entry : books.get(i).entrySet()) {
            temp.add((String) entry.getValue());
        }
        if (temp.get(2).equals(bookname)) {
            shoplist.add(temp.get(2));
            shoplist.add(temp.get(0));
            shoplist.add(temp.get(1));
            shoplist.add(temp.get(3));
            break;
        }
    }
    if(session.getAttribute("shoplists") == null) {
        List<List<String>> shoplists = new ArrayList<>();
        session.setAttribute("shoplists", shoplists);
    }
    List<List<String>> shoplists = (List<List<String>>)session.getAttribute("shoplists");
//        for (int i = 0; i <= shoplists.size(); i++) {
//            if (!shoplists.contains(shoplist)) {
//                shoplists.add(shoplist);
//                break;
//            }
//        }
    if (!shoplists.contains(shoplist)) {
        shoplists.add(shoplist);
    }
    session.setAttribute("shoplists", shoplists);
    response.sendRedirect("shopBucket.jsp");
%>
</body>
</html>
