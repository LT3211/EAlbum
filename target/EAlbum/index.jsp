<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <link type="text/css" href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet">
    <link type="text/css" href="<%=request.getContextPath()%>/css/partialviewslider.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/partialviewslider.js"></script>
</head>
<script>
    $(document).ready(function () {
        $('#partial-view').partialViewSlider();
    });
</script>
<style>
    <%--z最外层div--%>
    .i-banner{
        width: 100%;
        height: 380px;
        position: absolute;
        top: 50%;
        margin-top: -190px;

    }

    <%--轮播图--%>
    .i-left{
        float: left;
        width: 800px ;
        height: 374px;
    }

    <%--登陆框--%>
    .i-right{
        margin-left: 80px;
        margin-top: 4px;
    }

    .i-core{
        overflow: hidden;
        width: 1290px;
        margin: 0 auto;
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
<div class="i-banner">
    <div class="i-core">
        <%--轮播图--%>
        <div class="i-left">
            <ul id="partial-view">
                <li>
                    <img src="images/img1.jpg"/>
                </li>
                <li>
                    <img src="images/img2.jpg"/>
                </li>
                <li>
                    <img src="images/img3.jpg"/>
                </li>
                <li>
                    <img src="images/img4.jpg"/>
                </li>
                <li>
                    <img src="images/img5.jpg"/>
                </li>
            </ul>
        </div>
        <%--登陆框--%>
        <div class="main i-right" style="float: left">
            <div class="title">
                <span>欢迎来到EAlbum</span>
            </div>
            <div class="title-msg">
                <span>请输入登录账户和密码</span>
            </div>
            <form class="login-form" action="Login" name="loginForm" method="post" novalidate>
                <!--输入框-->
                <div class="input-content">
                    <!--autoFocus-->
                    <div>
                        <input type="text" autocomplete="off"
                               placeholder="登录邮箱" name="mail" required/>
                    </div>
                    <div style="margin-top: 16px">
                        <input type="password"
                               autocomplete="off" placeholder="登录密码" name="password" required maxlength="32"/>
                    </div>
                </div>
                <!--登入按钮-->
                <div style="text-align: center">
                    <button type="submit" class="enter-btn">登录</button>
                </div>
                <div class="foor">
                    <div class="left"><span><a href="forget.jsp" style="text-decoration: none;color: inherit">忘记密码?</a></span></div>
                    <div class="right"><span><a href="register.jsp" style="text-decoration: none;color: inherit">注册账户</a></span></div>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="i-foot">
    <p>
        ©2019&nbsp&nbspEAlbum&nbsp&nbspLT3211
    </p>
</div>
</body>
</html>
