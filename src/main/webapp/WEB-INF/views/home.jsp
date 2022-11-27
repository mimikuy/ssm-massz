<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-11-03
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="css/mui.css" rel="stylesheet"/>
    <link href="css/home.css" rel="stylesheet"/>
    <link href="fonts/iconfont.css" rel="stylesheet"/>
</head>

<body>

<header id="header" class="mui-bar mui-bar-nav">
    <h1 class="mui-title">推荐</h1>
    <a class="mui-icon mui-icon-search mui-pull-left"></a>
</header>

<div style="height: 60px;"></div>

<!-- 中间 -->
<%--<div class="parent-div">
    <div class="into-first">
        <img class="avatar" src="images/avatar.jpg"/>
        <div class="info-middle">
            <div class="info-top">
                <span class="nickname">张三</span>
                <span class="iconfont icon-game"></span>
            </div>
            <div class="info-bottom">炉石传说吧 | 15分钟前</div>
        </div>
        <div class="more">
            <span class="mui-icon mui-icon-closeempty"></span>
        </div>
    </div>
    <div class="info-text">
        <span>大家好</span>
    </div>
    <div class="info-foot">
        <span class="iconfont icon-message_light"></span>888
        <span class="iconfont icon-emojilight"></span>688
    </div>

    <div class="gap"></div>

    <div class="into-first">
        <img class="avatar" src="images/touxiang1.jpg"/>
        <div class="info-middle">
            <div class="info-top">
                <span class="nickname">一切从头52</span>
                <span class="iconfont icon-game"></span>
            </div>
            <div class="info-bottom">原神吧 | 15分钟前</div>
        </div>
        <div class="more">
            <span class="mui-icon mui-icon-closeempty"></span>
        </div>
    </div>
    <div class="info-text">
        <span>大佬们求解答 为什么我宵宫伤害还没夜阑高</span>
        <div>
            <img class="img-hua1" src="images/yelan1.jpg"/>
            <img class="img-hua2" src="images/yelan2.jpg"/>

        </div>
    </div>
    <div class="info-foot">
        <span class="iconfont icon-message_light"></span>109
        <span class="iconfont icon-emojilight"></span>688
    </div>

    <div class="gap"></div>

    <div class="into-first">
        <img class="avatar" src="images/touxiang1.jpg"/>
        <div class="info-middle">
            <div class="info-top">
                <span class="nickname">恋魂</span>
                <span class="iconfont icon-game"></span>
            </div>
            <div class="info-bottom">原神吧 | 15分钟前</div>
        </div>
        <div class="more">
            <span class="mui-icon mui-icon-closeempty"></span>
        </div>
    </div>
    <div class="info-text">
        <span>这次芭芭拉的bug米哈游真的不好修</span>
    </div>
    <div class="info-foot">
        <span class="iconfont icon-message_light"></span>999
        <span class="iconfont icon-emojilight"></span>1000
    </div>

    <div class="gap"></div>--%>

    <%--------------------------------------------------------------%>
    <!--下拉刷新容器-->
    <div id="pullrefresh" class="mui-content mui-scroll-wrapper" style="background-color: #FFF">
        <div class="mui-scroll">
            <!--数据列表-->
            <div class="post-list">
            </div>
        </div>
    </div>
    <%--------------------------------------------------------------%>



<!-- 底部 -->

<div class="botton-foot">
    <div class="button-one">
        <span class="iconfont icon-home_fill_light"></span>
        <div class="one">首页</div>
    </div>
    <div class="button-two">
        <span class="iconfont icon-post"></span>
        <div class="two">进吧</div>
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

