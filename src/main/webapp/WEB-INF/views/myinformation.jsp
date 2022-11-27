<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-10-12
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/css/mui.css" rel="stylesheet"/>
    <link href="/css/myinformation.css" rel="stylesheet"/>
    <link href="/fonts/iconfont.css" rel="stylesheet"/>
</head>

<body>
<div class="container">
    <div class="top">
        <header id="header" class="mui-bar mui-bar-nav">
            <a class="mui-icon mui-icon-closeempty mui-pull-left left"></a>
            <h1 class="mui-title">我的资料</h1>
            <a class="baocun mui-pull-right">保存</a>
        </header>
    </div>
    <div class="tx">

        <img class="touxiang" id="touxiang" src="/img/${userSession.avatar}"/>
        <a class="mui-icon mui-icon-camera"></a>
        <form id="uploadForm" enctype="multipart/form-data">
            <input id="file" type="file" name="file" onchange="changeImg(this)" style="display: none;"/>
<%--            <input id="upImg" type="submit" style="display: none">--%>
        </form>

    </div>


    <div class="input-username">
        <label class="name" style="display: inline-block;">用户名</label>
        <input class="username" type="text" id="username" placeholder="${userSession.user_name}" readonly="readonly"
               style="display: inline-block;">
    </div>
    <div class="input-nickname">
        <label class="name">昵称</label>
        <input class="nickname" type="text" id="nickname" value="${userSession.nick_name}">
        <a class="mui-icon mui-icon-arrowright"></a>
    </div>
    <div class="input-gender">
        <label class="name">性别</label>
        <select class="gender" id="gender">
            <c:if test="${userSession.gender == '男'}">
                <option value="女">女</option>
                <option value="男" selected>男</option>
            </c:if>
            <c:if test="${userSession.gender == '女' }">
                <option value="女" selected>女</option>
                <option value="男" >男</option>
            </c:if>
            <c:if test="${userSession.gender == null }">
                <option value="女" >女</option>
                <option value="男" >男</option>
            </c:if>

        </select>
    </div>
    <div class="input-signature">
        <label class="name" style="position: relative;top: -42px;">个性签名</label>
        <textarea class="signature" id="text">${userSession.signature}</textarea>
        <span id='jie' ><span id='fs'>0</span>/50</span>
    </div>


</div>

<script src="/js/mui.js"></script>

<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    mui.init()



    $(".touxiang").click(function () {
        $("#file").click()


    })

    $(".left").click(function (){
        window.location.href='/tomy'
    })


    //选择图片后立即显示代码
    function changeImg(file) {
        var s = $('#file')[0].files[0];
        var formData = new FormData();
        formData.append("avatar", s);
        formData.append("type", "1");

        $.ajax({
            url: "http://localhost:8080/uploadFile",
            type: 'POST',
            cache: false,
            data: formData,
            processData: false,
            contentType: false,
            success: function (result) {
                var reader = new FileReader();    // 实例化一个FileReader对象，用于读取文件
                var img = document.getElementById('touxiang');     // 获取要显示图片的标签
                //读取File对象的数据
                reader.onload = function (evt) {
                    img.src = evt.target.result;
                }
                reader.readAsDataURL(file.files[0]);
            }
        });
    }
    
    $(".baocun").click(function () {

        $.ajax({
            type: 'PUT',
            url: 'http://localhost:8080/users',
            data: {
                user_name: "${userSession.user_name}", nick_name: $("#nickname").val(),
                gender: $("#gender").val(), signature: $("#text").val()
            },
            success: function (res) {
                if (res.code == 200) {
                    mui.alert("保存成功")
                }
            }
        })
    })

    var span = document.getElementById('jie');
    text.oninput=function(){
        span.style.display = 'inline-block';
        var fs=document.getElementById("fs");
        var text=document.getElementById("text");
        fs.innerHTML=text.value.length;
    }
    text.onblur = function() {
        span.style.display = 'none';

    }


</script>
</body>

</html>