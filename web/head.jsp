<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2018/6/20
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
</body>
</html>
