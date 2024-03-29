package cn.massz.model;

public class PostLike {
    private Integer userId;
    private Integer postId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    @Override
    public String toString() {
        return "PostLike{" +
                "userId=" + userId +
                ", postId=" + postId +
                '}';
    }
}
