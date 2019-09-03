package com.lt.pojo;

import java.io.Serializable;

public class Picdir implements Serializable {
    private String id;
    private String picName;
    private String time;
    private String picDesc;
    private String picAddress;
    private String userId;
    private String picCover;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPicName() {
        return picName;
    }

    public void setPicName(String picName) {
        this.picName = picName;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPicDesc() {
        return picDesc;
    }

    public void setPicDesc(String picDesc) {
        this.picDesc = picDesc;
    }

    public String getPicAddress() {
        return picAddress;
    }

    public void setPicAddress(String picAddress) {
        this.picAddress = picAddress;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPicCover() {
        return picCover;
    }

    public void setPicCover(String picCover) {
        this.picCover = picCover;
    }
}
