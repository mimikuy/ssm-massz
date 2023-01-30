<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-11-28
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/css/mui.css" rel="stylesheet"/>
    <link href="/css/postBar.css" rel="stylesheet"/>
    <link href="/fonts/iconfont.css" rel="stylesheet"/>
</head>

<body>
<div class="postBar-page">
    <header id="header" class="mui-bar mui-bar-nav">
        <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
        <a class="mui-icon mui-icon-more mui-pull-right"></a>
    </header>

    <div style="height: 60px;"></div>

    <div class="user-info">
        <img class="avatar" src="/img/${allPostsByBarName[0].bar.picName}"/>
        <div class="info-middle">
            <div class="info-top">
                <span class="nickname">${allPostsByBarName[0].bar.barName}</span>
            </div>
            <div class="info-bottom">LV5 <span>洛欧塞布</span>
                <p class="mui-progressbar mui-progressbar-in"><span
                        style="transform: translate3d(-90%, 0px, 0px)"></span></p>
            </div>
        </div>
        <div class="more">
            <span class="guanzhu">签到</span>
        </div>
    </div>

    <div class="quanbu">
        <span>全部</span>
        <span>吧主推荐</span>
    </div>
    <div class="zg">
        <div class="zhidin">
            <span>置顶</span>
            <span>关于iOS客户端</span>
        </div>
        <div class="gonggao">
            <span>公告</span>
            <span>免费领取贴吧超级VIP啦~</span>
        </div>
    </div>
    <div class="paixv">
        <span>智能排序</span>
    </div>
    <div>
        <c:forEach items="${allPostsByBarName}" var="post">
            <div class="into-first">
                <img class="avatar" src="/img/${post.users.avatar}"/>
                <div class="info-middle">
                    <div class="info-top">
                        <span class="nickname">${post.users.nick_name}</span>
                        <span class="iconfont icon-game"></span>
                    </div>
                    <div class="info-bottom">${post.bar.barName}吧 | ${post.createTime}</div>
                </div>
                <div class="more">
                    <span class="mui-icon mui-icon-closeempty"></span>
                </div>
            </div>
            <div class="info-text">
                <span>${post.content}</span>
                <c:if test="${post.postImgList.size() == 1}">
                    <div class="post-img">
                        <img src="/img/${post.postImgList[0].picName}"/>
                    </div>
                </c:if>
                <c:if test="${post.postImgList.size() == 2}">
                    <div class="post-img-2">
                        <img src="/img/${post.postImgList[0].picName}"/>
                        <img src="/img/${post.postImgList[1].picName}"/>
                    </div>
                </c:if>
                <c:if test="${post.postImgList.size() == 3}">
                    <div class="post-img-3">
                        <img src="/img/${post.postImgList[0].picName}"/>
                        <img src="/img/${post.postImgList[1].picName}"/>
                        <img src="/img/${post.postImgList[2].picName}"/>
                    </div>
                </c:if>
            </div>
            <div class="info-foot">
                <span class="iconfont icon-message_light"></span>109
                <span class="iconfont icon-emojilight"></span>688
            </div>
        </c:forEach>

    </div>
    <div class="fabu">
        <span class="mui-icon mui-icon-plus"></span>
    </div>
</div>

<script src="/js/mui.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    mui.init()

    $(".fabu").click(function (){
        $.ajax({
            type: 'post',
            data:{
                barName: '${allPostsByBarName[0].bar.barName}'
            },
            url: '/post/tobarname',
            success: function (res) {
                window.location.href = "/toPosts"
            }
        });
    })
</script>
</body>

</html>

