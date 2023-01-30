<%--
  Created by IntelliJ IDEA.
  User: sun
  Date: 2022-11-28
  Time: 17:01
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
    <link href="/css/details.css" rel="stylesheet"/>
    <link href="/fonts/iconfont.css" rel="stylesheet"/>
</head>

<body>
<div class="details-page">
    <header id="header" class="mui-bar mui-bar-nav">
        <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
        <a class="mui-tab-item" href="#forward1">
            <span class="mui-icon mui-icon-more mui-pull-right"></span>
        </a>
    </header>

    <div style="height: 60px;"></div>

    <div class="post-title">
        <span>${post.postTitle}</span>
    </div>
    <div class="user-info">
        <img class="avatar" src="/img/${post.users.avatar}"/>
        <div class="info-middle">
            <div class="info-top">
                <span class="nickname">${post.users.nick_name}</span>
            </div>
            <div class="info-bottom">${post.bar.barName}吧| ${post.createTime}</div>
        </div>
        <div class="more">
            <c:if test="${booleanSel == true}">
                <span class="guanzhu">已关注</span>
            </c:if>
            <c:if test="${booleanSel == null}">
                <span class="guanzhu">关注</span>
            </c:if>

        </div>
    </div>

    <div class="post-content">
        <span>${post.content}</span>
    </div>

    <div class="zhaopian">
        <c:forEach items="${post.postImgList}" var="postImg">
            <c:if test="${post.postImgList.size() == 1}">
                <img src="/img/${post.postImgList[0].picName}"/>
            </c:if>
            <c:if test="${post.postImgList.size() == 2}">
                <img src="/img/${post.postImgList[0].picName}"/>
                <img src="/img/${post.postImgList[1].picName}"/>
            </c:if>
            <c:if test="${post.postImgList.size() == 3}">
                <img src="/img/${post.postImgList[0].picName}"/>
                <img src="/img/${post.postImgList[1].picName}"/>
                <img src="/img/${post.postImgList[2].picName}"/>
            </c:if>

        </c:forEach>

    </div>

    <div class="dianzan" onclick="dianzhan(${post.postId})">
        <span>点 赞</span>
    </div>

    <div class="mroe"></div>


    <div style="margin-bottom: 60px;">
        <div class="quanbu">
            <span>全部回复</span>
            <span>只看楼主</span>
        </div>
        <c:forEach items="${post.postComment}" var="pc">
            <div class="mroe1"></div>
            <div class="lou">
                <div class="lou-info">
                    <img class="avatar" src="/img/${pc.users.avatar}"/>
                    <div class="info-middle">
                        <div class="info-top">
                            <span class="nickname">${pc.users.nick_name}</span>
                            <c:if test="${post.userId == pc.users.user_id}">
                                <div>
                                    <span class="louzhu">楼主</span>
                                </div>
                            </c:if>
                        </div>
                        <div class="info-bottom">第${pc.commentId}楼 | ${post.createTime}</div>
                    </div>
                    <div class="more-svg">
                        <a class="mui-tab-item" href="#forward" data-cmid="${pc.commentId}"
                           data-uid="${userSession.user_id}">
                            <span class="mui-icon mui-icon-more mui-pull-right"></span>
                        </a>
                    </div>
                </div>
                <div class="pinglun">
                    <span>${pc.commentContent}</span>
                </div>

                <div class="zjpinglun">
                    <c:forEach items="${pc.postCommCommList}" var="pcc">
                        <div class="info-top">
                            <span class="nickname">${pcc.usersList[0].nick_name}</span>

                            <c:if test="${pc.users.user_id == pcc.usersList[0].user_id}">
                                <div>
                                    <span class="louzhu">楼主</span>
                                </div>
                            </c:if>
                            <span>:</span>
                            <span>${pcc.pcc_commentContent}</span>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </c:forEach>

    </div>
    <div class="mui-input-row ">
        <input type="search" class="mui-input-clear" placeholder="说说你的看法..."/>
    </div>
</div>

<div id="forward" class="mui-popover mui-popover-action mui-popover-bottom">
    <ul class="mui-table-view">
        <li class="mui-table-view-cell">
            <a href="#" id="huifu">回复</a>
        </li>

        <li class="mui-table-view-cell">
            <a href="#" id="delete">删除</a>
        </li>
    </ul>
    <ul class="mui-table-view">
        <li class="mui-table-view-cell">
            <a href="#forward"><b>取消</b></a>
        </li>
    </ul>
</div>

