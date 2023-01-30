<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-11-04
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="/css/mui.css" rel="stylesheet" />
    <link href="/fonts/iconfont.css" rel="stylesheet" />
    <link href="/css/jinba.css" rel="stylesheet" />
</head>

<body>
<div class="zhong">
    <header id="header" class="mui-bar mui-bar-nav">
        <a class="mui-icon mui-icon-pengyouquan mui-pull-right"></a>
        <h1 class="mui-title">进吧</h1>
    </header>

    <div style="height: 50px;"></div>

    <div class="mui-input-row mui-search">
        <input type="search" class="mui-input-clear" placeholder="大家都在搜：挖矿时代落幕：以太坊合并完成">
    </div>

    <div class="record">
        <div class="info-left">
            <span>最近逛的吧</span>
        </div>

        <div class="info-right">
            <span class="iconfont icon-attention eye"></span>
        </div>

    </div>
    <div class="info-middle">
        <div class="images">
            <div class="img-one">
                <img class="img1" src="images/yuanshen1.jpg" />
                <div class="img-name">原神</div>
            </div>
            <div class="img-two">
                <img class="img1" src="images/apex.jpg" />
                <div class="img-name">apex英雄</div>
            </div>
            <div class="img-three">
                <img class="img1" src="images/yxlm.jpg" />
                <div class="img-name3">英雄联盟手游</div>
            </div>
        </div>
    </div>


    <div class="gap"></div>

    <div class="follow">
        <span>我关注的吧</span>
    </div>
    <div class="gap2"></div>
    <div class="ba-name">
        <div class="name-left">
            <div class="info-left">
                <span>原神</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>

        <div class="gap3"></div>

        <div class="name-right">
            <div class="info-left">
                <span>马鞍山师专</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>
    </div>
    <div class="gap2"></div>

    <div class="ba-name">
        <div class="name-left">
            <div class="info-left">
                <span>马鞍山</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>

        <div class="gap3"></div>

        <div class="name-right">
            <div class="info-left">
                <span>最强大脑</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>
    </div>

    <div class="gap2"></div>

    <div class="ba-name">
        <div class="name-left">
            <div class="info-left">
                <span>花</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>

        <div class="gap3"></div>

        <div class="name-right">
            <div class="info-left">
                <span>搞笑</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>
    </div>

    <div class="gap2"></div>

    <div class="ba-name">
        <div class="name-left">
            <div class="info-left">
                <span>和县</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>

        <div class="gap3"></div>

        <div class="name-right">
            <div class="info-left">
                <span>内涵</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>
    </div>

    <div class="gap2"></div>

    <div class="ba-name">
        <div class="name-left">
            <div class="info-left">
                <span>笑话</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>

        <div class="gap3"></div>

        <div class="name-right">
            <div class="info-left">
                <span>蓝桥杯</span>
            </div>
            <div class="info-right">
                <span class="iconfont icon-choiceness eye"></span>
            </div>
        </div>
    </div>

    <div class="gap2"></div>


    <div class="foot">
        <span>+ 探索更多有趣内容</span>
    </div>
</div>

<!-- 底部 -->

<div class="botton-foot">
    <div class="button-one">
        <span class="iconfont icon-home"></span>
        <div class="one">首页</div>
    </div>
    <div class="button-two" >
        <span class="iconfont icon-post"></span>
        <div class="two" style="color: #00eaff">进吧</div>
    </div>
    <div class="button-three">
        <span class="mui-icon mui-icon-plus"></span>

    </div>
    <div class="button-four">
        <span class="iconfont icon-comment"></span>
        <div class="four">消息</div>
    </div>
    <div class="button-five">
        <span class="iconfont icon-people"></span>
        <div class="five">我的</div>
    </div>
</div>






<script src="/js/mui.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    mui.init()

    $(".button-one").click(function () {
        window.location.href="/toHome"
    });



    $(".button-three").click(function (){
        $.ajax({
            type: 'post',
            url:'/post/toPublish',
            success: function (res){
                window.location.href="/toPosts"
            }
        });
    });

    $(".button-five").click(function () {
        window.location.href="/tomy"
    });

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

</script>
</body>

</html>
