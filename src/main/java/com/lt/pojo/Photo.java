package com.lt.pojo;

public class Photo {
    private String id;
    private String dirId;
    private String time;
    private String photoAddr;
    private String photoName;
    private double photoSize;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDirId() {
        return dirId;
    }

    public void setDirId(String dirId) {
        this.dirId = dirId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPhotoAddr() {
        return photoAddr;
    }

    public void setPhotoAddr(String photoAddr) {
        this.photoAddr = photoAddr;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public double getPhotoSize() {
        return photoSize;
    }

    public void setPhotoSize(double photoSize) {
        this.photoSize = photoSize;
    }
}
