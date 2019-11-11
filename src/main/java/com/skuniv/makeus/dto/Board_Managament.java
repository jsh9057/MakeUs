package com.skuniv.makeus.dto;


public class Board_Managament {
    int boardNo;
    String boardNm;

    String C;
    String R;
    String U;
    String D;
    int fk_parent;
    int fk_classId;
    String fk_classNm;
    boolean isCategory;
    String boardKind;
    int boardIndex;

    public int getBoardIndex() {
        return boardIndex;
    }

    public void setBoardIndex(int boardIndex) {
        this.boardIndex = boardIndex;
    }

    public Board_Managament() {
    }

    public Board_Managament(String kind) {
        if (kind.equals("proBoard")) {
            this.boardNm = "교수님 게시판";
            this.C = "P";
            this.R = "A";
            this.D = "P";
            this.boardKind = "classBoard";
        } else if (kind.equals("stuBoard")) {
            this.boardNm = "학생 게시판";
            this.C = "A";
            this.R = "A";
            this.D = "P";
            this.boardKind = "classBoard";
        } else if (kind.equals("submitBoard")) {
            this.boardNm = "제출 게시판";
            this.C = "S";
            this.R = "P";
            this.D = "P";
            this.boardKind = "classBoard";
        }
    }

    public String getC() {
        return C;
    }

    public void setC(String c) {
        C = c;
    }

    public String getR() {
        return R;
    }

    public void setR(String r) {
        R = r;
    }

    public String getU() {
        return U;
    }

    public void setU(String u) {
        U = u;
    }

    public String getD() {
        return D;
    }

    public void setD(String d) {
        D = d;
    }

    public int getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(int boardNo) {
        this.boardNo = boardNo;
    }

    public String getBoardNm() {
        return boardNm;
    }

    public void setBoardNm(String boardNm) {
        this.boardNm = boardNm;
    }


    public int getFk_parent() {
        return fk_parent;
    }

    public void setFk_parent(int fk_parent) {
        this.fk_parent = fk_parent;
    }

    public int getFk_classId() {
        return fk_classId;
    }

    public void setFk_classId(int fk_classId) {
        this.fk_classId = fk_classId;
    }

    public String getFk_classNm() {
        return fk_classNm;
    }

    public void setFk_classNm(String fk_classNm) {
        this.fk_classNm = fk_classNm;
    }

    public boolean isCategory() {
        return isCategory;
    }

    public void setCategory(boolean category) {
        isCategory = category;
    }

    public String getBoardKind() {
        return boardKind;
    }

    public void setBoardKind(String boardKind) {
        this.boardKind = boardKind;
    }
}
