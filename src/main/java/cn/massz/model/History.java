package cn.massz.model;

public class History {
    private int history_id;
    private int post_id;
    private int user_id;
    private String create_time;

    public int getHistory_id() {
        return history_id;
    }

    public void setHistory_id(int history_id) {
        this.history_id = history_id;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    @Override
    public String toString() {
        return "History{" +
                "history_id=" + history_id +
                ", post_id=" + post_id +
                ", user_id=" + user_id +
                ", create_time='" + create_time + '\'' +
                '}';
    }
}
