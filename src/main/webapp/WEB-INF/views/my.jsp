<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-10-09
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>我的</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="/css/mui.css" rel="stylesheet" />
    <link href="/css/my.css" rel="stylesheet" />
    <link href="/fonts/iconfont.css" rel="stylesheet" />


</head>

<body>

<header id="header" class="mui-bar mui-bar-nav">
    <h1 class="mui-title">导航栏</h1>
    <a class="mui-icon mui-icon-gear mui-pull-right setup" ></a>
</header>

<div style="height: 50px;"></div>

<div class="user-info">

    <img class="avatar" src="/img/${userSession.avatar}" />
    <div class="info-middle">
        <div class="info-top">
            <span class="iconfont icon-crown"></span>
            <span class="nickname">${userSession.nick_name}</span>
            <span class="iconfont icon-male gender"></span>
        </div>
        <div class="info-bottom">查看个人主页和编辑资料</div>
    </div>
    <div class="more">
        <span class="iconfont icon-right"></span>
    </div>

</div>


<div class="menu">
    <div class="menu-item follow">
        <div class="item-num follow-num"></div>
        <div class="item-name">关注</div>
    </div>
    <div class="menu-item fans" >
        <div class="item-num fans-num"></div>
        <div class="item-name">粉丝</div>
    </div>
    <div class="menu-item followBar" >
        <div class="item-num bar-num"></div>
        <div class="item-name">关注的吧</div>
    </div>
    <div class="menu-item">
        <div class="item-num post-num"></div>
        <div id="postList" class="item-name">帖子</div>
    </div>
</div>

<div class="gap"></div>


<ul class="mui-table-view">
    <li class="mui-table-view-cell collection">
        <a class="mui-navigate-right">
            <span class="iconfont icon-favor"></span>我的收藏
        </a>
    </li>
    <li class="mui-table-view-cell history" >
        <a class="mui-navigate-right">
            <span class="iconfont icon-time"></span>浏览历史
        </a>
    </li>
    <li class="mui-table-view-cell">
        <a class="mui-navigate-right">
            <span class="iconfont icon-service"></span>服务中心
        </a>
    </li>
</ul>

<!-- 底部 -->

<div class="botton-foot">
    <div class="button-one">
        <span class="iconfont icon-home"></span>
        <div class="one">首页</div>
    </div>
    <div class="button-two">
        <span class="iconfont icon-post"></span>
        <div class="two">进吧</div>
    </div>
    <div class="button-three">
        <span class="mui-icon mui-icon-plus"></span>

    </div>
    <div class="button-four">
        <span class="iconfont icon-comment"></span>
        <div class="four">消息</div>
    </div>
    <div class="button-five">
        <span class="iconfont icon-people"></span>
        <div class="five" style="color: #00eaff">我的</div>
    </div>
</div>

<script src="/js/mui.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    mui.init(
            getPostNum()
    )

    $(".user-info").click(function(){
        $.ajax({
            url:"/findUserInformation",
            type:"get",
            data:{},
            success:function (res) {
                if(res.code == 200){
                    window.location.href='/toMyPage'
                }
            }
        })

    });

    $(".setup").click(function (){
        window.location.href='/tosetup'
    });

    $(".button-one").click(function () {
        window.location.href="/toHome"
    });

    $(".button-two").click(function () {
        window.location.href="/tojinba"
    });

    $(".button-three").click(function (){
        $.ajax({
            type: 'post',
            url:'/post/toPublish',
            success: function (res){
                window.location.href="/toPosts"
            }
        });
    });

    $(".button-five").click(function () {
        window.location.href="/tomy"
    });

    $("#postList").click(function (){
        window.location.href= 'post/toPostList'
    })


    // 初始化页面
    function getPostNum() {
        $.ajax({
            url:"/findUserInfo",
            type:"get",
            data:{},
            success:function (res) {
                if(res.code == 200){
                    let userInfo = res.data;
                    $(".post-num").text(userInfo.postNum)
                    $(".bar-num").text(userInfo.barNum)
                    $(".follow-num").text(userInfo.followNum)
                    $(".fans-num").text(userInfo.fansNum)
                }
            }
        })
    }


    $(".follow").click(function (){
        $.ajax({
            type:'get',
            data: {user_id : ${userSession.user_id}},
            url:'/myPage/findFollow',
            success:function (res) {
                window.location.href='/myPage/toFollow'
            }
        })

    });
    $(".fans").click(function (){
        $.ajax({
            type:'get',
            data: {user_id : ${userSession.user_id}},
            url:'/myPage/findFans',
            success:function (res) {
                window.location.href='/myPage/toFans';
            }
        })

    });
    $(".followBar").click(function (){
        $.ajax({
            type:'get',
            data: {user_id : ${userSession.user_id}},
            url:'/myPage/findFollowBar',
            success:function (res) {
                window.location.href='/myPage/toFollowBar';
            }
        })
    });

    $(".history").click(function (){
        $.ajax({
           type:'get',
           data:{},
           url:'/myPage/findHistory',
           success:function (res) {
                window.location.href='/myPage/toHistory';
           }
        });
    });

    $(".collection").click(function (res) {
        $.ajax({
            type:'get',
            data:{},
            url:'/myPage/findCollection',
            success:function (res) {
                window.location.href='/myPage/toCollection';
            }
        });
    })
</script>
</body>

</html>
