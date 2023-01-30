<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-12-07
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="/css/mui.css" rel="stylesheet" />
    <link href="/css/history.css" rel="stylesheet" />
</head>

<body>

<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">浏览历史</h1>
    <span class="mui-icon mui-pull-right empty">清空</span>
</header>
<div class="mui-content">
    <c:forEach items="${historyList}" var="h">
        <div class="d-top">
            <span>${h.content}</span>
        </div>
        <div class="d-foot">
            <span>${h.barName}</span>
            <span>${h.historyTime}</span>
        </div>
    </c:forEach>

</div>

<script src="/js/mui.js"></script>
<script type="text/javascript">
    mui.init()
</script>
</body>
</html>
