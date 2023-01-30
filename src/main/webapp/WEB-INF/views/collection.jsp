<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-12-08
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/css/mui.css" rel="stylesheet"/>
    <link href="/css/collection.css" rel="stylesheet"/>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">我的收藏</h1>
    <span class="mui-icon mui-pull-right empty">编辑</span>
</header>
<div class="mui-content">
    <c:forEach items="${allCollection}" var="ac">
        <div class="user-info">
            <img class="avatar" src="/img/${ac.users.avatar}"/>
            <div class="info-middle">
                <div class="info-top">
                    <span class="nickname">${ac.users.nick_name}</span>
                </div>
            </div>
            <div class="more">
                <button class="guanzhu" type="button">+ 关注</button>
            </div>
        </div>
        <div class="foot">
            <c:if test="${ac.postImgList[0].picName !=null}">
                <img class="picname" src="/img/${ac.postImgList[0].picName}"/>
            </c:if>

            <div class="title">${ac.postTitle}</div>
        </div>
    </c:forEach>

</div>

<script src="/js/mui.js"></script>
<script type="text/javascript">
    mui.init()
</script>
</body>

</html>
