<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-11-28
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="/css/mui.css" rel="stylesheet" />
    <link href="/css/result.css" rel="stylesheet"/>
    <link href="/fonts/iconfont.css" rel="stylesheet" />
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
    <c:forEach items="${barList}" var="bar">
        <div class="ba-info" >
            <img class="avatar" src="/img/${bar.picName}" />
            <div class="info-middle" onclick="toPostBar('${bar.barName}')">
                <div class="info-top">
                    <span class="nickname">${bar.barName}</span>
                </div>
                <div class="info-bottom">关注22.4W 帖子400.9W</div>
            </div>
            <div class="more">
                <c:if test="${selfolbar == true}">
                    <span class="guanzhu" >已关注</span>
                </c:if>
                <c:if test="${selfolbar == null}">
                    <span class="guanzhu" onclick="followBar(${bar.barId})">关注</span>
                </c:if>
            </div>
        </div>
    </c:forEach>


</div>
<script src="/js/mui.js"></script>
<script SRC="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    mui.init()

    $(".mui-input-clear").keydown(function (){
        if (event.keyCode == 13){
            $.ajax({
                type: 'post',
                data: {barName : $(".mui-input-clear").val()},
                url: '/search/searchBar',
                success:function (res){
                    window.location.href='/search/toResult'
                }

            });
        }
    });

    $(".quxiao").click(function () {
        window.history.go(-1)
    });


    function toPostBar(barName){
        console.log(barName)
        $.ajax({
            type: 'post',
            data: {barName:barName},
            url: '/search/getAllPosts',
            success:function (res) {
                $('.result-page').html(res);
            }
        });
    }

    function followBar(id){

        $.ajax({
            type: 'post',
            data: {barId:id},
            url: '/search/getFollowBar',
            success:function (res) {
                if (res.code == 200){
                    location.reload();
                }
            }
        });
    }

</script>
</body>

</html>
