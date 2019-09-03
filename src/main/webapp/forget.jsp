<%--
  Created by IntelliJ IDEA.
  User: 13779
  Date: 2019/7/13
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-3.4.1.min.js"></script>
</head>
<script>
    $(function () {
        $('#chooseImage').on('change', function () {
            var filePath = $(this).val();         //获取到input的value，里面是文件的路径
            console.log(filePath);
            var fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
            console.log(fileFormat);
            var src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
            console.log(src);

            // 检查是否是图片
            if (!fileFormat.match(/.png|.jpg|.jpeg/)) {
                error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg');
                return;
            }

            $('#cropedBigImg').attr('src', src);
        });
    });
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
        height: 250px;
        background: #FFFFFF;
        /*以下css用于让登录表单垂直居中在界面,可删除*/
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -200px;
        margin-left: -175px;
        z-index: 3;
    }
    /*主面板结束*/

    /*注册EAlbum开始*/
    .title {
        width: 100%;
        height: 40px;
        line-height: 40px;
    }

    .title span {
        font-size: 18px;
        color: #353f42;
    }


    .title:hover {
        cursor: default;
    }
    /*注册EAlbum结束*/


    /*表单部分*/
    .input-content {
        width: 100%;
        height: 150px;

    }

    .input-content input {
        width: 330px;
        height: 40px;
        border: 1px solid #dad9d6;
        background: #ffffff;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 10px;
    }

    .enter-btn {
        width: 350px;
        height: 40px;
        color: #fff;
        background: #0bc5de;
        line-height: 40px;
        text-align: center;
        border: 0px;
    }


    .enter-btn:hover {
        cursor: pointer;
        background: #1db5c9;
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
    <div class="title">
        <span>EAlbum忘记密码</span>
    </div>
    <form class="login-form" action="Forget"  method="post" novalidate>
        <!--输入框-->
        <div class="input-content">
            <div>
                <input type="text" autocomplete="off"
                       placeholder="昵称" name="nickName" required/>
            </div>
            <div>
                <input type="text" autocomplete="off"
                       placeholder="邮箱" name="mail" required/>
            </div>
        </div>
        <!--登入按钮-->
        <div style="text-align: center">
            <button type="submit" class="enter-btn">验证并发送密码</button>
        </div>
    </form>
</div>
<div id="i-foot">
    <p>
        ©2019&nbsp&nbspEAlbum&nbsp&nbspLT3211
    </p>
</div>
</body>
</html>
