<%--
  Created by IntelliJ IDEA.
  User: WZBC
  Date: 2018/6/6
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Blog Timeline | Triangle</title>
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
</head>
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
                    <i class="fa fa-search"></i>
                    <div class="field-toggle">
                        <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>

<section id="page-breadcrumb">
    <div class="vertical-center sun">
        <div class="container">
            <div class="row">
                <div class="action">
                    <div class="col-sm-12">
                        <h1 class="title">Class</h1>
                        <p>classname,students...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/#page-breadcrumb-->

<section id="blog" class="padding-bottom">
    <div class="container">
        <div class="row">
            <div class="timeline-blog overflow padding-top">
                <div class="timeline-date text-center">
                    <a href="#" class="btn btn-common uppercase">Class</a>
                </div>
                <c:forEach items="${classnameList}" var="cla">
                <div class="timeline-divider overflow padding-bottom">

                        <div class="col-sm-6 arrow-right llhnew" data-wow-duration="1000ms" data-wow-delay="300ms">
                        <div class="single-blog timeline">
                        <div class="single-blog-wrapper">
                            <div class="post-thumb">
<!--                                <img src="images/blog/timeline/1.jpg" class="img-responsive" alt="">-->

                            </div>
                        </div>
                        <div class="post-content overflow">
                                <c:forEach items="${studentList}" var="stu">
                                    <c:if test="${cla.className eq stu.aclass.className}">


                                                    <p>${stu.ueser.id}&nbsp;&nbsp;
                                                            ${stu.ueser.ueserName}</p>
                                    </c:if></c:forEach>
                                                    <div class="post-bottom overflow">
                                                        <span class="post-date pull-left"><a href="ServletSelectCourseName?ClassID=${cla.classId}">${cla.className}</a></span>
                                                        <span class="comments-number pull-right"><a href="#">（该班级人数）</a></span>
                                                                </div>

                                                </div>
                                            </div>
                                        </div>





                </div></c:forEach>
            </div>

        </div>
    </div>
</section>


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
