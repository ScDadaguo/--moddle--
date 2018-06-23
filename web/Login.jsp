<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="css/jq22.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="css/main.css">--%>
</head>
<body>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<div id="login">
    <div class="wrapper">
        <div class="login">
            <form action="/ServletLogin" method="post" class="container offset1 loginform" onsubmit="return validate_form(this)">
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad">
                    <input type="hidden" name="_csrf" value="9IAtUxV2CatyxHiK2LxzOsT6wtBE6h8BpzOmk=">
                    <div class="control-group">
                        <div class="controls">
                            <label for="email" class="control-label fa fa-envelope"></label>
                            <input id="email" type="text" name="id" placeholder="account" tabindex="1" autofocus="autofocus" class="form-control input-medium">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password" class="control-label fa fa-asterisk"></label>
                            <input id="password" type="password" name="password" placeholder="Password" tabindex="2" class="form-control input-medium">
                        </div>
                    </div>
                </div>
                <div style="padding-left: 50px">
                    <input  type="radio" name="radio" value="student" id="radio1"/>学生
                    <input  type="radio" name="radio" value="teacher" id="radio2"/>教师
                    <input  type="radio" name="radio" value="admin" id="radio3"/>管理员
                </div>
                <div class="form-actions">
                    <button type="submit" tabindex="4" class="btn btn-primary">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>



<%--<div class="container">--%>
    <%--<div class="row">--%>
        <%--<div class="col-md-1"></div>--%>
        <%--<div class="col-md-4">--%>
            <%--<img src="images/logowzbc.png">--%>
        <%--</div>--%>
        <%--<div class="col-md-3"></div>--%>
        <%--<div class="col-md-3"></div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<div class="container">--%>
    <%--<div class="row">--%>
    <%--</div>--%>
<%--</div>--%>
<%--<div class="container">--%>
    <%--<div class="row">--%>
    <%--</div>--%>
<%--</div>--%>


<%--<form method="post" action="/ServletLogin" onsubmit="return validate_form(this)">--%>
    <%--<p>帐号：<input type="text" name="id" size="10"></p>--%>
    <%--<p>密码：<input type="password" name="password" size="10" id="password"></p>--%>
    <%--<input  type="radio" name="radio" value="student" id="radio1"/>学生--%>
    <%--<input  type="radio" name="radio" value="teacher" id="radio2"/>教师--%>
    <%--<input  type="radio" name="radio" value="admin" id="radio3"/>管理员--%>
    <%--<p>--%>
        <%--<input type="submit" id="submit" value="确定">--%>
        <%--<input type="reset" value="取消">--%>
    <%--</p>--%>
<%--</form>--%>

</body>
</html>
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.js"></script>
<script src="js/jquery.min.js"></script>
<script>
    $(function() {

        $('#login #password').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
    });
</script>
<script>
    function validate_form(thisform) {
        var $id1 = document.getElementById("radio1");
        var $id2 = document.getElementById("radio2");
        var $id3 = document.getElementById("radio3");
        if ($id1.checked || $id2.checked ||$id3.checked){
            // alert(document.getElementById('password').value)
            document.getElementById('password').value=md5(document.getElementById('password').value);

            // alert(document.getElementById('password').value);
            return true;
        }else return false;

        
    }
</script>