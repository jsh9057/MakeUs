package com.skuniv.makeus.dto;

import java.time.LocalDateTime;

public class Files {
    int fileNo;
    int fk_postNo;
    String fileNm;
    String fileOriNm;
    String path;
    String size;
    LocalDateTime date;
    boolean img;
    boolean file;

    public boolean isFile() {
        return file;
    }

    public void setFile(boolean file) {
        this.file = file;
    }

    public boolean isImg() {
        return img;
    }

    public void setImg(boolean img) {
        this.img = img;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public int getFileNo() {
        return fileNo;
    }

    public void setFileNo(int fileNo) {
        this.fileNo = fileNo;
    }

    public int getFk_postNo() {
        return fk_postNo;
    }

    public void setFk_postNo(int fk_postNo) {
        this.fk_postNo = fk_postNo;
    }

    public String getFileNm() {
        return fileNm;
    }

    public void setFileNm(String fileNm) {
        this.fileNm = fileNm;
    }

    public String getFileOriNm() {
        return fileOriNm;
    }

    public void setFileOriNm(String fileOriNm) {
        this.fileOriNm = fileOriNm;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }


}
