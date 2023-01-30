<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-12-07
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <link href="/css/mui.css" rel="stylesheet" />
  <link href="/css/follow.css" rel="stylesheet" />
  <link href="/fonts/iconfont.css" rel="stylesheet" />
</head>

<body>

<header class="mui-bar mui-bar-nav">
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">我关注的人</h1>
</header>
<div class="mui-content">
  <div class="top">
    <span>全部关注${usersLists[0].followNum}人</span>
    <select>
      <option>全部关注</option>
      <option>互相关注</option>
    </select>
  </div>

  <c:forEach items="${usersLists}" var="u">
    <div class="user-info">
      <img class="avatar" src="/img/${u.avatar}" />
      <div class="info-middle">
        <div class="info-top">
          <span class="nickname">${u.nick_name}</span>
        </div>
        <div class="info-bottom">${u.signature}</div>
      </div>
      <div class="more">
        <c:if test="${u.user==null}">
          <button type="button">已关注</button>
        </c:if>
        <c:if test="${u.user!=null}">
          <button type="button">互相关注</button>
        </c:if>
      </div>
    </div>
  </c:forEach>

</div>



<script src="/js/mui.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
  mui.init()


</script>
</body>

</html>
