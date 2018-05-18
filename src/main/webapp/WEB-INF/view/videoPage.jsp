<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/5/11
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title></title>
</head>
<body>

<c:forEach items="${newsList}" var="one">
    <c:if test="${not empty one.images}">
        <object id="video" width="400" height="200" border="0" classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA">
            　　
            <param name="ShowDisplay" value="0">
            　　
            <param name="ShowControls" value="1">
            　　
            <param name="AutoStart" value="1">
            　　
            <param name="AutoRewind" value="0">
            　　
            <param name="PlayCount" value="0">
            　　
            <param name="Appearance" value="0">
            　　
            <param name="BorderStyle" value="0">
            　　
            <param name="MovieWindowHeight" value="540">
            　　
            <param name="MovieWindowWidth" value="680">
            　　
            <param name="FileName" value="movie.mp4">
            　　
            <embed width="400" height="200" border="0" showdisplay="0" showcontrols="1" autostart="1" autorewind="0"
                   playcount="0" moviewindowheight="240" moviewindowwidth="320" filename="/movie.mp4" src="${one.images}">

            </embed>
        </object>
    </c:if>
</c:forEach>
</body>
</html>