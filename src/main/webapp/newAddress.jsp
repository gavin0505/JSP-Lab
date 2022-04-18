<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增收货地址</title>
</head>
<body>
<table>
    <form action="addAddress.jsp" method="post">
        收件人：<input type="text" name="name"><br/>
        联系电话：<input type="text" name="phone"><br/>
        <input type="text" name="province" placeholder="例如：浙江">省（区）<br/>
        <input type="text" name="city" placeholder="例如：杭州">市<br/>
        <input type="text" name="district" placeholder="例如：海淀">区（县）<br/>
        街道（路）：<input type="text" name="street" placeholder="例如：留和路"><br/>
        详细地址：<textarea style="width: 200px;height: 60px; resize: none" name="detail" placeholder="例如：古荡小区2幢102"></textarea><br/>
        <label>
            是否设为默认地址：
            是<input type="radio" name="type" value="1">
            否<input type="radio" name="type" value="0">
        </label>
        <br/>
        <input type="submit" value="确定">
    </form>
</table>
<br/>
<a href="home.jsp">返回</a>
</body>
</html>
