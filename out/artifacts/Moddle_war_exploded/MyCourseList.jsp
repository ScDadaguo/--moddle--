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

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<jsp:include page="StudentPersonalPage.jsp"></jsp:include>
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
                    <th>授课教师:</th>
                    <th>课程内容:</th>
                    <th>开始时间:</th>
                    <th>结束时间:</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${myCourseList}" var="myCourse">
                    <%--TODO: show img--%>
                    <tr>
                        <td>${myCourse.learnClassId}</td>
                            <%--<td>${myCourse.teachClass.course.courseName}</td>--%>
                        <td>
                            <a href="Servlet_printAllArticleTitle?courseName=${myCourse.teachClass.course.courseName}">
                                    ${myCourse.teachClass.course.courseName}
                            </a>
                        </td>
                        <td>

                            <a href="ServletTeacherInfo?name=${myCourse.teachClass.teacher.ueser.ueserName}">
                                    ${myCourse.teachClass.teacher.ueser.ueserName}
                            </a>
                        </td>
                        <td>${myCourse.teachClass.course.content}</td>
                        <td>${myCourse.teachClass.course.startTime}</td>
                        <td>${myCourse.teachClass.course.endTime}</td>
                    </tr>

                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="col-md-1"></div>
    </div>
</div>
<%--<table >--%>
    <%--<tr>--%>
        <%--<th>课程编号:</th>--%>
        <%--<th>课程名称:</th>--%>
        <%--<th>授课教师:</th>--%>
        <%--<th>课程内容:</th>--%>
        <%--<th>开始时间:</th>--%>
        <%--<th>结束时间:</th>--%>
    <%--</tr>--%>
<%--<c:forEach items="${myCourseList}" var="myCourse">--%>
<%--&lt;%&ndash;TODO: show img&ndash;%&gt;--%>
    <%--<tr>--%>
        <%--<td>${myCourse.learnClassId}</td>--%>
        <%--&lt;%&ndash;<td>${myCourse.teachClass.course.courseName}</td>&ndash;%&gt;--%>
        <%--<td>--%>
            <%--<a href="Servlet_printAllArticleTitle?courseName=${myCourse.teachClass.course.courseName}">--%>
                    <%--${myCourse.teachClass.course.courseName}--%>
            <%--</a>--%>
        <%--</td>--%>
        <%--<td>--%>

            <%--<a href="ServletTeacherInfo?name=${myCourse.teachClass.teacher.ueser.ueserName}">--%>
                    <%--${myCourse.teachClass.teacher.ueser.ueserName}--%>
            <%--</a>--%>
        <%--</td>--%>
        <%--<td>${myCourse.teachClass.course.content}</td>--%>
        <%--<td>${myCourse.teachClass.course.startTime}</td>--%>
        <%--<td>${myCourse.teachClass.course.endTime}</td>--%>
    <%--</tr>--%>

<%--</c:forEach>--%>
<%--</table>--%>
</body>
</html>

