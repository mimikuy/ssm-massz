package cn.massz.model;

import java.util.List;

public class Posts {
    private Integer postId;
    private String postTitle;
    private String content;
    private Integer barId;
    private Integer userId;
    private String createTime;

    private String barName;
    private Integer secret;

    private Integer likeNum; // 点赞数
    private Integer pingLunNum; // 帖子评论数
    private Integer myLike; // 我是否点赞  0-未点赞，1-已点赞
    private String historyTime;


    private Bar bar;

    private Users users;

    private List<PostImg> postImgList;

    private List<PostComment> postComment;


    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getBarId() {
        return barId;
    }

    public void setBarId(Integer barId) {
        this.barId = barId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getBarName() {
        return barName;
    }

    public void setBarName(String barName) {
        this.barName = barName;
    }

    public Integer getSecret() {
        return secret;
    }

    public void setSecret(Integer secret) {
        this.secret = secret;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getPingLunNum() {
        return pingLunNum;
    }

    public void setPingLunNum(Integer pingLunNum) {
        this.pingLunNum = pingLunNum;
    }

    public Integer getMyLike() {
        return myLike;
    }

    public void setMyLike(Integer myLike) {
        this.myLike = myLike;
    }

    public Bar getBar() {
        return bar;
    }

    public void setBar(Bar bar) {
        this.bar = bar;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }



    public List<PostImg> getPostImgList() {
        return postImgList;
    }

    public void setPostImgList(List<PostImg> postImgList) {
        this.postImgList = postImgList;
    }

    public List<PostComment> getPostComment() {
        return postComment;
    }

    public void setPostComment(List<PostComment> postComment) {
        this.postComment = postComment;
    }

    public String getHistoryTime() {
        return historyTime;
    }

    public void setHistoryTime(String historyTime) {
        this.historyTime = historyTime;
    }

    @Override
    public String toString() {
        return "Posts{" +
                "postId=" + postId +
                ", postTitle='" + postTitle + '\'' +
                ", content='" + content + '\'' +
                ", barId=" + barId +
                ", userId=" + userId +
                ", createTime='" + createTime + '\'' +
                ", barName='" + barName + '\'' +
                ", secret=" + secret +
                ", likeNum=" + likeNum +
                ", pingLunNum=" + pingLunNum +
                ", myLike=" + myLike +
                ", historyTime='" + historyTime + '\'' +
                ", bar=" + bar +
                ", users=" + users +
                ", postImgList=" + postImgList +
                ", postComment=" + postComment +
                '}';
    }
}
