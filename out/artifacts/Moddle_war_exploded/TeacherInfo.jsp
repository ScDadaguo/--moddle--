<%--
  Created by IntelliJ IDEA.
  User: 战神皮皮迪
  Date: 2018/6/8
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="localImag">
    <img id="myimg" width=100 height=100 style="diplay:none" src="/ServletShowImage?userImg=${teacher.ueser.ueserImg}">
</div>

<%--TODO: merge the branch with dadaguo  to show what teacher reply in topic--%>
<p>他的姓名：${teacher.ueser.ueserName}</p>
<p>他的昵称：${teacher.ueser.nickname}</p>
<p>学院：${teacher.department.departmentId}</p>
<p>eamil：${teacher.ueser.email}</p>
<c:forEach items="${teachClassList}" var="teachClass">
    <%--TODO: href with dadaguo's course miantitle by class name--%>
    <p>课程名称:${teachClass.course.courseName}</p>
    <p>课程概要:${teachClass.course.content}</p>
    <p>开始时间:${teachClass.course.startTime}</p>
    <p>结束时间:${teachClass.course.endTime}</p>
    <%--TODO:show course img--%>

</c:forEach>
</body>
</html>
