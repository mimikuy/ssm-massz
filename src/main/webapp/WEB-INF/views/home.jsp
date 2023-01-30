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
<div class="home-page">
    <header id="header" class="mui-bar mui-bar-nav">
        <h1 class="mui-title">推荐</h1>
        <a class="mui-icon mui-icon-search mui-pull-left"></a>
    </header>

    <div style="height: 60px;"></div>

    <!-- 中间 -->


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
            <span class="iconfont icon-home"></span>
            <div class="one" style="color: #00eaff">首页</div>
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
</div>

<script src="/js/mui.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    var pageNum = 0;
    var postId = 0;
    mui.init({
        pullRefresh: {
            container: '#pullrefresh',
            down: {
                style: 'circle',
                callback: pulldownRefresh
            },
            up: {
                auto: true,
                contentrefresh: '正在加载...',
                callback: pullupRefresh
            }
        },

    });

    $(".mui-icon-search").click(function () {
        window.location.href = "/search/toSearch"
    });

    $(".button-two").click(function () {
        window.location.href = "/tojinba"
    });

    $(".button-three").click(function () {
        if (${userSession==null}) {
            window.location.href = "/toLogin"
        } else {
            $.ajax({
                type: 'post',
                url: '/post/toPublish',
                success: function (res) {
                    window.location.href = "/toPosts"
                }
            });
        }
    });

    $(".button-five").click(function () {
        window.location.href = "/tomy"

    });


    /*进入进帖子详情*/


    /**
     * 下拉刷新具体业务实现
     */
    function pulldownRefresh() {
        setTimeout(function () {
            pageNum = 0;
            $(".post-list").empty();
            getPostList();
            mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
            // 启用上拉刷新
            mui('#pullrefresh').pullRefresh().refresh(true);
        }, 1000);
    }

    // 上拉加载更多
    function pullupRefresh() {
        setTimeout(function () {
            getPostList();
        }, 1000);
    }

    mui('body').on('tap', '.mui-popover-action li>a', function () {
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
            url: "/post/getAllPost",
            type: "get",
            data: {
                pageNum: pageNum,
                pageSize: 5,
                userId: 0
            },
            success: function (res) {
                if (res.code == 200) {

                    let pageInfo = res.data;
                    let data = res.data.list;

                    for (let i = 0; i < data.length; i++) {
                        let itemStr1 = '<div class="post-item" id="post_'+data[i].postId+'" data-id="'+data[i].postId+'" onclick="toPostDetails(' + data[i].postId + ')">' +
                            '<div class="into-first" >' +
                            '<img class="avatar" src="/img/' + data[i].users.avatar + '"/>' +
                            '<div class="info-middle">' +
                            '<div class="info-top">' +
                            '<span class="nickname">' + data[i].users.nick_name + '</span>' +
                            '<span class="iconfont icon-game"></span>' +
                            '</div>' +
                            '<div class="info-bottom">' + data[i].bar.barName + "|" + data[i].createTime + '</div>' +
                            '</div>' +
                            '<div class="more">' +
                            '<span class="mui-icon mui-icon-closeempty"></span>' +
                            '</div>' +
                            '</div>' +
                            '<div class="info-text">' +
                            '<span>' + data[i].postTitle + '</span>'

                        let itemStr2 = "";

                        if (data[i].postImgList.length == 1 && data[i].postImgList[0].picName != null) {
                            itemStr2 = '<div class="post-img">'
                                + '<img src="/img/' + data[i].postImgList[0].picName + '"/>'

                        } else if (data[i].postImgList.length == 2 && data[i].postImgList[0].picName != null) {
                            itemStr2 = '<div class="post-img-2">'
                                + '<img src="/img/' + data[i].postImgList[0].picName + '"/>'
                                + '<img src="/img/' + data[i].postImgList[1].picName + '"/>'
                                + '</div>';
                        } else if (data[i].postImgList.length >= 3 && data[i].postImgList[0].picName != null) {
                            itemStr2 = '<div class="post-img-3">'
                                + '<img src="/img/' + data[i].postImgList[0].picName + '"/>'
                                + '<img src="/img/' + data[i].postImgList[1].picName + '"/>'
                                + '<img src="/img/' + data[i].postImgList[2].picName + '"/>'
                                + '</div>';
                        }

                        let itemStr3 = '</div>'+
                            `<div class="item-bottom">
                                <div class="b-item  pl-btn">
                                <span class="iconfont icon-comment"></span>
                                <span>\${data[i].pingLunNum==0?'评论':data[i].pingLunNum}</span>
                                </div>
                                <div class="b-item like-btn \${data[i].myLike==1? 'red-color':''}" >
                                <span class="iconfont icon-appreciate"></span>
                                <span class="like-num">\${data[i].likeNum==0?'点赞':data[i].likeNum}</span>
                                </div>
                            </div>` +'</div> ' +
                            '<div class="gap"></div>'


                        $(".post-list").append(itemStr1 + itemStr2 + itemStr3);


                    }

                    // 判断是否有下一页
                    if (pageInfo.isLastPage) {
                        mui('#pullrefresh').pullRefresh().endPullupToRefresh(true); //参数为true代表没有更多数据了。
                    } else {
                        mui('#pullrefresh').pullRefresh().endPullupToRefresh(false); //参数为true代表没有更多数据了。
                    }
                    // 点赞
                    mui(".post-list").on('tap','.like-btn',function(){
                        postId = $(this).parents(".post-item").attr("data-id");
                        let isLike = $(this).hasClass("red-color");

                        if(isLike){
                            // 取消点赞
                            deletePostLike();
                        }else{
                            // 点赞
                            addPostLike();
                        }

                    });


                }

            }
        })
    }


    function toPostDetails(id) {
        $.ajax({
            type: 'post',
            data: {postId: id},
            url: '/det/toPostDetails',
            success: function (res) {
                $('body').html(res);
            }

        });
    }

    // 点赞
    function addPostLike() {
        $.ajax({
            url:"/post-like/addPostLike",
            type:"get",
            data:{
                postId: postId
            },
            success:function (res) {
                if(res.code == 200){
                    //    mui.alert("点赞成功");
                    $("#post_"+postId+" .like-btn").toggleClass("red-color");
                    let num = $("#post_"+postId+" .like-num").text();
                    if(num == '点赞'){
                        $("#post_"+postId+" .like-num").text(1)
                    }else{
                        $("#post_"+postId+" .like-num").text(++num);
                    }
                }
            }
        });

    }

    // 取消点赞
    function deletePostLike() {
        $.ajax({
            url:"/post-like/deletePostLike",
            type:"get",
            data:{
                postId: postId
            },
            success:function (res) {
                if(res.code == 200){
                    //  mui.alert("取消成功");
                    $("#post_"+postId+" .like-btn").toggleClass("red-color");
                    let num = $("#post_"+postId+" .like-num").text();
                    num--;
                    if(num == 0){
                        $("#post_"+postId+" .like-num").text("点赞");
                    }else{
                        $("#post_"+postId+" .like-num").text(num);
                    }
                }
            }
        })
    }

</script>
</body>

</html>

