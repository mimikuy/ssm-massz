package cn.massz.model;

public class Bar {
    private int barId;
    private String barName;
    private String picName;



    public int getBarId() {
        return barId;
    }

    public void setBarId(int barId) {
        this.barId = barId;
    }

    public String getBarName() {
        return barName;
    }

    public void setBarName(String barName) {
        this.barName = barName;
    }

    public String getPicName() {
        return picName;
    }

    public void setPicName(String picName) {
        this.picName = picName;
    }



    @Override
    public String toString() {
        return "Bar{" +
                "barId=" + barId +
                ", barName='" + barName + '\'' +
                ", picName='" + picName + '\'' +
                '}';
    }
}
