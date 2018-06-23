<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/6
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if(request.getAttribute("departmentList")==null){
        request.getRequestDispatcher("/ServletDepartmentList").forward(request,response);
   }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>First Page & Department-Name</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet">
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
</head><!--/head-->
<style type="text/css">
    #mydiv{
        position:absolute;
        left: 50%;
        top: 50%;
        margin-left: -200px;
        margin-top: -50px;
    }
    .mouseOver{
        background: #00aeef;
        color: #1C1C1B;
    }
    /*.mouseOut{*/
    /*background: #1C1C1B;*/
    /*color: #831c20;*/
    /*}*/


</style>
<script type="text/javascript">
    <%--获得用户输入内容的关联信息的函数--%>

    function  getMoreContents() {
        //    首先获得用户的输入
        var content=document.getElementById("keyword");
        //当获得焦点文本框里 并且按下回车

        if(content.value==""){
            clearContent();
            return;
        }

        //    然后给服务器发送用户输入的内容,我们采用的是ajax异步发送数据.
        //    所以我们要用一个对象,叫做XmlHttp对象
        //     获得XmlHttp对象
        xmlHttp=createXMLHttp();
        // alert(xmlHttp);
        //    要给服务器发送数据
        //    不加escape中文会有问题

        var url=encodeURI("Servlet_search?keyword="+               (content.value));
        //true表示js脚本会在send（）方法之后继续执行，不会等待来自服务器的响应
        xmlHttp.open("GET",url,true);
        //    xmlhtp绑定回调方法，这个回调方法会在xmlhttp状态改变的时候被调用
        //    xmlhttp的状态有0-4，我们只关心4（compete）完成的时候这个状态
        //   完成之后，回调方法才有意义
        xmlHttp.onreadystatechange=callback;
        xmlHttp.send(null);

    }
    function CheckInfo() {
        if (event.keyCode == 13) {
            window.location.href="wowo.jsp";
        }
    }
    //获得XmlHttp对象
    function  createXMLHttp() {
        //    对于大多数浏览器适合
        var xmlHttp;
        //如果浏览器里有这个对象
        if (window.XMLHttpRequest){
            xmlHttp=new XMLHttpRequest();
        }
        //要考虑浏览器的兼容性
        if (window.ActiveXObject){
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            //如果浏览器有ActiveXObject对象 但是没有Microsoft.XMLHTTP参数
            if(!xmlHttp){
                xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
            }
        }
        return xmlHttp;
    }
    function callback() {
        if (xmlHttp.readyState==4){
            //服务器响应成功
            if(xmlHttp.status==200){
                //交互成功，获得相应的数据，是文本格式
                var result=xmlHttp.responseText;
                //    解析获得的数据
                //    js认识的json比java认识的json数据最外面少一个（）
                var json=eval("("+result+")");
                //    获得数据之后，就可以动态的显示这些数据了，把这些数据展示到输入框的下面
                setContent(json)
            }
        }
    }
    //设置关联数据的展示
    function  setContent(contents) {

        clearContent();
        serLocation();
        //首先获得关联数据的长度，以此来确定生成多少tr td；
        var  size=contents.length;
        //    设置内容
        for(var  i=0;i<size;i++){
            //代表的是json格式数据的第i个元素
            var nextNode=contents[i];
            var tr=document.createElement("tr");
            var td=document.createElement("td");
            td.setAttribute("border","0");
            td.setAttribute("bgcolor","#FFFAFA");
            td.onmouseover=function () {
                this.className='mouseOver';
                var content=document.getElementById("keyword");
                content.value=this.innerText;

            }
            td.onmouseout=function () {
                this.className='mouseOut';


            }
            td.onclick=function () {
                // alert("aaa")
                //    这个方法实现的是，当鼠标点击一个关联的数据，关联数据自动设置为输入框的数据
            }
            var text=document.createTextNode(nextNode);
            td.appendChild(text);
            tr.appendChild(td);
            document.getElementById("content_table_body").appendChild(tr)
        }
    }
    function serLocation() {
        // 设置显示关联信息的位置
        var content=document.getElementById("keyword");
        var  width=content.offsetWidth;
        var left=content["offsetLeft"];
        var top=content["offsetTop"]+content.offsetHeight//到顶部的距离
        var popDiv=document.getElementById("popDiv");
        popDiv.style.border="black 1px solid";
        popDiv.style.left=left+"px";
        popDiv.style.top=top+"px";
        popDiv.style.width=width+"px";
        document.getElementById("content_table").style.width=width+"px";
    }
    //清空之前数据的方法
    function clearContent () {
        var  contentTableBody=document.getElementById("content_table_body");
        var size=contentTableBody.childNodes.length;
        for (var i=size-1;i>=0;i--){
            contentTableBody.removeChild(contentTableBody.childNodes[i]);
        }
        document.getElementById("popDiv").style.border="none"
    }
    //当输入框失去焦点的时候,清空
    function keywordBlur() {
        clearContent()
    }


