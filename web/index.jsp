<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2018/6/18
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <style type="text/css">
      #mydiv{
        position:absolute;
        left: 50%;
        top: 50%;
        margin-left: -200px;
        margin-top: -50px;
      }
    </style>
    <script type="text/javascript">
      <%--获得用户输入内容的关联信息的函数--%>
      function  getMoreContents() {
      //    首先获得用户的输入
          var content=document.getElementById("keyword");
          if(content.value==""){
              return;
          }
      //    然后给服务器发送用户输入的内容,我们采用的是ajax异步发送数据.
      //    所以我们要用一个对象,叫做XmlHttp对象
      //     获得XmlHttp对象
          xmlHttp=createXMLHttp();
      //    要给服务器发送数据
      //    不加escape中文会有问题
          var url="/Servlet_search?keyword="+escape(content.value);
          //true表示js脚本会在send（）方法之后继续执行，不会等待来自服务器的响应
          xmlHttp.open("GET",url,true);
      //    xmlhtp绑定回调方法，这个回调方法会在xmlhttp状态改变的时候被调用
      //    xmlhttp的状态有0-4，我们只关心4（compete）完成的时候这个状态
      //   完成之后，回调方法才有意义
          xmlHttp.onreadystatechange=callBack;
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
              }
          }
      }
      //设置关联数据的展示
      function  setContent(contents) {
          //首先获得关联数据的长度，以此来确定生成多少tr td；
          var  size=contents.length;
      //    设置内容
          for(var  i=0;i<size;i++){
              //代表的是json格式数据的第i个元素
              var nextNode=contents[i];
              var tr=document.createElement("tr");
              var td=document.createElement("td");
              td.setAttribute("border","0");
              td.setAttribute("bgcolor","#FFFAFA")；
              td.onmouseover=function () {
                  this.className='mouseOver'
              }
              td.onMouseOut=function () {
                  this.className='mouseOut';
              }
              td.onclick=function () {
              //    这个方法实现的是，当鼠标点击一个关联的数据，关联数据自动设置为输入框的数据
              }
              var text=document.createTextNode(nextNode);
              td.appendChild(text);
              tr.appendChild(td);
              document.getElementById("content_table_body").appendChild(tr)
          }
      }


    </script>
    <title>$Title$</title>
  </head>
  <body>
  <div id="mydiv">
    <%--输入框--%>
    <input type="text" size="20" id="keyword" onkeyup="getMoreContents()"/>
    <input type="button" value="百度一下" width="50px">
      <%--内容展示的区域--%>
    <div id="popDiv">
          <table id="content_table" bgcolor="#FFAFA" BORDER="0" cellspacing="0" cellpadding="0">
            <tbody id="content_table_body">
            <%--动态查询的数据显示在这个地方--%>
            <tr><td>ajax</td></tr>
            <tr><td>ajax1</td></tr>
            <tr><td>ajax2</td></tr>
            <tr><td>ajax3</td></tr>
            </tbody>
          </table>
    </div>


  </body>
</html>