<script src="js/mui.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    var pageNum = 0;

    mui.init({
        pullRefresh: {
            container: '#pullrefresh',
            down: {
                style:'circle',
                callback: pulldownRefresh
            },
            up: {
                auto:true,
                contentrefresh: '正在加载...',
                callback: pullupRefresh
            }
        }
    });

    $(".button-two").click(function () {
        window.location.href="/tojinba"
    });

    $(".button-three").click(function (){
        if (${userSession==null}){
            window.location.href="/toLogin"
        }else {
            $.ajax({
                type: 'post',
                url:'/post/toPublish',
                success: function (res){
                    window.location.href="/toPosts"
                }
            });
        }
    });

    $(".button-five").click(function () {
        $.ajax({
            type: 'post',
            url:'',
            success: function (res){
                window.location.href="/tomy"
            }
        });

    });




    /**
     * 下拉刷新具体业务实现
     */
    function pulldownRefresh() {
        setTimeout(function() {
            pageNum=0;
            $(".post-list").empty();
            getPostList();
            mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
            // 启用上拉刷新
            mui('#pullrefresh').pullRefresh().refresh(true);
        }, 1000);
    }

    // 上拉加载更多
    function pullupRefresh() {
        setTimeout(function() {
            getPostList();
        }, 1000);
    }

    mui('body').on('tap', '.mui-popover-action li>a', function() {
        var a = this,
            parent;
        //根据点击按钮，反推当前是哪个actionsheet
        for (parent = a.parentNode; parent != document.body; parent = parent.parentNode) {
            if (parent.classList.contains('mui-popover-action')) {
                break;
            }
        }
        //关闭actionsheet
        mui('#' + parent.id).popover('toggle');
        //	mui.alert(a.innerHTML);
    })

    function getPostList() {
        pageNum++;
        $.ajax({
            url:"/post/getAllPost",
            type:"get",
            data:{
                pageNum: pageNum,
                pageSize:5
            },
            success:function (res) {
                if(res.code == 200){

                    let pageInfo = res.data;
                    let data = res.data.list;

                    for(let i=0;i<data.length;i++){


                        let itemStr1 = '<div class="into-first">'+
                            '<img class="avatar" src="/img/'+data[i].users.avatar+'"/>'+
                            '<div class="info-middle">'+
                                '<div class="info-top">'+
                                    '<span class="nickname">'+data[i].users.nick_name+'</span>'+
                                    '<span class="iconfont icon-game"></span>'+
                                '</div>'+
                                '<div class="info-bottom">'+data[i].bar.barName+"|"+ data[i].createTime+'</div>'+
                            '</div>'+
                            '<div class="more">'+
                                '<span class="mui-icon mui-icon-closeempty"></span>'+
                            '</div>'+
                        '</div>'+
                        '<div class="info-text">'+
                            '<span>'+data[i].postTitle+'</span>'

                        let itemStr2="";

                        if(data[i].postImgList.length==1 && data[i].postImgList[0].picName != null){
                            itemStr2 = '<div class="post-img">'
                                +'<img src="/img/'+data[i].postImgList[0].picName+'"/>'

                        }else if(data[i].postImgList.length==2 && data[i].postImgList[0].picName != null){
                            itemStr2 = '<div class="post-img-2">'
                                +'<img src="/img/'+data[i].postImgList[0].picName+'"/>'
                                +'<img src="/img/'+data[i].postImgList[1].picName+'"/>'
                                +'</div>';
                        }else if(data[i].postImgList.length>=3 && data[i].postImgList[0].picName != null){
                            itemStr2 = '<div class="post-img-3">'
                                +'<img src="/img/'+data[i].postImgList[0].picName+'"/>'
                                +'<img src="/img/'+data[i].postImgList[1].picName+'"/>'
                                +'<img src="/img/'+data[i].postImgList[2].picName+'"/>'
                                +'</div>';
                        }

                        let itemStr3='</div>'+
                            '<div class="info-foot">'+
                            '<span class="iconfont icon-message_light"></span>'+694+
                            '<span class="iconfont icon-emojilight"></span>'+1500+
                        '</div>'+
                        '<div class="gap"></div>'


                        $(".post-list").append(itemStr1+itemStr2+itemStr3);
                    }

                    // 判断是否有下一页
                    if(pageInfo.isLastPage){
                        mui('#pullrefresh').pullRefresh().endPullupToRefresh(true); //参数为true代表没有更多数据了。
                    }else{
                        mui('#pullrefresh').pullRefresh().endPullupToRefresh(false); //参数为true代表没有更多数据了。
                    }
                }

            }
        })
    }

</script>
</body>

</html>

