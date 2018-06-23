<%--
  Created by IntelliJ IDEA.
  User: 战神皮皮迪
  Date: 2018/6/7
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="StudentPersonalPage.jsp"></jsp:include>
<form method="post" id="form1">


    <p>学号：<input type="text" name="username" size="10" value="${user.ueser.id}"></p>
    <p>教务系统密码：<input type="password" name="password" size="10"></p>
    <p>
        <input type="button" id="submit" value="确定" onclick="get_socre()">
        <input type="reset" value="取消" onclick="clearTable()">
    </p>
    <%--use ajax to put form than get response from restful api--%>
</form>
<table id="myTb" style=" width:100%">

</table> </body>
</html>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script>
    $.fn.serializeObject = function()
    {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };
    function get_socre() {
        $.ajax({
            //some parms need to take care
            type: "POST",//method type
            contentType : "application/json",//post data type
            dataType: "json",//return type
                url: "http://111.231.255.225:5010/api/get_score" ,//url
            data: JSON.stringify($('#form1').serializeObject()),
            success: function (result) {
                var dataArray=result['data'];
                //first get type from dataArray
                if ((typeof dataArray == "string") && dataArray.startsWith("用户名")){
                    alert("用户名不存在!")
                } else if((typeof dataArray == "string") && dataArray.startsWith("密码")){
                    alert("密码错误!")
                }
                else {
                    addToHtml(dataArray)
                }


            },
            error : function() {
                alert("请求错误");
            }
        });

    function addToHtml(dataArray) {

        //render  html
        //to have a new table  need to clear last table
        clearTable();

        var tbody="<tr>\n" +
            "        <th>课程名称：</th>\n" +
            "        <th>课程性质：</th>\n" +
            "        <th>课程代码：</th>\n" +
            "        <th>绩点：</th>\n" +
            "        <th>成绩：</th>\n" +
            "    </tr>"
        $("#myTb").append(tbody);
        for (var i in dataArray){

            var tr="";
            tr += "<tr><td>" + dataArray[i]["课程名称"]  +"</td>"+
                "<td>" + dataArray[i]["课程性质"]  +"</td>"+
                "<td>" + dataArray[i]["课程代码"]  +"</td>"+
                "<td>" + dataArray[i]["绩点"]  +"</td>"+
                "<td>" + dataArray[i]["成绩"]  +"</td>"+
                "</tr>";
            $("#myTb").append(tr);
        }
    }


    }
    function clearTable() {
        $("#myTb").html("");
    }
</script>

</script>
