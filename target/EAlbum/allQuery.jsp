<%@ page import="com.lt.pojo.User" %>
<%@ page import="com.lt.dao.PicdirDao" %>
<%@ page import="com.lt.pojo.Picdir" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 13779
  Date: 2019/8/31
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User)request.getSession().getAttribute("user");%>
<%List<Picdir> list= PicdirDao.queryByNameAndDesc(request.getParameter("str"));%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }

    body{
        /*background: #999999;*/
        background: url("images/FreshSalt_ZH-CN12818759319_1920x1080.jpg") fixed no-repeat;
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
        width: 1040px;
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

    #head-right span{
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
        width: 1100px;
        background-color: #fafafa;
        padding: 60px 20px 0 20px;
        box-sizing:border-box;
        /*margin: 60px 20px 0 20px;*/
        position: relative;
        overflow: hidden;

    }

    .bottom-bar{
        margin: 0 auto;
        width: 1100px;
        height: 100%;
        background-color: #fafafa;
        box-sizing: border-box;
        position: relative;
        overflow: hidden;
    }

    .nav-info{
        width: 100%;
        height: 150px;
        background-color: #fafafa;

    }

    .headIcon{
        background-color: #fafafa;
        border-radius: 50%;
        margin-left: 70px;
        margin-right: 70px;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        overflow: hidden;
        position: relative;
        width: 150px;
        height: 150px;
        float: left;

    }

    .headIcon img{
        width: 150px;
        height: 150px;

    }

    .headIcon:hover{
        box-shadow: 2px 2px 2px #888888;
    }

    /*头像部分结束*/

    .info{
        margin-top: 10px;
        height: 40px;
        width: 500px;
    }

    .info h1{
        display: block;
        float: left;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        color: #262626;
        font-weight: 300;
        font-size: 28px;
        line-height: 32px;
        margin: -5px 0 -6px;
    }

    .nav-info{
        float: left;
        margin-bottom: 20px;
    }

    .setting{
        margin-left: 20px;
        background-repeat: no-repeat;
        background-position: -182px -326px;
        height: 24px;
        width: 24px;
        display: block;
        background-image: url("images/tb.png");
        vertical-align: baseline;
        float: left;
        margin-left: 20px;
    }

    .g47{
        float: left;
        color: #262626;
        margin-top: 10px;
        font-weight: 600;
        vertical-align: baseline;

    }

    .g48{
        color: #262626;
        font-weight: 300;
        font-size: 20px;
        vertical-align: baseline;
        position: absolute;
        bottom: 10px;
        border: 1px solid gray;
    }

    /*相册部分开始 */
    .nav-photo{
        border-top:1px solid #efefef;
        width: 100%;
        /*background-color: pink;*/
        position: relative;
        float: left;
    }

    #myphoto{
        width: 80px;
        color: #262626;
        font-weight: 300;
        font-size: 20px;
        vertical-align: baseline;
        border-top: 1px solid #000000 ;
    }

    #photo{
        border-top:1px solid #efefef;
        margin-top: 10px;
        padding-top: 10px;
        float: left;
        position: relative;
        background-color: #fafafa;
        width: 100%;
    }

    /*#photo a{*/
    /*    display: block;*/
    /*    float: left;*/
    /*}*/

    #photo img{
        width: 320px;
        height:180px;
        display: block;
        float: left;
        box-shadow: 5px 5px 3px #888888;
        border-radius: 10px;
        margin-bottom: 10px;
    }

    #photo img:hover{
        box-shadow: 10px 10px 5px #888888;
    }

    #photo #p-jia{
        width: 320px;
        height: 180px;
        margin-left: 22px;
        float: left;
        margin-bottom: 20px;
        position: relative;

    }

    #photo #jh{
        width: 80px;
        height: 80px;
        display: block;
        position: absolute;
        left: 120px;
        top: 50px;
        margin: 0;
        box-shadow:none;
    }

    .p-img {
        width: 320px;
        height: 220px;
        position: relative;
        margin-left: 22px;
        float: left;
        text-align: center;
    }

    .p-img a{
        text-decoration: none;
    }

    .p-img span{
        color: #262626;
        font-weight: 500;
        font-size: 18px;
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
        <div id="head-right">
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
    <div class="nav-photo">
        <div id="myphoto">
            <span>搜索结果</span>
        </div>
        <div id="photo">
            <%
                //如果相册不为空
                if (list.size()!=0&&list!=null) {
                    for (Picdir picdir:list){
            %>
            <div class="p-img">
                <a href="show.jsp?dirId=<%=picdir.getId()%>">
                    <img src="<%=picdir.getPicCover()%>">
                    <span><%=picdir.getPicName()%></span>
                </a>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
<div class="bottom-bar">
</div>
</body>
</html>