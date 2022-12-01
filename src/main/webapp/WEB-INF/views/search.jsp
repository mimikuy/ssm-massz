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
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/css/mui.css" rel="stylesheet"/>
    <link href="/css/search.css" rel="stylesheet"/>
    <link href="/fonts/iconfont.css" rel="stylesheet"/>
</head>

<body>
<div class="search-page">
    <div class="input_left">
        <div class="mui-input-row mui-search">
            <input type="search" class="mui-input-clear" placeholder="大家都在搜：《卧龙：苍天陨落》"/>
        </div>
        <input class="quxiao" type="button" value="取消"/>
    </div>
    <div class="bang">
        <span class="first">热搜榜</span>
        <span class="second">热吧榜</span>
        <span class="third">游戏榜</span>
    </div>
    <div class="beijing">
        <div class="bangdan">
            <div class="ranking" style="background-color: red;">1</div>
            <span style="margin-left: 5px;">管泽元Top10</span>
            <span class="redu"><i class="iconfont icon-hot"></i>508.9W</span>
        </div>
        <div class="bangdan">
            <div class="ranking" style="background-color: #f05000;">2</div>
            <span style="margin-left: 5px;">s12赛程时间</span>
            <span class="redu"><i class="iconfont icon-hot"></i>493.5W</span>
        </div>
        <div class="bangdan">
            <div class="ranking" style="background-color: #ffaa00;">3</div>
            <span style="margin-left: 5px;">羊了个羊</span>
            <span class="redu"><i class="iconfont icon-hot"></i>483.1W</span>
        </div>
        <div class="bangdan">
            <div class="ranking">4</div>
            <span style="margin-left: 5px;">王嘉尔</span>
            <span class="redu"><i class="iconfont icon-hot"></i>452.3W</span>
        </div>
        <div class="bangdan">
            <div class="ranking">5</div>
            <span style="margin-left: 5px;">交通事故</span>
            <span class="redu"><i class="iconfont icon-hot"></i>419.2W</span>
        </div>
        <div class="bangdan">
            <div class="ranking">6</div>
            <span style="margin-left: 5px;">如龙8</span>
            <span class="redu"><i class="iconfont icon-hot"></i>405.1W</span>
        </div>
        <div class="bangdan">
            <div class="ranking">7</div>
            <span style="margin-left: 5px;">台风梅花</span>
            <span class="redu"><i class="iconfont icon-hot"></i>392.3W</span>
        </div>
        <div class="bangdan">
            <div class="ranking">8</div>
            <span style="margin-left: 5px;">以太坊合并</span>
            <span class="redu"><i class="iconfont icon-hot"></i>386.1W</span>
        </div>
    </div>
</div>

<script src="/js/mui.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    mui.init()

    $(".mui-input-clear").keydown(function (){
        if (event.keyCode == 13){
            console.log($(".mui-input-clear").val())
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
        window.location.href='/tomy'
    });

</script>
</body>

</html>

