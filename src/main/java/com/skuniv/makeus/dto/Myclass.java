package com.skuniv.makeus.dto;

public class Myclass {
    int myclassId;
    int fk_userId;
    int fk_classId;
    String myclassNm;
    int fk_professorId;
    boolean confirm;
    String name;

    public Myclass (int fk_userId,String name,Class tClass){
        this.name = name;
        this.fk_userId = fk_userId;
        this.fk_classId = tClass.getClassId();
        this.myclassNm = tClass.getClassNm();
        this.fk_professorId = tClass.getFk_professorId();
    }
    public Myclass() {}

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public boolean isConfirm() { return confirm; }
    public void setConfirm(boolean confirm) { this.confirm = confirm; }
    public int getFk_professorId() { return fk_professorId; }
    public void setFk_professorId(int fk_professorId) {
        this.fk_professorId = fk_professorId;
    }
    public int getMyclassId() {
        return myclassId;
    }
    public void setMyclassId(int myclassId) {
        this.myclassId = myclassId;
    }
    public int getFk_userId() {
        return fk_userId;
    }
    public void setFk_userId(int fk_userId) {
        this.fk_userId = fk_userId;
    }
    public int getFk_classId() {
        return fk_classId;
    }
    public void setFk_classId(int fk_classId) {
        this.fk_classId = fk_classId;
    }
    public String getMyclassNm() {
        return myclassNm;
    }
    public void setMyclassNm(String myclassNm) {
        this.myclassNm = myclassNm;
    }
}
