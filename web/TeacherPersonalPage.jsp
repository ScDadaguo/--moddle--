<%@ page import="entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>MY PAGE</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link href="css/lightbox.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    <link rel="stylesheet" href="css/head.css">
</head>
<body>

<section id="page-breadcrumb">
    <div class="vertical-center sun">
        <div class="container">
            <div class="row">
                <div class="action">
                    <div class="col-sm-12">
                        <h1 class="title">欢迎！:${user.ueser.nickname}</h1>
                        <p>Why our Clients love to work with us.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 触发弹窗 - 图片改为你的图片地址 -->
<%--<img id="myImg" src="https://c.runoob.com/wp-content/uploads/2017/01/btotbhpudiagtmvlkyrs.jpg" alt="文本描述信息" width="300" height="200">--%>

<!-- 弹窗 -->
<div id="myModal" class="modal">
    <!-- 关闭按钮 -->
    <span class="close" onclick="document.getElementById('myModal').style.display='none'">&times;</span>
    <!-- 弹窗内容 -->
    <img class="modal-content" id="img01">
    <!-- 文本描述 -->
    <div id="caption"></div>
</div>
<section id="company-information" class="padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
    <form action="/ServletUpImg" enctype="multipart/form-data" method="post">
        <div class="container">
            <div class="row">
                <div class="col-sm-6" id="localImag">
                    <img src="/ServletShowImage?userImg=${user.ueser.ueserImg}" width="495" height="298" class="img-responsive" alt="" id="myimg">
                    <div  style="float:left">
                        <label class="btn btn-primary">选择图片
                            <input type="file" style="display: none" class="form-control" id="caseImage" name="caseImage" onchange="viewImage(this)"/>
                        </label>
                    </div>
                    <div style="float:left">
                        <p><input type="submit" id="submit" value="修改头像"></p>
                    </div>


                </div>
                <div class="col-sm-6 padding-top">
                    <p>Shoulder bresaola sausage consequat ground round duis excepteur exercitation landjaeger sunt. Duis officia sed frankfurter dolore pastrami tenderloin.</p>
                    <p>When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.</p>
                </div>
            </div>
        </div>
    </form>
</section>



<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                <div class="single-service">

                    <h2><a href="ServletMyCourseList">我的课程</a></h2>
                    <p>Revising My Course.</p>
                </div>
            </div>
            <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                <div class="single-service">

                    <h2><a href="AlterTeacherSelf.jsp">修改个人资料</a></h2>
                    <p>Revising personal data.</p>
                </div>
            </div>
            <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
                <div class="single-service">

                    <h2><a href="ChangeTeacherPassword.jsp">修改密码</a></h2>
                    <p>Modify the password</p>
                </div>
            </div>

        </div>
    </div>
</section>
<div class="container">
    <h1 style="text-align: center">您于${user.ueser.createTime}创建此帐号</h1>
</div>


</body>
</html>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>

<script>
    function viewImage(file){
        var preview = document.getElementById('myimg');
        if(file.files && file.files[0]){
            //火狐下
            preview.style.display = "block";
            preview.style.width = "495px";
            preview.style.height = "298px";
            preview.src = window.URL.createObjectURL(file.files[0]);
        }else{
            //ie下，使用滤镜
            file.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小
            localImagId.style.width = "495px";
            localImagId.style.height = "298px";
            try{
                localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                locem("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            }catch(e){
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            preview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }
</script>
<script>
    var modal = document.getElementById('myModal');

    // 获取图片插入到弹窗 - 使用 "alt" 属性作为文本部分的内容
    var img = document.getElementById('myimg');
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
    img.onclick = function(){
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }

    // 获取 <span> 元素，设置关闭按钮
    var span = document.getElementsByClassName("close")[0];

    // 当点击 (x), 关闭弹窗
    span.onclick = function() {
        modal.style.display = "none";
    }
</script>