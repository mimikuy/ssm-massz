package cn.massz.model;

import java.util.List;

public class PostCommComm {

    private int pcc_id;
    private int pcc_userId;
    private int pcc_commentId;
    private String pcc_commentContent;

    private List<Users> usersList;

    public int getPcc_id() {
        return pcc_id;
    }

    public void setPcc_id(int pcc_id) {
        this.pcc_id = pcc_id;
    }

    public int getPcc_userId() {
        return pcc_userId;
    }

    public void setPcc_userId(int pcc_userId) {
        this.pcc_userId = pcc_userId;
    }

    public int getPcc_commentId() {
        return pcc_commentId;
    }

    public void setPcc_commentId(int pcc_commentId) {
        this.pcc_commentId = pcc_commentId;
    }

    public String getPcc_commentContent() {
        return pcc_commentContent;
    }

    public void setPcc_commentContent(String pcc_commentContent) {
        this.pcc_commentContent = pcc_commentContent;
    }

    public List<Users> getUsersList() {
        return usersList;
    }

    public void setUsersList(List<Users> usersList) {
        this.usersList = usersList;
    }

    @Override
    public String toString() {
        return "PostCommComm{" +
                "pcc_id=" + pcc_id +
                ", pcc_userId=" + pcc_userId +
                ", pcc_commentId=" + pcc_commentId +
                ", pcc_commentContent='" + pcc_commentContent + '\'' +
                ", usersList=" + usersList +
                '}';
    }
}
