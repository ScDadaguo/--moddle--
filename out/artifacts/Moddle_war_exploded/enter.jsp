<%@ page import="entity.UpFile" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.MainTitle" %>
<%@ page import="entity.Teacher" %>
<%@ page import="entity.Student" %>
<%--Created by IntelliJ IDEA.--%>
  <%--User: Administrator--%>
  <%--Date: 2018/6/4--%>
  <%--Time: 15:59--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    List<UpFile> upFileList = (List<UpFile>)request.getAttribute("upFileList");
    if(upFileList==null){
        request.getRequestDispatcher("/Servlet_filename").forward(request,response);
    }
%>

<%--从enter.jsp中接住courseName--%>
<%
    String courseName=request.getParameter("courseName");
%>
<%--从Servlet_printAllArticleTitle中拿到所有的教师开的话题--%>
<%
    request.setCharacterEncoding("UTF-8");
    List<MainTitle> allArticleTitlelist = (List<MainTitle>) request.getAttribute("allArticleTitlelist");
    if (allArticleTitlelist==null){
        request.getRequestDispatcher("/Servlet_printAllArticleTitle?courseName="+courseName).forward(request,response);
    }
%>
<%--<%--%>
    <%--request.setCharacterEncoding("UTF-8");--%>
    <%--List<Futext> futextList = (List<Futext>)request.getAttribute("title");--%>
    <%--if(futextList==null){--%>
        <%--request.getRequestDispatcher("/Servlet_getTitle?a=2").forward(request,response);--%>
    <%--}--%>

<%--%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Triangle</title>
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

<body>
<header id="header">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 overflow">
                <div class="social-icons pull-right">
                    <ul class="nav nav-pills">
                        <li><a href=""><i class="fa fa-facebook"></i></a></li>
                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                        <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                        <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                        <li><a href=""><i class="fa fa-linkedin"></i></a></li>
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
                    <h1><img src="images/logo.png" alt="logo"></h1>
                </a>

            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="index.html">Home</a></li>
                    <li class="dropdown"><a href="#">Pages <i class="fa fa-angle-down"></i></a>
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
                    </li>
                    <li class="dropdown"><a href="blog.html">Blog <i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
                            <li><a href="blog.html">Blog Default</a></li>
                            <li><a href="blogtwo.html">Timeline Blog</a></li>
                            <li><a href="blogone.html">2 Columns + Right Sidebar</a></li>
                            <li><a href="blogthree.html">1 Column + Left Sidebar</a></li>
                            <li><a href="blogfour.html">Blog Masonary</a></li>
                            <li><a href="blogdetails.html">Blog Details</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="portfolio.html">Portfolio <i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
                            <li><a href="portfolio.html">Portfolio Default</a></li>
                            <li><a href="portfoliofour.html">Isotope 3 Columns + Right Sidebar</a></li>
                            <li><a href="portfolioone.html">3 Columns + Right Sidebar</a></li>
                            <li><a href="portfoliotwo.html">3 Columns + Left Sidebar</a></li>
                            <li><a href="portfoliothree.html">2 Columns</a></li>
                            <li><a href="portfolio-details.html">Portfolio Details</a></li>
                        </ul>
                    </li>
                    <li><a href="shortcodes.html ">Shortcodes</a></li>
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

<section id="home-slider">
    <div class="container">
        <div class="row">
            <div class="main-slider">
                <div class="slide-text">
                    <h1>We Are Creative Nerds</h1>
                    <p>Boudin doner frankfurter pig. Cow shank bresaola pork loin tri-tip tongue venison pork belly meatloaf short loin landjaeger biltong beef ribs shankle chicken andouille.</p>
                    <a href="#" class="btn btn-common">SIGN UP</a>
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

<section id="services">
    <div class="container">
        <div class="row">
            <c:forEach items="${upFileList}" var="wow">
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
                            <img src="images/home/icon1.png" alt="">
                        </div>
                        <a href="Servlet_Download?filename=${wow.fileName}"><h2>
                            <tr><td>${wow.fileName}</h2></a>
                        <p>Ground round tenderloin flank shank ribeye. Hamkevin meatball swine. Cow shankle beef sirloin chicken ground round.</p>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>
</section>
<!--/#services-->

