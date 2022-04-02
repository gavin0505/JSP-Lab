<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<style>
    #textStyle {
        font-family: 宋体; font-size: 26px; color: blue;
    }
</style>
<form action="judgeAnswer.jsp" id="textStyle" method="post">
    <%
        int n = Integer.parseInt((String)session.getAttribute("grade"));
        session.setAttribute("yesORNo", "no");
        for (int i = 1; i <= n; i++) {
            out.print("<br/>第" + i + "个字符：");
            out.print("<input type=radio name=R" + i + " value='★'>★" +
                      "<input type=radio name=R" + i + " value='○'>○" +
                      "<input type=radio name=R" + i + " value='△'>△" +
                      "<input type=radio name=R" + i + " value='□'>□" +
                      "<input type=radio name=R" + i + " value='◇'>◇");
        }
    %>
    <br/>
    <input type="submit" name="submit" id="textStyle" value="提交">
    <input type="reset" id="textStyle" value="重置">
</form>
</body>
</html>
