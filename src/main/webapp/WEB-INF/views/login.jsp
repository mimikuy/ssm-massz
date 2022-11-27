<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-09-30
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="../../css/mui.css" rel="stylesheet" />
    <link href="../../css/common.css" rel="stylesheet" />
    <link href="../../css/login.css" rel="stylesheet" />
    <link href="../../fonts/iconfont.css" rel="stylesheet" />
</head>

<body>
<div class="container">
    <header id="header" class="mui-bar mui-bar-nav">
        <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
        <h1 class="mui-title">账号密码登录</h1>
    </header>
    <form  method="get">
        <div class="content">
            <div class="title">登录账号 精彩永相随</div>

            <div class="mui-input-row">
                <input type="text" id="username" name="user_name" class="mui-input-clear" maxlength="30" placeholder="请输入手机号/用户名/邮箱">
            </div>
            <div class="mui-input-row mui-password">
                <input type="password" id="password" name="password" class="mui-input-password" maxlength="20" placeholder="请输入登录密码">
            </div>
            <div class="text-link">
                <div>更换设备登录</div>
                <div>忘记密码</div>
            </div>
            <div class="login-box">
                <button type="button" id="btnLogin" class="mui-btn mui-btn-primary mui-btn-block login-btn opacity-04">登 录</button>
            </div>
        </div>
    </form>

    <div class="bottom-link">
        <div class="text-box">
            <span class="text">换个账号</span>
            <span class="gap"></span>
            <span class="text" id="toRegister">注册</span>
            <span class="gap"></span>
            <span class="text">帮助</span>
        </div>
    </div>
</div>

<script src="../../js/mui.js"></script>
<script src="../../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    mui.init()
    $(function(){
        $("#username,#password").on("keyup",function(){
            checkBtn()
        });

        $("#username").on("blur",function(){
            checkBtn()
        });

        // 判断登录按钮是否可点击
        function checkBtn(){
            if($("#username").val()!="" && $("#password").val()!=""){
                $("#btnLogin").removeClass('opacity-04')
            }else{
                $("#btnLogin").addClass('opacity-04')
            }
        }

        // 去注册页面
        $("#toRegister").click(function () {
            window.location.href="/register.jsp";
        });



        // var info = document.getElementById("info");
        // document.getElementById("alertBtn").addEventListener('tap', function() {
        // 	mui.alert('欢迎使用Hello MUI', 'Hello MUI', function() {
        // 		info.innerText = '你刚关闭了警告框';
        // 	});
        // });

        $("#btnLogin").click(function (){
            // console.log($("#username").val())
            $.ajax({
                type: 'get',
                url: '/users',
                data: {user_name:$("#username").val(),password:$("#password").val()},
                success: function (res){
                    if (res.code==200){
                        window.location.href='/tomy'
                    }else{
                        mui.alert(res.msg)
                    }

                }
            });
        })



    });

</script>
</body>

</html>
