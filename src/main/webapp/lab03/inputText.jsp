<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #textStyle {
            font-family: 宋体; font-size: 23px; color: blue;
        }
    </style>
</head>
<body bgcolor="#ffccff">
    <p id="textStyle">
        输入英文文章，单击提交键：
        <%
            String content = "We are students, are you students?";
        %>
        <form action="findWord.jsp" method="post" name="form">
        <textarea name="english" id="textStyle" rows="5" cols="38">
        <%=content%>
        </textarea><br/>
        <input type="submit" name="submit" id="textStyle" value="提交">
    </form>
    </p>
</body>
</html>
