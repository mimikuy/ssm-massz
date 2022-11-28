<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-11-28
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="css/mui.css" rel="stylesheet" />
    <link href="css/result.css" rel="stylesheet"/>
    <link href="fonts/iconfont.css" rel="stylesheet" />
</head>

<body>
<div class="result-page">
    <div class="input_left">
        <div class="mui-input-row mui-search">
            <input type="search" class="mui-input-clear" placeholder=""/>
        </div>
        <input class="quxiao" type="button" value="取消"/>
    </div>
    <div class="leixing">
        <span>综合</span>
        <span>贴</span>
        <span style="border-bottom: 3px solid mediumpurple;">吧</span>
        <span>人</span>
        <span>直播</span>
    </div>
    <div class="xiangguan">
        <span>相关吧</span>
    </div>
    <div class="ba-info">
        <img class="avatar" src="images/avatar.jpg" />
        <div class="info-middle">
            <div class="info-top">
                <span class="nickname">实况足球手游吧</span>
            </div>
            <div class="info-bottom">关注27.4W 帖子1419W</div>
        </div>
        <div class="more">
            <span class="guanzhu">关注</span>
        </div>
    </div>

</div>
<script src="js/mui.js"></script>
<script type="text/javascript">
    mui.init()
</script>
</body>

</html>
