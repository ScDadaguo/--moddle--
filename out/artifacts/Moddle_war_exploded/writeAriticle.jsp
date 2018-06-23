
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2018/6/4
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--<%--%>
<%--request.setCharacterEncoding("UTF-8");--%>
<%--List<Futext> futextList = (List<Futext>)request.getAttribute("futextList");--%>
<%--if(futextList==null){--%>
<%--request.getRequestDispatcher("/Servlet_filename").forward(request,response);--%>
<%--}--%>

<%--%>--%>
<!doctype html>

<html lang="en">
<%
    String courseName =request.getParameter("courseName");
%>

<head>

    <title>jQuery Notebook Demo</title>

    <meta charset='utf-8'>


    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="css/style.css">

    <link rel="stylesheet" type="text/css" href="css/jquery.notebook.css">

</head>
<body>
<p>您以${user.ueser.nickname}教师登录</p>
<div style="text-align:center;">

    <tr><td>${futext.text}</td></tr><br>

</div>



<div class="editor" id="dadiao" >
</div>



<script type="text/javascript" src="js/libs/jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="js/jquery.notebook.js"></script>

<script type="text/javascript">


    $(document).ready(function () {

        $('.editor').notebook({

            autoFocus: true,

            placeholder: 'Type something awesome...'

        });

    });

</script>


<script src="http://www.jq22.com/js/jq.js"></script>


<form action="Servlet_insertArticle?courseName=<%=courseName%>" method="post">
    <table>
        <tr>
            <td><input type='hidden' name='paras' value="" id="myinput"/></td>
        </tr>
        <tr>
            <td><input type='hidden' name='h1' value="" id="h1"/></td>
        </tr>
        <tr>
            <td><input type='hidden' name='user' value="teacher" id="user"/></td>
        </tr>
        <td><input type="submit" name="submit" id="submit"></td>
        </tr>
    </table>
</form>


</body>

</html>
<script>
    $("#submit").click(function () {
        var dadiao = $("#dadiao").html();
        document.getElementById('myinput').value = dadiao;
    });
    $("#submit").click(function () {
        var str = document.getElementsByTagName('h1')[0].innerHTML;
        alert(str);
        document.getElementById('h1').value = str;
    });
</script>