<div id="forward1" class="mui-popover mui-popover-action mui-popover-bottom">
    <ul class="mui-table-view">
        <li class="mui-table-view-cell">
            <a href="#" id="shoucang">收藏</a>
        </li>
    </ul>

</div>

<%--<script src="/js/mui.js"></script>--%>
<script src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    let cmId = 0;
    let uId = 0;

    mui.init(
        isLike(${post.postId})
    )

    $(".mui-input-clear").keydown(function () {
        if (event.keyCode == 13) {
            console.log("1231")
            $.ajax({
                type: 'post',
                data: {
                    postId: ${post.postId},
                    commentContent: $(".mui-input-clear").val()
                },
                url: '/det/insertPc',
                success: function (res) {
                    /*document.write("<form action='det/toPostDetails' method=post name=form1 style='display:none'>");
                    document.write("<input type=hidden name=post_id value='
                    ${post.postId}'/>");
                    document.write("</form>");
                    document.form1.submit();*/
                    location.reload()
                }
            });
        }
    });

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
        console.log(this.getAttribute("id"))
        if (this.getAttribute("id") == "delete") {
            del();
        }
        if (this.getAttribute("id") == "shoucang") {
            sc();
        }
    })

    mui(".lou").on('tap', '.mui-tab-item', function () {
        //获取选中项id
        cmId = this.getAttribute("data-cmid");
        uId = this.getAttribute("data-uid");

    })

    document.getElementById("huifu").addEventListener('tap', function (e) {
        e.detail.gesture.preventDefault(); //修复iOS 8.x平台存在的bug，使用plus.nativeUI.prompt会造成输入法闪一下又没了
        var btnArray = ['取消', '确定'];
        mui.prompt('', '', '', btnArray, function (e) {
            if (e.index == 1) {
                $.ajax({
                    type: 'post',
                    data: {
                        pcc_userId: uId,
                        pcc_commentId: cmId,
                        pcc_commentContent: e.value
                    },
                    url: '/det/insertPcc',
                    success: function (res) {
                        /*document.write("<form action='det/toPostDetails' method=post name=form1 style='display:none'>");
                        document.write("<input type=hidden name=post_id value='
                        ${post.postId}'/>");
                        document.write("</form>");
                        document.form1.submit();*/
                        location.reload()
                    }
                });
            }
        });
    });

    function del() {
        $.ajax({
            type: 'post',
            data: {
                commentId: cmId,
            },
            url: '/det/deletePc',
            success: function (res) {

                // location.reload()
            }
        });
    }


    function isLike(postId) {
        console.log("123")
        $.ajax({
            url: "/post-like/selectPostLike",
            type: "get",
            data: {
                postId: postId
            },
            success: function (res) {
                if (res.code == 200) {
                    //    mui.alert("点赞成功");
                    $(".dianzan > span").css({"color": "red"});


                } else if (res.code == 400) {
                    $(".dianzan > span").css({"color": "blue"});

                }
            }
        })
    }


    function dianzhan(postId) {
        console.log("123")
        $.ajax({
            url: "/post-like/selectPostLike",
            type: "get",
            data: {
                postId: postId
            },
            success: function (res) {
                if (res.code == 200) {
                    //    mui.alert("点赞成功");

                    deletePostLike()

                } else if (res.code == 400) {

                    addPostLike()
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
                postId: ${post.postId}
            },
            success: function (res) {
                if (res.code == 200) {
                    //    mui.alert("点赞成功");
                    $(".dianzan > span").css({"color": "red"});

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
                postId: ${post.postId}
            },
            success: function (res) {
                if (res.code == 200) {
                    //  mui.alert("取消成功");
                    $(".dianzan > span").css({"color": "blue"});

                }
            }
        })
    }
    /*返回*/
        $(".mui-action-back").click(function (){

            window.location.href="/toHome"
        });

        /*收藏*/
    function sc() {
        $.ajax({
            url: "/det/collectionPost",
            type: "get",
            data: {
                postId: ${post.postId}
            },
            success:function (res) {

                $("#forward1").attr("class","mui-popover mui-popover-action mui-popover-bottom");
                $(".mui-backdrop").css('opacity','0');
            }
        });
    }

    $(".guanzhu").click(function (){
        $.ajax({
            url: "/det/insertFollowId",
            type: "get",
            data: {
                follow_user_id: ${post.users.user_id}
            },
            success:function (res) {
                if (res.code == 200){
                    $(".guanzhu").text("已关注")
                }

            }
        })
    })

</script>
</body>

</html>

