package com.skuniv.makeus.dto;

public class Class {
    int classId;
    String classNm;
    int fk_professorId;
    String professorNm;
    int fk_leaderId;
    String leaderNm;

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassNm() {
        return classNm;
    }

    public void setClassNm(String classNm) {
        this.classNm = classNm;
    }

    public int getFk_professorId() {
        return fk_professorId;
    }

    public void setFk_professorId(int fk_professorId) {
        this.fk_professorId = fk_professorId;
    }

    public String getProfessorNm() {
        return professorNm;
    }

    public void setProfessorNm(String professorNm) {
        this.professorNm = professorNm;
    }

    public int getFk_leaderId() {
        return fk_leaderId;
    }

    public void setFk_leaderId(int fk_leaderId) {
        this.fk_leaderId = fk_leaderId;
    }

    public String getLeaderNm() {
        return leaderNm;
    }

    public void setLeaderNm(String leaderNm) {
        this.leaderNm = leaderNm;
    }
}
