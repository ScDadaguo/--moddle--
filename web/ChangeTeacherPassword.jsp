<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2018/6/10
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title><%--
  Created by IntelliJ IDEA.
  User: 战神皮皮迪
  Date: 2018/6/6
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <title>Title</title>
    </head>
<body>
<jsp:include page="TeacherPersonalPage.jsp"></jsp:include>
<form action="/ServletAlter" onsubmit="return validate_form(this)">
    <%--TODO:show picture and change , update--%>
    <input type="hidden" name="id" value="4">
    <p>旧的密码：<input type="password" name="oldpassword" size="10"></p>
    <p>新的密码：<input type="password" id="password" name="password" size="10"></p>
    <p>再次输入：<input type="password" id="secondinput" name="secondinput" size="10"></p>
    <p>
        <input type="submit" id="submit" value="确定">
        <input type="reset" value="取消">
    </p>

</form>
</body>
</html>
<script>
    function validate_form(thisform) {
        var $id1 = document.getElementById("password");
        var $id2 = document.getElementById("secondinput");
        //to check password is same
        if ($id1.value!=$id2.value){
            alert("密码不一致");
            return false;
        }else return true;


    }
</script>
</head>
<body>

</body>
</html>
