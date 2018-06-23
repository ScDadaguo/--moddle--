<%@ page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: WZBC
  Date: 2018/6/5
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>AlertSelf</title>
</head>
<body>
<jsp:include page="StudentPersonalPage.jsp"></jsp:include>
<p style="text-align: center"><a href="PersonalPage.jsp">返回个人主页</a></p>

<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-8">
            <form action="/ServletAlter" enctype="multipart/form-data">
                <%--TODO:show picture and change , update--%>
                <input type="hidden" name="id" value="1">
                <div id="localImag">
                    <img id="preview" width=-1 height=-1 style="diplay:none" />
                </div>
                <label class="btn btn-primary">选择图片
                    <input type="file" style="display: none" class="form-control" id="caseImage" name="caseImage" onchange="viewImage(this)"/>
                </label>
                <p>姓名：
                    <input type="text" name="name" size="40" disabled="true" value="${user.ueser.ueserName}">
                </p>
                <p>昵称：
                    <input type="text" name="nickname" size="40"  value="${user.ueser.nickname}">
                </p>
                <p>email：
                    <input type="text" name="email" size="40"  value="${user.ueser.email}">
                </p>
                <p>ID：
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" size="40" disabled="true" value="${user.studentId}">
                </p>
                <p>班级：
                    <input type="text" name="class" size="40" disabled="true" value="${user.aclass.className}">
                </p>
                <p>系部：
                    <input type="text" name="department" size="40" disabled="true" value="${user.aclass.department.departmentName}">
                </p>
                <p>
                    <input type="submit" id="submit" value="确定">
                    <input type="reset" value="取消">
                </p>

            </form>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>


</body>
</html>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>

<script>
    function viewImage(file){
        var preview = document.getElementById('preview');
        if(file.files && file.files[0]){
            //火狐下
            preview.style.display = "block";
            preview.style.width = "300px";
            preview.style.height = "120px";
            preview.src = window.URL.createObjectURL(file.files[0]);
        }else{
            //ie下，使用滤镜
            file.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小
            localImagId.style.width = "250px";
            localImagId.style.height = "200px";
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