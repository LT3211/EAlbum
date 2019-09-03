<%--
  Created by IntelliJ IDEA.
  User: 13779
  Date: 2019/6/27
  Time: 9:53
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
        height: 500px;
        background: #FFFFFF;
        /*以下css用于让登录表单垂直居中在界面,可删除*/
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -250px;
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

    /*头像部分开始*/
    #head {
        width: 100px;
        margin: 0 auto;
        height: 135px;
        margin-bottom: 10px;
    }

    #chooseImage {
        position: absolute;
        overflow: hidden;
        right: 0;
        top: 0;
        opacity: 0;
    }

    .upload {
        padding: 4px 10px;
        height: 20px;
        line-height: 20px;
        position: relative;
        border: 1px solid #999;
        text-decoration: none;
        color: #666;
        margin-left: 5px;
    }

    #cropedBigImg {
        width: 100px;
        height: 100px;
        border-radius: 50px;
        display: block;
        margin-bottom: 10px;
    }
    /*头像部分结束*/


    /*表单部分*/
    .input-content {
        width: 100%;
        height: 400px;

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
        <span>EAlbum注册</span>
    </div>
    <form class="login-form" enctype="multipart/form-data" action="Register" method="post" novalidate>
        <!--输入框-->
        <div class="input-content" style="margin-bottom: 10px;">
            <!-- 保存用户自定义的背景图片 -->
            <div id="head">
                <img id="cropedBigImg" value='custom' alt="lorem ipsum dolor sit" src="images/head.jpg" data-address=''
                     title="自定义背景"/>
                <a href="javascript:;" class="upload">选择头像
                    <input type="file" id="chooseImage" name="headIcon">
                </a>
            </div>
            <!--autoFocus-->
            <div>
                <input type="text" autocomplete="off"
                       placeholder="邮箱" name="mail" required/>
            </div>
            <div>
                <input type="text" autocomplete="off"
                       placeholder="昵称" name="nickName" required/>
            </div>
            <div>
                <input type="text" autocomplete="off"
                       placeholder="个性签名" name="description" required/>
            </div>
            <div >
                <input type="password"
                       autocomplete="off" placeholder="密码" name="password" required maxlength="32"/>
            </div>
            <div >
                <input type="password"
                       autocomplete="off" placeholder="确认密码" name="repwd" required maxlength="32"/>
            </div>
        </div>
        <!--登入按钮-->
        <div style="text-align: center">
            <button type="submit" class="enter-btn">注册</button>
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
