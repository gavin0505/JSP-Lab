<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body bgcolor="white">
<p style="font-family: 宋体; font-size: 26px; color: blue">
<%
    session.setAttribute("yesORNo", "no");
    request.setCharacterEncoding("UTF-8");
    int n = Integer.parseInt((String)session.getAttribute("grade"));
    StringBuffer buffer = new StringBuffer();
    for(int i = 1; i <= n; i++) {
        buffer.append(request.getParameter("R" + i));
        out.print("" + request.getParameter("R" + i));
    }
    String userAnswer = new String(buffer);
    String testString = (String)session.getAttribute("testString");
    if(testString.equals(userAnswer)) {
        out.print("您记忆不错");
    }
    else {
        out.print("您没记忆住额！答案是：<br/>" + testString);
    }
%>
<br/><a href="giveTest.jsp">返回，继续练习记忆</a>
<br/><a href="choiceGrade.jsp">重新选择级别</a>
</p>
</body>
</html>