<section id="action" class="responsive">
    <div class="vertical-center">
        <div class="container">
            <div class="row">
                <div class="action take-tour">
                    <div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h1 class="title">Triangle Corporate Template</h1>
                        <p>A responsive, retina-ready &amp; wide multipurpose template.</p>
                    </div>
                    <div class="col-sm-5 text-center wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <div class="tour-button">
                            <a href="#" class="btn btn-common">TAKE THE TOUR</a>
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
            <c:forEach items="${allArticleTitlelist}" var="title">
                <%--从enter拿到超链接中的title 然后根据sql title得到text 再利用printservelt 重新打印--%>
                <div class="single-features">
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2><a href="Servlet_printArticle?title=${title.title}">${title.title}</a> </h2>
                        <P>Create Time：${title.createTime} --By:${title.teacher.ueser.ueserName}--From:Wenzhou Business College  </P>
                        <%--Pork belly leberkas cow short ribs capicola pork loin. Doner fatback frankfurter jerky meatball pastrami bacon tail sausage. Turkey fatback ball tip, tri-tip tenderloin drumstick salami strip steak--%>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>
</section>
<!--/#features-->

<section id="clients">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="clients text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
                    <p><img src="images/home/clients.png" class="img-responsive" alt=""></p>
                    <h1 class="title">Happy Clients</h1>
                    <p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br> Ut enim ad minim veniam, quis nostrud </p>
                </div>
                <div class="clients-logo wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="col-xs-3 col-sm-2">
                        <a href="#"><img src="images/home/client1.png" class="img-responsive" alt=""></a>
                    </div>
                    <div class="col-xs-3 col-sm-2">
                        <a href="#"><img src="images/home/client2.png" class="img-responsive" alt=""></a>
                    </div>
                    <div class="col-xs-3 col-sm-2">
                        <a href="#"><img src="images/home/client3.png" class="img-responsive" alt=""></a>
                    </div>
                    <div class="col-xs-3 col-sm-2">
                        <a href="#"><img src="images/home/client4.png" class="img-responsive" alt=""></a>
                    </div>
                    <div class="col-xs-3 col-sm-2">
                        <a href="#"><img src="images/home/client5.png" class="img-responsive" alt=""></a>
                    </div>
                    <div class="col-xs-3 col-sm-2">
                        <a href="#"><img src="images/home/client6.png" class="img-responsive" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/#clients-->

<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center bottom-separator">
                <img src="images/home/under.png" class="img-responsive inline" alt="">
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="testimonial bottom">
                    <h2>Testimonial</h2>
                    <div class="media">
                        <div class="pull-left">
                            <a href="#"><img src="images/home/profile1.png" alt=""></a>
                        </div>
                        <div class="media-body">
                            <blockquote>Nisi commodo bresaola, leberkas venison eiusmod bacon occaecat labore tail.</blockquote>
                            <h3><a href="#">- Jhon Kalis</a></h3>
                        </div>
                    </div>
                    <div class="media">
                        <div class="pull-left">
                            <a href="#"><img src="images/home/profile2.png" alt=""></a>
                        </div>
                        <div class="media-body">
                            <blockquote>Capicola nisi flank sed minim sunt aliqua rump pancetta leberkas venison eiusmod.</blockquote>
                            <h3><a href="">- Abraham Josef</a></h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="contact-info bottom">
                    <h2>Contacts</h2>
                    <address>
                        E-mail: <a href="mailto:someone@example.com">email@email.com</a> <br>
                        Phone: +1 (123) 456 7890 <br>
                        Fax: +1 (123) 456 7891 <br>
                    </address>

                    <h2>Address</h2>
                    <address>
                        Unit C2, St.Vincent's Trading Est., <br>
                        Feeder Road, <br>
                        Bristol, BS2 0UY <br>
                        United Kingdom <br>
                    </address>
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="contact-form bottom">
                    <h2>Send a message</h2>
                    <form id="main-contact-form" name="contact-form" method="post" action="sendemail.php">
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" required="required" placeholder="Email Id">
                        </div>
                        <div class="form-group">
                            <textarea name="message" id="message" required class="form-control" rows="8" placeholder="Your text here"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" class="btn btn-submit" value="Submit">
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="copyright-text text-center">
                    <p>&copy; Your Company 2014. All Rights Reserved.</p>
                    <p>Designed by <a target="_blank" href="http://www.jq22.com">Themeum</a></p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--/#footer-->

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/lightbox.min.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>









<%--————————————————————————————————————————————————————————--%>

