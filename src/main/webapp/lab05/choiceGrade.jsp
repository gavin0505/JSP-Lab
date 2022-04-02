<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body bgcolor="#ffccff">
<style>
    #textStyle {
        font-family: 宋体; font-size: 26px; color: blue;
    }
</style>
<form action="giveTest.jsp" id="textStyle" method="post" name="form">
        <input type="radio" name="grade" value="5"/>初级
        <input type="radio" name="grade" value="7" checked="ok"/>中级
        <input type="radio" name="grade" value="10"/>高级
    <br/><input type="submit" name="submit" id="textStyle" value="提交">
    <input type="reset" id="textStyle" value="重置">
</form>
</body>
</html>