</script>
<body>
<header id="header">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 overflow">
                <div class="social-icons pull-right">
                    <ul class="nav nav-pills">
<!--
                        <li><a href=""><i class="fa fa-facebook"></i></a></li>
                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                        <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                        <li><a href=""><i class="fa fa-dribbble"></i></a></li>
-->
                        <li><a href="Login.jsp">Log <i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar navbar-inverse" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" href="Department.jsp">
                    <h1><img src="images/logowzbc.png" alt="logo"></h1>
                </a>

            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="Department.jsp">Home</a></li>
                    <li class="dropdown"><a href="Login.jsp">My home page
<!--                        <i class="fa fa-angle-down"></i>-->
                        </a>
<!--
                        <ul role="menu" class="sub-menu">
                            <li><a href="aboutus.html">About</a></li>
                            <li><a href="aboutus2.html">About 2</a></li>
                            <li><a href="service.html">Services</a></li>
                            <li><a href="pricing.html">Pricing</a></li>
                            <li><a href="contact.html">Contact us</a></li>
                            <li><a href="contact2.html">Contact us 2</a></li>
                            <li><a href="404.html">404 error</a></li>
                            <li><a href="coming-soon.html">Coming Soon</a></li>
                        </ul>
-->
                    </li>
                    <li class="dropdown"><a href="Login.jsp">Discussion Area
<!--                        <i class="fa fa-angle-down"></i>-->
                        </a>
<!--
                        <ul role="menu" class="sub-menu">
                            <li><a href="blog.html">Blog Default</a></li>
                            <li><a href="blogtwo.html">Timeline Blog</a></li>
                            <li><a href="blogone.html">2 Columns + Right Sidebar</a></li>
                            <li><a href="blogthree.html">1 Column + Left Sidebar</a></li>
                            <li><a href="blogfour.html">Blog Masonary</a></li>
                            <li><a href="blogdetails.html">Blog Details</a></li>
                        </ul>
-->
                    </li>
                    <li class="dropdown"><a href="portfolio.html">Department Links <i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
                            <c:forEach items="${departmentList}" var="dep">
                                <li><a href="ServletSelectClassName?departmentID=${dep.departmentId}" ># ${dep.departEngName}</a></li>

                            </c:forEach>

                        </ul>
                    </li>
<!--                    <li><a href="shortcodes.html ">Shortcodes</a></li>-->
                </ul>
            </div>
            <div class="search">
                <form role="form">
                    <i class="fa fa-search"><a href="wowo.jsp"></a>></i>
                    <div class="field-toggle">
                        <input type="text" class="search-form" autocomplete="off" placeholder="Search" id="keyword" onkeyup="getMoreContents()" onblur="keywordBlur()"  onfocus="getMoreContents()" onkeypress="CheckInfo();return false;">
                        <div id="popDiv">
                            <table id="content_table" bgcolor="#FFAFA" BORDER="0" cellspacing="0" cellpadding="0">
                                <tbody id="content_table_body">
                                <!--
                                            <%--动态查询的数据显示在这个地方--%>
                                            <%--<tr><td>ajax</td></tr>--%>
                                            <%--<tr><td>ajax1</td></tr>--%>
                                            <%--<tr><td>ajax2</td></tr>--%>
                                            <%--<tr><td>ajax3</td></tr>--%>
