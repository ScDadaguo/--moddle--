<%--
  Created by IntelliJ IDEA.
  User: 战神皮皮迪
  Date: 2018/6/6
  Time: 16:35
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
<jsp:include page="TeacherPersonalPage.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">

            <table class="table">
                <caption>课程表</caption>
                <thead>
                <tr>
                    <th>课程编号:</th>
                    <th>课程名称:</th>
                    <th>课程内容:</th>
                    <th>开始时间:</th>
                    <th>结束时间:</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${myCourseList}" var="myCourse">
                    <%--TODO: show img--%>
                    <tr>
                        <td>${myCourse.teacherClassId}</td>
                        <td><a href="enter.jsp?courseName=${myCourse.course.courseName}">${myCourse.course.courseName}</a></td>
                        <td>${myCourse.course.content}</td>
                        <td>${myCourse.course.startTime}</td>
                        <td>${myCourse.course.endTime}</td>
                    </tr>

                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="col-md-1"></div>
    </div>
</div>
</body>
</html>

