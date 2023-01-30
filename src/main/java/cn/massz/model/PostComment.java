package cn.massz.model;

import java.util.List;

public class PostComment {
    private int commentId;
    private int userId;
    private int postId;
    private String commentContent;

    private Users users;

    private List<PostCommComm> postCommCommList;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public List<PostCommComm> getPostCommCommList() {
        return postCommCommList;
    }

    public void setPostCommCommList(List<PostCommComm> postCommCommList) {
        this.postCommCommList = postCommCommList;
    }

    @Override
    public String toString() {
        return "PostComment{" +
                "commentId=" + commentId +
                ", userId=" + userId +
                ", postId=" + postId +
                ", commentContent='" + commentContent + '\'' +
                ", users=" + users +
                ", postCommCommList=" + postCommCommList +
                '}';
    }
}
