<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body bgcolor="#ffccff">
<style>
    #textStyle {
        font-family: 宋体; font-size: 36px; color: blue;
    }
</style>
<%!
    static ArrayList<String> list = new ArrayList<>();
    static {
        list.add("★");
        list.add("○");
        list.add("△");
        list.add("□");
        list.add("◇");
    }
    String getNextTestString(int length) {
        StringBuffer buffer = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(list.size());
            String str = list.get(index);
            buffer.append(str);
        }
        return new String(buffer);
    }
%>
<%
    String grade = request.getParameter("grade");
    if(grade == null) {
        grade = (String)session.getAttribute("grade");
    }
    int number = Integer.parseInt(grade);
    session.setAttribute("grade", grade);
    String testString = null;
    String yesORno = null;
    yesORno = (String)session.getAttribute("yesORno");
    if(yesORno == null) {
        testString = getNextTestString(number);
        session.setAttribute("yesORno", "yes");
        session.setAttribute("testString", testString);
    }
    else if(yesORno.equals("yes")) {
        response.sendRedirect("answerTest.jsp");
        return;
    }
    else if(yesORno.equals("no")) {
        testString = getNextTestString(number);
        session.setAttribute("yesORNo", "yes");
        session.setAttribute("testString", testString);
    }
%>
<p id="textStyle">
    给5秒记住您看到的字符序列：<br/>
    <%=testString%><br/>
    5秒后，将转到答题页.
    <%
        response.setHeader("refresh", "5");
    %>
</p>
</body>
</html>
