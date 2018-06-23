<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Blog + Left Sidebar | Triangle</title>
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
          <li><a href="index.html">Home</a></li>
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
          <li class="dropdown active"><a href="blog.html">Blog <i class="fa fa-angle-down"></i></a>
            <ul role="menu" class="sub-menu">
              <li><a href="blog.html">Blog Default</a></li>
              <li><a href="blogtwo.html">Timeline Blog</a></li>
              <li><a href="blogone.html">2 Columns + Right Sidebar</a></li>
              <li><a class="active" href="blogthree.html">1 Column + Left Sidebar</a></li>
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
            <input type="text" class="search-form" autocomplete="off" placeholder="Search" id="keyword" onkeyup="getMoreContents()" onblur="keywordBlur()"  onfocus="getMoreContents()">
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

<section id="page-breadcrumb">
  <div class="vertical-center sun">
    <div class="container">
      <div class="row">
        <div class="action">
          <div class="col-sm-12">
            <h1 class="title">Blog</h1>
            <p>Blog with right sidebar</p>
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
      <div class="col-md-3 col-sm-5">
        <div class="sidebar blog-sidebar">
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
          <div class="sidebar-item popular">
            <h3>Latest Photos</h3>
            <ul class="gallery">
              <li><a href="#"><img src="images/portfolio/popular1.jpg" alt=""></a></li>
              <li><a href="#"><img src="images/portfolio/popular2.jpg" alt=""></a></li>
              <li><a href="#"><img src="images/portfolio/popular3.jpg" alt=""></a></li>
              <li><a href="#"><img src="images/portfolio/popular4.jpg" alt=""></a></li>
              <li><a href="#"><img src="images/portfolio/popular5.jpg" alt=""></a></li>
              <li><a href="#"><img src="images/portfolio/popular1.jpg" alt=""></a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-md-9 col-sm-7">
        <div class="row">
          <div class="col-md-12 col-sm-12">
            <div class="single-blog two-column">
              <div class="post-thumb">
                <a href="blogdetails.html"><img src="images/blog/7.jpg" class="img-responsive" alt=""></a>
                <div class="post-overlay">
                  <span class="uppercase"><a href="#">14 <br><small>Feb</small></a></span>
                </div>
              </div>
              <div class="post-content overflow">
                <h2 class="post-title bold"><a href="blogdetails.html">Advanced business cards design</a></h2>
                <h3 class="post-author"><a href="#">Posted by micron News</a></h3>
                <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber [...]</p>
                <a href="#" class="read-more">View More</a>
                <div class="post-bottom overflow">
                  <ul class="nav navbar-nav post-nav">
                    <li><a href="#"><i class="fa fa-tag"></i>Creative</a></li>
                    <li><a href="#"><i class="fa fa-heart"></i>32 Love</a></li>
                    <li><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-12 col-sm-12">
            <div class="single-blog two-column">
              <div class="post-thumb">
                <a href="blogdetails.html"><img src="images/blog/8.jpg" class="img-responsive" alt=""></a>
                <div class="post-overlay">
                  <span class="uppercase"><a href="#">14 <br><small>Feb</small></a></span>
                </div>
              </div>
              <div class="post-content overflow">
                <h2 class="post-title bold"><a href="blogdetails.html">Advanced business cards design</a></h2>
                <h3 class="post-author"><a href="#">Posted by micron News</a></h3>
                <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber [...]</p>
                <a href="#" class="read-more">View More</a>
                <div class="post-bottom overflow">
                  <ul class="nav navbar-nav post-nav">
                    <li><a href="#"><i class="fa fa-tag"></i>Creative</a></li>
                    <li><a href="#"><i class="fa fa-heart"></i>32 Love</a></li>
                    <li><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-12 col-sm-12">
            <div class="single-blog two-column">
              <div class="post-thumb">
                <a href="blogdetails.html"><img src="images/blog/9.jpg" class="img-responsive" alt=""></a>
                <div class="post-overlay">
                  <span class="uppercase"><a href="#">14 <br><small>Feb</small></a></span>
                </div>
              </div>
              <div class="post-content overflow">
                <h2 class="post-title bold"><a href="blogdetails.html">Advanced business cards design</a></h2>
                <h3 class="post-author"><a href="#">Posted by micron News</a></h3>
                <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber [...]</p>
                <a href="#" class="read-more">View More</a>
                <div class="post-bottom overflow">
                  <ul class="nav navbar-nav post-nav">
                    <li><a href="#"><i class="fa fa-tag"></i>Creative</a></li>
                    <li><a href="#"><i class="fa fa-heart"></i>32 Love</a></li>
                    <li><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="blog-pagination">
          <ul class="pagination">
            <li><a href="#">left</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li class="active"><a href="#">3</a></li>
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
    </div>
  </div>
</section>
<!--/#blog-->

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
              <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your text here"></textarea>
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
