<%--
  Created by IntelliJ IDEA.
  User: 13779
  Date: 2019/7/14
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>Title</title>
</head>
<script>
    window.setInterval("location='index.jsp'",3000);
</script>
<style>
    body {
        background: url("images/FreshSalt_ZH-CN12818759319_1920x1080.jpg") no-repeat fixed;
    }

    body:after{
        content: "";
        width:100%;
        height:100%;
        position: absolute;
        left:0;
        top:0;
        background: inherit;
        filter: blur(8px);
        z-index: 2;
    }

    * {
        padding: 0;
        margin: 0;
    }

    /*主面板开始*/
    .main {
        margin: 0 auto;
        padding-left: 25px;
        padding-right: 25px;
        padding-top: 15px;
        width: 350px;
        height: 200px;
        background: #fff;
        /*以下css用于让登录表单垂直居中在界面,可删除*/
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -175px;
        margin-left: -175px;
        z-index: 3;
    }
    /*主面板结束*/

    /*注册EAlbum开始*/
    .title {
        width: 100%;
        height: 40px;
        line-height: 40px;
        /*border-bottom: 1px solid #353f42;*/
    }

    .title span {
        font-size: 18px;
        color: #353f42;

    }

    #foot{
        position: absolute;
        right: 0px;
        bottom: 5px;
    }

    #foot span{
        float: right;
    }


    .title:hover {
        cursor: default;
    }
    /*注册EAlbum结束*/

    .jg{
        background-color: #dad9d6;
        width: 400px;
        text-align: center;
        height: 70px;
        padding-top: 50px;
        position: absolute;
        left: 0px;
    }

    .jg span{
        font-size: 25px;
        color: #353f42;
    }

    #i-foot{
        width: 100%;
        position: absolute;
        bottom: 47px;
        margin: 0 auto;
        text-align: center;
    }

    #i-foot p{
        display: block;
        text-align: center;
    }


</style>
<body>
<div class="main">
    <div class="title" >
        <span>EAlbum结果页面</span>
    </div>
    <div class="jg">
        <span><%=session.getAttribute("msg")%></span>
    </div>
    <div class="title" id="foot">
        <span><a href="index.jsp" style="text-decoration: none">页面即将跳转......</a></span>
    </div>
</div>
<div id="i-foot">
    <p>
        ©2019&nbsp&nbspEAlbum&nbsp&nbspLT3211
    </p>
</div>
</body>
</html>

