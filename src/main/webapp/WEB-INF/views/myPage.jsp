<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-11-28
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>我的主页</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="css/mui.css" rel="stylesheet"/>
    <link href="css/myPage.css" rel="stylesheet"/>
    <link href="fonts/iconfont.css" rel="stylesheet"/>
</head>

<body>


<header id="header" class="mui-bar mui-bar-nav">

    <h1 class="mui-title">我的主页</h1>
    <a class="mui-icon mui-icon-arrowleft"></a>

</header>

<img class="bg" src="/img/beijing.jpg"/>


<div class="button-ziliao">
    <img class="touxiang" src="/img/${userInformation.avatar}"/>
    <button class="bianji" type="button">编辑资料</button>
</div>

<div style="height: 50px;"></div>

<div class="info-top">
    <span class="iconfont icon-crown huangguan"></span>
    <span class="nickname">${userInformation.nick_name}</span>
    <span class="iconfont icon-male gender"></span>
</div>

<div class="info-middle">
    <span>${userInformation.fansNum} 粉丝   |   ${userInformation.followNum} 关注   |   ${userInformation.barNum} 关注的吧</span>
</div>

<div class="baling">
    <span>吧龄：14.6年</span>
</div>
<div class="jianjie">
    <span>简介：${userInformation.signature}</span>
</div>


<!--下拉刷新容器-->
<div id="pullrefresh" class="mui-content mui-scroll-wrapper" style="margin-top: 300px">
    <div class="mui-scroll">
        <!--数据列表-->
        <div class="post-list">

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
        }
    });

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

    function getPostList() {
        pageNum++;
        $.ajax({
            url: "/post/getPostList",
            type: "get",
            data: {
                pageNum: pageNum,
                pageSize: 6
            },
            success: function (res) {
                if (res.code == 200) {
                    let pageInfo = res.data;
                    let data = res.data.list;
                    //  debugger
                    for (let i = 0; i < data.length; i++) {
                        let itemStr = '<div class="post-item" id="post_' + data[i].postId + '" data-id="' + data[i].postId + '" >'
                            + '<div class="item-top">'
                            + '<div class="top-left">'
                            + '<div class="post-name">' + data[i].barName + '吧</div>'
                            + '<div class="time">' + data[i].createTime + '</div>'
                            + '</div>'
                            + '<div class="top-right">';

                        /*+'<span class="iconfont icon-lock"></span>'
                        +'<span>私密</span>'*/
                        let itemStr1 = '<a class="mui-tab-item" href="#forward" data-id="' + data[i].postId + '" data-secret="' + data[i].secret + '">'
                            + '<span class="iconfont icon-more_light">'
                            + '</span>'
                            + '</a>'
                            + '</div>'
                            + '</div>'
                            + '<div class="item-middle">'
                            + '<div class="post-title">' + data[i].postTitle + '</div>';

                        let itemStr2 = "";
                        if (data[i].postImgList.length == 1) {
                            itemStr2 = '<div class="post-img">'
                                + '<img src="/img/' + data[i].postImgList[0].picName + '"/>'
                                + '</div>';
                        } else if (data[i].postImgList.length == 2) {
                            itemStr2 = '<div class="post-img-2">'
                                + '<img src="/img/' + data[i].postImgList[0].picName + '"/>'
                                + '<img src="/img/' + data[i].postImgList[1].picName + '"/>'
                                + '</div>';
                        } else if (data[i].postImgList.length >= 3) {
                            itemStr2 = '<div class="post-img-3">'
                                + '<img src="/img/' + data[i].postImgList[0].picName + '"/>'
                                + '<img src="/img/' + data[i].postImgList[1].picName + '"/>'
                                + '<img src="/img/' + data[i].postImgList[2].picName + '"/>'
                                + '</div>';
                        }

                        let itemStr3 = `</div>
                            <div class="item-bottom">
                            <div class="b-item">
                            <span class="iconfont icon-comment"></span>
                            <span>评论</span>
                            </div>
                            <div class="b-item like-btn \${data[i].myLike==1? 'red-color':''}" >
                            <span class="iconfont icon-appreciate"></span>
                            <span class="like-num">\${data[i].likeNum==0?'点赞':data[i].likeNum}</span>
                            </div>
                            </div>
                            </div>`;

                        $(".post-list").append(itemStr + itemStr1 + itemStr2 + itemStr3);
                    }

                    // 判断是否有下一页
                    if (pageInfo.isLastPage) {
                        mui('#pullrefresh').pullRefresh().endPullupToRefresh(true); //参数为true代表没有更多数据了。
                    } else {
                        mui('#pullrefresh').pullRefresh().endPullupToRefresh(false); //参数为true代表没有更多数据了。
                    }
                    // 点赞
                    mui(".post-list").on('tap', '.like-btn', function () {
                        postId = $(this).parents(".post-item").attr("data-id");
                        let isLike = $(this).hasClass("red-color");
                        if (isLike) {
                            // 取消点赞
                            deletePostLike();
                        } else {
                            // 点赞
                            addPostLike();
                        }

                    })
                }

            }
        })
    }

    // 点赞
    function addPostLike() {
        $.ajax({
            url: "/post-like/addPostLike",
            type: "get",
            data: {
                postId: postId
            },
            success: function (res) {
                if (res.code == 200) {
                    //    mui.alert("点赞成功");
                    $("#post_" + postId + " .like-btn").toggleClass("red-color");
                    let num = $("#post_" + postId + " .like-num").text();
                    if (num == '点赞') {
                        $("#post_" + postId + " .like-num").text(1)
                    } else {
                        $("#post_" + postId + " .like-num").text(++num);
                    }
                }
            }
        })
    }

    // 取消点赞
    function deletePostLike() {
        $.ajax({
            url: "/post-like/deletePostLike",
            type: "get",
            data: {
                postId: postId
            },
            success: function (res) {
                if (res.code == 200) {
                    //  mui.alert("取消成功");
                    $("#post_" + postId + " .like-btn").toggleClass("red-color");
                    let num = $("#post_" + postId + " .like-num").text();
                    num--;
                    if (num == 0) {
                        $("#post_" + postId + " .like-num").text("点赞");
                    } else {
                        $("#post_" + postId + " .like-num").text(num);
                    }
                }
            }
        })
    }

    $(".bianji").click(function () {
        window.location.href = '/tomyinformation'
    });

    $(".mui-icon-arrowleft").click(function (){
        window.history.go(-1)
    })
</script>
</body>

</html>
