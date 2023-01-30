package cn.massz.model;

public class Users {

    private Integer user_id;
    private String user_name;
    private String password;
    private String nick_name;
    private String phone;
    private String gender;
    private String signature;
    private String avatar;

    private Integer postNum; // 我的帖子数
    private Integer barNum; // 关注的吧数
    private Integer fansNum; // 粉丝数
    private Integer followNum; // 关注数
    private Users user;


    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getPostNum() {
        return postNum;
    }

    public void setPostNum(Integer postNum) {
        this.postNum = postNum;
    }

    public Integer getBarNum() {
        return barNum;
    }

    public void setBarNum(Integer barNum) {
        this.barNum = barNum;
    }

    public Integer getFansNum() {
        return fansNum;
    }

    public void setFansNum(Integer fansNum) {
        this.fansNum = fansNum;
    }

    public Integer getFollowNum() {
        return followNum;
    }

    public void setFollowNum(Integer followNum) {
        this.followNum = followNum;
    }

    @Override
    public String toString() {
        return "Users{" +
                "user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", password='" + password + '\'' +
                ", nick_name='" + nick_name + '\'' +
                ", phone='" + phone + '\'' +
                ", gender='" + gender + '\'' +
                ", signature='" + signature + '\'' +
                ", avatar='" + avatar + '\'' +
                ", postNum=" + postNum +
                ", barNum=" + barNum +
                ", fansNum=" + fansNum +
                ", followNum=" + followNum +
                ", user=" + user +
                '}';
    }
}
