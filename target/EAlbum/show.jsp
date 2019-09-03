<%@ page import="java.util.List" %>
<%@ page import="com.lt.pojo.Photo" %>
<%@ page import="com.lt.dao.PhotoDao" %>
<%@ page import="com.lt.pojo.Picdir" %>
<%@ page import="com.lt.dao.PicdirDao" %><%--
  Created by IntelliJ IDEA.
  User: 13779
  Date: 2019/7/17
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String dirId=request.getParameter("dirId");
    request.getSession().setAttribute("dirId",dirId);
    List<Photo> list= PhotoDao.queryPhotoByDirId(dirId);
    Picdir picdir= PicdirDao.queryById(dirId);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-3.4.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/prettify.js"></script>
    <script src="<%=request.getContextPath()%>/js/zoomsl.min.js"></script>
</head>
<script>
    $(function () {
        var aObjs=$(".nav-bar-left a");
        //循环遍历所有的a标签
        if (aObjs.length>1){
            $('#zoom_01').imagezoomsl({
                zoomrange: [3, 3]
            });
            for(var i=1;i<aObjs.length;i++){
                //为每个a标签注册点击事件
                aObjs[i].onclick=function () {
                    //为id为image的标签的src赋值
                    $(".nav-bar-center img").attr("src",$(this).attr("href"));
                    $(".nav-bar-center img").attr("data-large",$(this).attr("href"));
                    var arr=$(this).children("img:first-child").attr("alt").split(";");

                    $("#zoom_02 span:eq("+0+")").text("图片名称:"+arr[0]);
                    $("#zoom_02 span:eq("+1+")").text("添加时间:"+arr[1]);
                    $("#zoom_02 span:eq("+2+")").text("图片大小:"+arr[2]+" Byte");
                    $("#zoom_02 span:eq("+3+")").text("图片地址:"+arr[3]);


                    //阻止超链接默认的跳转
                    return false;
                };
            }
        }

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


    function submit_sure() {
        var flag=confirm("确认删除该相册?");
        if (flag==true){
            return true;
        } else {
            return false;
        }
    }

    function submit_sure2() {
        var flag=confirm("确认修改相册信息?");
        if (flag==true){
            return true;
        } else {
            return false;
        }
    }


</script>

<style>
    *{
        margin: 0;
        padding: 0;
    }

    body{
        background: url("images/FreshSalt_ZH-CN12818759319_1920x1080.jpg");
    }

    .head-bar{
        width: 100%;
        height: 77px;
        background-color: #fafafa;
        padding: 26px 20px;
        box-sizing:border-box;
        border-bottom: 1px solid #efefef;
    }

    .head-content{
        width: 1010px;
        height: 77px;
        /*background-color: #121231;*/
        margin: 0 auto;
    }
    #tb{
        width: 25px;
        float: left;
    }

    .head-left{
        width: 378px;
        float: left;
    }

    .head-left-left{
        background-repeat: no-repeat;
        background-position: -257px -200px;
        height: 24px;
        width: 24px;
        display: block;
        background-image: url("images/tb.png");
        vertical-align: baseline;
    }

    .SvO5t{
        background-color: #262626;
        height: 28px;
        margin: 0 16px;
        width: 1px;
        float: left;
        border: 0 solid;
    }

    #album{
        font-size: 25px;
        font-family: "Cambria Math";
        float: left;
    }

    .head-middle{
        width: 300px;
        float: left;
    }

    #search{
        height:30px;
        width: 200px;
    }

    #search-button{
        width: 50px;
        height: 34px;
        color: #fff;
        background: #0bc5de;
        line-height: 25px;
        text-align: center;
        border: 0px;
    }

    #search-button:hover {
        cursor: pointer;
        background: #1db5c9;
    }

    .head-right span{
        background-position: -260px -324px;
        background-repeat: no-repeat;
        height: 24px;
        width: 24px;
        display: block;
        background-image: url("images/tb.png");
        vertical-align: baseline;
        float: right;
    }

    #head-right2 span{
        background-position: -156px -274px;
        background-repeat: no-repeat;
        height: 24px;
        width: 24px;
        display: block;
        background-image: url("images/tb.png");
        vertical-align: baseline;
        float: right;
        margin-right: 15px;
    }
    /*顶部通栏结束*/
    .nav-bar{
        margin: 0 auto;
        width: 1400px;
        height: 970px;
        background-color: #fafafa;
        padding: 60px 20px 0 20px;
        box-sizing: border-box;
        /* margin: 60px 20px 0 20px; */
        position: relative;
        overflow: hidden;
    }

    .nav-bar-left{
        width: 190px;
        height: 800px;
        /*background-color: pink;*/
        float: left;
        overflow-y: scroll;
    }



    .photo{
        float: left;
        margin-bottom: 15px;
        height: 90px;
        box-shadow: 5px 5px 3px #888888;
        box-sizing: border-box;
        border-radius: 5px;
        overflow: hidden;
    }
    .photo a{
        display: block;
        text-decoration:none;
        outline: none;
        height: 0px;
    }

    .photo:hover{
        box-shadow: 8px 8px 5px #888888;
    }

    .photo img{
        width: 160px;
        height: 90px;
        display: block;
    }

    .nav-bar-center{
        width: 800px;
        height: 800px;
        float: left;
    }

    .nav-bar-center img{
        display: block;
        margin-top: 65px;
        border-radius: 10px;
        margin-left: 8px;
        width: 800px;
        height: 450px;
        box-shadow: 5px 5px 3px #888888;

    }
    .nav-bar-center div{
        margin-left: 8px;
        /*margin: 0 auto;*/
    }

    .nav-bar-center h3{
        display: block;
        color: #262626;
        font-weight: 500;
        font-size: 30px;
        border-bottom:1px solid #efefef;
    }

    .nav-bar-center span{
        display: block;
        color: #262626;
        font-weight: 300;
        font-size: 16px;
        margin-bottom: 2px;

    }

    .nav-bar-right{
        width: 350px;
        height: 800px;
        float: right;
        border-left: 1px solid #efefef;
    }

    /*提交表单*/

    /*主面板开始*/
    .main {
        margin: 20px 0px 0px 10px;
        width: 330px;
        height: 528px;
        background: #fafafa;
        /*以下css用于让登录表单垂直居中在界面,可删除*/
    }
    /*主面板结束*/


    /*注册EAlbum开始*/
    .title {
        width: 100%;
        height: 40px;
        line-height: 40px;
        margin-bottom: 10px;
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
        width: 100%;
        height: 110px;
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
        text-decoration: none;
        color: #fff;
        display: block;
        float: left;
        margin-left: 6px;
        margin-top: 60px;
        background-color: #0bc5de;
    }

    #cropedBigImg {
        width: 160px;
        height: 90px;
        display: block;
        margin-bottom: 10px;
        float: left;
        border-radius: 10px;
    }
    /*头像部分结束*/


    /*表单部分*/
    .input-content {
        width: 100%;
        height: 420px;

    }

    .input-content input {
        width: 330px;
        height: 40px;
        border: 1px solid #dad9d6;
        background: #ffffff;
        margin-bottom: 15px;
    }

    .enter-btn {
        width: 330px;
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

    .area{
        outline:none;
        resize:none;
        width: 330px;
        height: 200px;
        border: 1px solid #dad9d6;
        font: 400 13.3333px Arial;
        color: initial;
    }

    .input-content span{
        display: block;
        color: #262626;
        font-weight: 300;
        font-size: 14px;
        margin-bottom: 2px;
    }

</style>
<body>
<!--顶部通栏-->
<div class="head-bar">
    <div class="head-content">
        <!--左边-->
        <div class="head-left">
            <div id="tb">
                <span class="head-left-left"></span>
            </div>
            <div class="SvO5t"></div>
            <div id="album">
                <a href="ealbum.jsp" style="text-decoration: none;color:#333; "><span>EAlbum</span></a>
            </div>
        </div>
        <div class="head-middle">
            <form action="allQuery.jsp" method="get">
                <input id="search" type="text" name="str" placeholder="我的相册">
                <input id="search-button" type="submit" value="搜索" >
            </form>
        </div>
        <div class="head-right">
            <div>
                <a href="<%=request.getContextPath()%>/Logout" ><span></span></a>
            </div>
        </div>
        <div id="head-right2">
            <div>
                <a href="update.jsp" ><span></span></a>
            </div>
        </div>
    </div>
</div>
<div class="nav-bar">
    <div class="nav-bar-left">
        <div class="photo" style="border-radius: 0px;box-shadow: none;">
            <a href="addPhoto.jsp" type="美女A">
                <img src="images/upload-btn.jpg"   style="width: 90px; height: 90px; margin-left: 34px;"/>
            </a>
        </div>
        <%
            if(list.size()!=0&&list!=null){

            int i=0;
            for (Photo photo:list){
        %>
        <div class="photo">
            <a href="<%=photo.getPhotoAddr()%>" >
                <img src="<%=photo.getPhotoAddr()%>"  alt="<%=photo.getPhotoName()+";"+photo.getTime()+";"+photo.getPhotoSize()+";"+photo.getPhotoAddr()%>"/>
            </a>
        </div>
        <%
                i++;
                }
            }
        %>

    </div>
    <div class="nav-bar-center">
        <div>
            <h3><%=picdir.getPicName()%></h3>
        </div>
        <%
            if (list.size()!=0&&list!=null){
        %>
        <img id="zoom_01" src="<%=list.get(0).getPhotoAddr()%>" data-large="<%=list.get(0).getPhotoAddr()%>">
        <div id="zoom_02" style="margin-top: 15px;word-break: break-word;">
            <span>图片名称:<%=list.get(0).getPhotoName()%></span>
            <span>添加时间:<%=list.get(0).getTime()%></span>
            <span>图片大小:<%=list.get(0).getPhotoSize()%>  Byte</span>
            <span style="white-space:normal;height: 60px;">图片地址:<%=list.get(0).getPhotoAddr()%></span>
        </div>
        <%
            }else{
        %>
        <img id="zoom_01" src="images/zanwu.jpg">
        <div id="zoom_02" style="margin-top: 15px;word-break: break-word;">
            <span>图片名称:无</span>
            <span>添加时间:无</span>
            <span>图片大小:无</span>
            <span style="white-space:normal;height: 60px;">图片地址:无</span>
        </div>
        <%
            }
        %>
    </div>
    <div class="nav-bar-right">
        <div class="main">
            <div class="title">
                <span>相册信息</span>
            </div>
            <form class="login-form" action="UpdatePic" enctype="multipart/form-data" onsubmit="return submit_sure2()" method="post" novalidate>
                <!--输入框-->
                <div class="input-content" >
                    <!-- 保存用户自定义的背景图片 -->
                    <div id="head">
                        <img id="cropedBigImg" value='custom' alt="lorem ipsum dolor sit" src="<%=picdir.getPicCover()%>" data-address=''
                             title="自定义背景"/>
                        <a href="javascript:;" class="upload">选择封面
                            <input type="file" id="chooseImage" name="file">
                        </a>
                    </div>
                    <!--autoFocus-->
                    <div>
                        <input type="text" autocomplete="off"
                               name="picName" value="<%=picdir.getPicName()%>" required/>
                    </div>
                    <div>
                        <textarea class="area" name="picDesc"><%=picdir.getPicDesc()%></textarea>
                    </div>
                    <div>
                        <span>相册创建时间:<%=picdir.getTime()%></span>
                    </div>
                </div>
                <!--登入按钮-->
                <div style="text-align: center">
                    <button type="submit" class="enter-btn">修改相册信息</button>
                </div>
            </form>
        </div>
        <div>
            <form class="login-form" action="DeletePic" onsubmit="return submit_sure() " method="post" novalidate>
                <!--登入按钮-->
                <div style="text-align: center">
                    <button type="submit" class="enter-btn" >删除相册</button>
                </div>
                <input type="hidden" value="<%=dirId%>" name="dirId">
            </form>
        </div>
    </div>
</div>
</body>
</html>