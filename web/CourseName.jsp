<%--
  Created by IntelliJ IDEA.
  User: lianglihao
  Date: 2018/6/8
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Curriculum for Class</title>
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
</head><!--/head-->

<body>
<header id="header">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 overflow">
                <div class="social-icons pull-right">
                    <ul class="nav nav-pills">
                        <li><a href="">Log <i class="fa fa-linkedin"></i></a></li>
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

                <a class="navbar-brand" href="index.html">
                    <h1><img src="images/logowzbc.png" alt="logo"></h1>
                </a>

            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="Department.jsp">Home</a></li>
                    <li class="dropdown"><a href="#">My home page 
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
                    <li class="dropdown"><a href="articleComment.jsp">Discussion Area 
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
                            <li><a href="portfolio.html"># School of Information Engineering</a></li>
                            <li><a href="portfoliofour.html"># College of Art</a></li>
                            <li><a href="portfolioone.html"># College of Finance</a></li>
                            <li><a href="portfoliotwo.html"># School of Management</a></li>
                            <li><a href="portfoliothree.html"># College of Accounting</a></li>
                            <li><a href="portfolio-details.html"># International College</a></li>
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
<!--/#header-->


<section id="page-breadcrumb">
    <div class="vertical-center sun">
        <div class="container">
            <div class="row">
                <div class="action">
                    <div class="col-sm-12">
                        <h1 class="title">Curriculum</h1>
                        <p>List of all the courses</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/#action-->

<section id="blog" class="padding-top">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-7">
                <div class="row">
                    <%--++++++++++++++++++++++++++++++++++++++++++--%>
                        <c:forEach items="${coursenameList}" var="cname" varStatus="loop">
                        <div class="col-md-6 col-sm-12 blog-padding-right">
                            <div class="single-blog two-column">
                                <div class="post-thumb">
                                    <a href="blogdetails.html"><img src="${cname.courseImg}" class="img-responsive" alt=""></a>
                                    <div class="post-overlay">
                                        <span class="uppercase"><a href="#">14 <br><small>Feb</small></a></span>
                                    </div>
                                </div>
                                <div class="post-content overflow">
                                    <h3 class="post-author"><a href="#">Course Name</a></h3>
                                    <h2 class="post-title bold"><a href="Login.jsp">${cname.courseName}</a></h2>
<!--                                    <h3 class="post-author"><a href="#">Posted by micron News</a></h3>-->
                                    <a href="#" class="read-more">Course Contene</a>
                                    <p>${cname.content}</p>
<!--                                    <a href="#" class="read-more">View More</a>-->
<!--
                                    <div class="post-bottom overflow">
                                        <ul class="nav nav-justified post-nav">
                                            <li><a href="#"><i class="fa fa-tag"></i>Creative</a></li>
                                            <li><a href="#"><i class="fa fa-heart"></i>32 Love</a></li>
                                            <li><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>
                                        </ul>
                                    </div>
-->
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="blog-pagination">
                    <ul class="pagination">
                        <li><a href="#">left</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">8</a></li>
                        <li><a href="#">9</a></li>
                        <li><a href="#">right</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3 col-sm-5">
                <div class="sidebar blog-sidebar">
<!--
                    <div class="sidebar-item  recent">
                        <h3>Comments</h3>
                        <div class="media">
                            <div class="pull-left">
                                <a href="#"><img src="images/portfolio/project1.jpg" alt=""></a>
                            </div>
                            <div class="media-body">
                                <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                <p>posted on  07 March 2014</p>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <a href="#"><img src="images/portfolio/project2.jpg" alt=""></a>
                            </div>
                            <div class="media-body">
                                <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                <p>posted on  07 March 2014</p>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <a href="#"><img src="images/portfolio/project3.jpg" alt=""></a>
                            </div>
                            <div class="media-body">
                                <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                <p>posted on  07 March 2014</p>
                            </div>
                        </div>
                    </div>
-->
<!--
                    <div class="sidebar-item categories">
                        <h3>Categories</h3>
                        <ul class="nav navbar-stacked">
                            <li><a href="#">Lorem ipsum<span class="pull-right">(1)</span></a></li>
                            <li class="active"><a href="#">Dolor sit amet<span class="pull-right">(8)</span></a></li>
                            <li><a href="#">Adipisicing elit<span class="pull-right">(4)</span></a></li>
                            <li><a href="#">Sed do<span class="pull-right">(9)</span></a></li>
                            <li><a href="#">Eiusmod<span class="pull-right">(3)</span></a></li>
                            <li><a href="#">Mockup<span class="pull-right">(4)</span></a></li>
                            <li><a href="#">Ut enim ad minim <span class="pull-right">(2)</span></a></li>
                            <li><a href="#">Veniam, quis nostrud <span class="pull-right">(8)</span></a></li>
                        </ul>
                    </div>
-->
<!--
                    <div class="sidebar-item tag-cloud">
                        <h3>Tag Cloud</h3>
                        <ul class="nav nav-pills">
                            <li><a href="#">Corporate</a></li>
                            <li><a href="#">Joomla</a></li>
                            <li><a href="#">Abstract</a></li>
                            <li><a href="#">Creative</a></li>
                            <li><a href="#">Business</a></li>
                            <li><a href="#">Product</a></li>
                        </ul>
                    </div>
-->
                    <div class="sidebar-item popular">
                        <h3>Latest Photos</h3>
                        <ul class="gallery">
                            <li><a href="#"><img src="images/404.png" alt=""></a></li>
                            <li><a href="#"><img src="images/home/tour-icon2.png" alt=""></a></li>
                            <li><a href="#"><img src="images/logowzbc.png" alt=""></a></li>
                            <li><a href="#"><img src="images/logo.png" alt=""></a></li>
                            <li><a href="#"><img src="images/logowzbct.png" alt=""></a></li>
                            <li><a href="#"><img src="images/home/tour-icon1.png" alt=""></a></li>
                            <li><a href="#"><img src="images/portfolio/popular1.jpg" alt=""></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </section>
<!--/#blog-->

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