-->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
<!--/#header-->

<section id="home-slider">
    <div class="container">
        <div class="row">
            <div class="main-slider">
                <div class="slide-text">
                    <h1>Welcome the Wenzhou business school ...</h1>
                    <p>平台可以及时的进行学习交互，及时的更新教学内容，学生可以自主的登陆这个平台 来自主学习，交作业等等。我们希望让每一个学生都充分发表自己的想法，并和同学进行交流！</p>
                    <a href="Login.jsp" class="btn btn-common">LOG IN</a>
                </div>
                <img src="images/home/slider/hill.png" class="slider-hill" alt="slider image">
                <img src="images/home/slider/house.png" class="slider-house" alt="slider image">
                <img src="images/home/slider/sun.png" class="slider-sun" alt="slider image">
                <img src="images/home/slider/birds1.png" class="slider-birds1" alt="slider image">
                <img src="images/home/slider/birds2.png" class="slider-birds2" alt="slider image">
            </div>
        </div>
    </div>
    <div class="preloader"><i class="fa fa-sun-o fa-spin"></i></div>
</section>
<!--/#home-slider-->




<section id="action" class="responsive">
    <div class="vertical-center">
        <div class="container">
            <div class="row">
                <div class="action take-tour">
                    <div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h1 class="title">Department Links</h1>
                        <p>School of Information Engineering, College of Art ...</p>
                    </div>
                    <div class="col-sm-5 text-center wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <div class="tour-button">
                            <a href="Login.jsp" class="btn btn-common">Start learning</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/#action-->

<section id="features">
    <div class="container">
        <div class="row">
            <c:forEach items="${departmentList}" var="dep">
                <div class="single-features">
                    <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="${dep.depImg}" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2><a href="ServletSelectClassName?departmentID=${dep.departmentId}" >${dep.departmentName}</a></h2>
                        <P>${dep.content}</P>
                    </div>
                </div>
            </c:forEach>

            <!--<div class="single-features">-->
            <!--<div class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">-->
            <!--<h2>Built for the Responsive Web</h2>-->
            <!--<P>Mollit eiusmod id chuck turducken laboris meatloaf pork loin tenderloin swine. Pancetta excepteur fugiat strip steak tri-tip. Swine salami eiusmod sint, ex id venison non. Fugiat ea jowl cillum meatloaf.</P>-->
            <!--</div>-->
            <!--<div class="col-sm-5 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">-->
            <!--<img src="images/home/image2.png" class="img-responsive" alt="">-->
            <!--</div>-->
            <!--</div>-->
            <!--<div class="single-features">-->
            <!--<div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">-->
            <!--<img src="images/home/image3.png" class="img-responsive" alt="">-->
            <!--</div>-->
            <!--<div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">-->
            <!--<h2>Experienced and Enthusiastic</h2>-->
            <!--<P>Ut officia cupidatat anim excepteur fugiat cillum ea occaecat rump pork chop tempor. Ut tenderloin veniam commodo. Shankle aliquip short ribs, chicken eiusmod exercitation shank landjaeger spare ribs corned beef.</P>-->
            <!--</div>-->
            <!--</div>-->
        </div>
    </div>
</section>
<!--/#features-->



<footer id="footer2">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="images/home/under.png" class="img-responsive inline" alt="">
                </div>



                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p>&copy; Wenzhou Business School 2018. All Rights Reserved.</p>
                        <p>Designed by <a target="_blank" href="https://cn.linkedin.com/in/昊-李-785223156?trk=pub-pbmap">PP昊</a> <a target="_blank" href="http://www.11467.com/heze/co/21248.htm">PP迪</a>  <a target="_blank" href="https://baike.baidu.com/item/郭浩/9690843?fr=aladdin">PP浩</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>


<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/lightbox.min.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
