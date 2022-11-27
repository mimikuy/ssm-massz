<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-10-17
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="../../css/mui.css" rel="stylesheet" />
    <link href="../../css/setup.css" rel="stylesheet" />
    <link href="../../css/common.css" rel="stylesheet" />
    <link href="../../fonts/iconfont.css" rel="stylesheet" />
</head>

<body>
<div class="container">
    <div class="top">
        <header id="header" class="mui-bar mui-bar-nav">
            <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
            <h1 class="mui-title">设置</h1>
        </header>
    </div>

    <div class="gap"></div>

    <div class="name-left">
        <div class="info-left">
            <span>账号安全</span>
        </div>
        <div class="info-right">
            <span class="mui-icon mui-icon-arrowright"></span>
        </div>
    </div>
    <div class="gap2"></div>

    <div class="name-left" id="ziliao">
        <div class="info-left">
            <span>个人资料</span>
            <div class="tx">
                <img class="avatar" src="../../images/avatar.jpg" />
            </div>
        </div>
        <div class="info-right">
            <span class="mui-icon mui-icon-arrowright"></span>
        </div>
    </div>
    <div class="name-left">
        <div class="info-left">
            <span>账号管理</span>
        </div>
        <div class="info-right">
            <span class="mui-icon mui-icon-arrowright"></span>
        </div>
    </div>

    <div class="gap2"></div>

    <div class="name-left">
        <div class="info-left">
            <span>浏览设置</span>
            <div class="tx">
                <span class="zi">图片显示、字号等</span>
            </div>
        </div>
        <div class="info-right">
            <span class="mui-icon mui-icon-arrowright"></span>
        </div>
    </div>
    <div class="name-left">
        <div class="info-left">
            <span>消息提醒</span>
        </div>
        <div class="info-right">
            <span class="mui-icon mui-icon-arrowright"></span>
        </div>
    </div>
    <div class="name-left">
        <div class="info-left">
            <span>隐私设置</span>
        </div>
        <div class="info-right">
            <span class="mui-icon mui-icon-arrowright"></span>
        </div>
    </div>
    <div class="name-left">
        <div class="info-left">
            <span>辅助功能</span>
        </div>
        <div class="info-right">
            <span class="mui-icon mui-icon-arrowright"></span>
        </div>
    </div>
    <div class="gap2"></div>

    <div class="name-left">
        <div class="info-left">
            <span>版本信息</span>
            <div class="tx">
                <span class="zi">9.1.0.0</span>
            </div>
        </div>
        <div class="info-right">
            <span class="mui-icon mui-icon-arrowright"></span>
        </div>
    </div>
    <div class="name-left">
        <div class="info-left">
            <span>意见反馈</span>
        </div>
        <div class="info-right">
            <span class="mui-icon mui-icon-arrowright"></span>
        </div>
    </div>
    <div class="foot">
        <a class="out">退出</a>
    </div>

</div>

<script src="../../js/mui.js"></script>
<script src="../../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    mui.init()

    $("#ziliao").click(function (){
        window.location.href='/tomyinformation'
    })
</script>
</body>

</html>
