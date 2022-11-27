<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-10-25
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>发布</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/css/mui.css" rel="stylesheet"/>
    <link href="/css/posts.css" rel="stylesheet"/>
    <style>
        .pro_img {
            margin-left: 10px;
            margin-top: 10px;
            width: 30%;
            height: 100px;
            overflow: hidden;
            float: left;
            position: relative;
        }

        .pro_img .pic {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            height: 100px;
            width: 100%;
        }

        .pro_img {
            position: relative
        }

        .pro_img input {
            position: absolute;
            width: 100%;
            height: 100%;
            margin: 0;
            opacity: 0;
            z-index: 100;
        }

        .pro_img .img-close {
            position: absolute;
            right: 0;
            top: 0;
            width: 20px;
            height: 20px;
            z-index: 999;
        }
    </style>
</head>

<body>

<div class="mui-container">

        <header id="header" class="mui-bar mui-bar-nav">
            <a style="font-size: 28px;color: #000000;"
               class="mui-action-back mui-icon mui-icon mui-icon-closeempty mui-pull-left"></a>
            <h1 class="mui-title">发布帖子</h1>
            <a style="font-size: 16px;margin-top: 10px;" class="mui-pull-right" onclick="publish()">发布</a>
        </header>

        <div class="a" style="height: 45px;"></div>
        <form class="my-form" method="post" enctype="multipart/form-data">
        <ul style="position: initial;" class="mui-table-view">
            <li class="mui-table-view-cell">
                <a class="left mui-icon mui-icon-spinner mui-spin"></a>
                <select id="barId" name="barId">
                    <option value="">选择吧</option>
                    <c:forEach items="${barList}" var="bar">
                        <option value="${bar.barId}">${bar.barName}</option>
                    </c:forEach>
                </select>
                <a class="mui-icon mui-icon-arrowright"></a>
            </li>
            <li class="mui-table-view-cell">
                <input id="postTitle" name="postTitle" type="text" placeholder="请输入完整帖子标题（5-31个字）"/>
            </li>
            <li class="mui-table-view-cell">
                <textarea id="content" name="content" type="text" placeholder="来吧，尽情发挥..."></textarea>
            </li>
        </ul>

        <p id='upload'>
            <a class='pro_img' id='a1'>
                <input type='file' id='file1' accept='image/*' multiple='multiple' name='filename' onchange='t1(1)'/>
                <img class='pic' src="images/upload.png" id='img1'>
                <img id='close1' onclick="closePic(event,1)" class='img-close' style='display:none;'
                     src='images/close.png'>
            </a>
            <img id='hidden1' style='display:none;'>
        <div style="clear: both;"></div>
        </p>
    </form>

</div>


<script src="/js/mui.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    mui.init()
    var picNum = 9; // 最多选择图片数
    var name_pic = 1;

    function t1(o) {
        //alert(name_pic);
        if (o == 1 || name_pic != 1) {
            var file = "file" + o;
            var img = "img" + o;
            var hid = "hidden" + o;
            var aa = "a" + o;
            var close = "close" + o;
        } else {
            var file = "file" + name_pic;
            var img = "img" + name_pic;
            var hid = "hidden" + name_pic;
            var aa = "a" + name_pic;
            var close = "close" + name_pic;
        }
        var docObj = document.getElementById(file);
        var imgObjPreview = document.getElementById(img);
        var hidden = document.getElementById(hid);
        // alert(hidden);
        if (docObj.files && docObj.files[0]) {
            hidden.src = window.URL.createObjectURL(docObj.files[0]); //获取file文件的路径
            $("#" + close).show();
            hidden.onload = function () {
                var width = hidden.width;
                var height = hidden.height;
                var a = document.getElementById(aa);
                if (width > height) {
                    imgObjPreview.style.cssText = 'width:100%';   //重写css样式
                } else {
                    imgObjPreview.style.cssText = 'height:100%;width:auto;';
                }
                imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
                imgObjPreview.style.display = 'block';
            }
        } else {
            return false;
        }
        if (o == name_pic) {
            addImg();
        }
    }

    // 添加图片样式
    function addImg() {
        var count = $('.pro_img').length;
        if (count < picNum) {
            name_pic++;
            var pic_p = "<a class='pro_img' id='a" + name_pic + "' ><input type='file' id='file" + name_pic + "'  accept='image/*' multiple='multiple' name='filename' onchange='t1(" + name_pic + ")'/><img class='pic' src='/images/upload.png' id='img" + name_pic + "'><img id='close" + name_pic + "' style='display:none;' class='img-close' src='/images/close.png' onclick='closePic(event," + name_pic + ")'></a><img  id='hidden" + name_pic + "' style='display:none;'>";
            $('#upload').append(pic_p);
        }
    }


    function closePic(e, index) {
        e.stopPropagation();
        var count = $('.img-close:visible').length;
        $("#a" + index).remove();
        if (count == 9) {
            addImg();
        }
    }

    // 发布
    function publish() {
        var barId = $("#barId").val();
        if (barId == "") {
            mui.alert("请选择贴吧");
            return
        }

        if ($("#postTitle").val() == "") {
            mui.alert("请填写标题");
            return
        }

        var content = $("#content").val();
        if (content == "" || content == undefined) {
            mui.alert("请填写内容");
            return
        }

        var formData = new FormData($('form')[0]);
        $.ajax({
            type: "post",
            url: "post/publish",
            data: formData,
            contentType: false,
            processData: false,
            success: function (res) {
                if (res.code == 200) {
                    mui.alert('发布成功！', '提示', function () {
                        window.location.href = "/tomy";
                    });

                } else {
                    mui.alert(res.message);
                }
            }
        });
    }


</script>
</body>
</html>
