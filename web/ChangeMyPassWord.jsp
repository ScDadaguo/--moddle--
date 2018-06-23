<%--
  Created by IntelliJ IDEA.
  User: 战神皮皮迪
  Date: 2018/6/6
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>--%>
    <title>Title</title>
</head>
<body>
<jsp:include page="StudentPersonalPage.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <form action="/ServletAlter" onsubmit="return validate_form(this)">
                <%--TODO:show picture and change , update--%>
                <input type="hidden" name="id" value="2">
                <p>旧的密码：<input type="password" name="oldpassword" id="oldpassword" size="10"></p>
                <p>新的密码：<input type="password" id="password" name="password" size="10"></p>
                <p>再次输入：<input type="password" id="secondinput" name="secondinput" size="10"></p>
                <p>
                    <input type="submit" id="submit" value="确定">
                    <input type="reset" value="取消">
                </p>

            </form>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>

</body>
</html>
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.js"></script>
<script>
    function validate_form(thisform) {
        var $id1 = document.getElementById("password");
        var $id2 = document.getElementById("secondinput");
        var $id3 = document.getElementById("oldpassword");
        //to check password is same
        if ($id1.value!=$id2.value){
            alert("密码不一致");
            return false;
        }else {
            document.getElementById('password').value=md5($id1.value);
            document.getElementById('oldpassword').value=md5($id3.value);
            // alert(document.getElementById('password').value);
            return true;}


    }
</script>