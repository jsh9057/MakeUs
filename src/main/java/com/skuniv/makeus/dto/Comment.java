package com.skuniv.makeus.dto;

import java.time.LocalDateTime;

public class Comment {
    int commentNo;
    int fk_commentPostNo;
    String fk_commentNick;
    LocalDateTime commentDate;
    String commentContents;

    public int getCommentNo() {
        return commentNo;
    }

    public void setCommentNo(int commentNo) {
        this.commentNo = commentNo;
    }

    public int getFk_commentPostNo() {
        return fk_commentPostNo;
    }

    public void setFk_commentPostNo(int fk_commentPostNo) {
        this.fk_commentPostNo = fk_commentPostNo;
    }

    public String getFk_commentNick() {
        return fk_commentNick;
    }

    public void setFk_commentNick(String fk_commentNick) {
        this.fk_commentNick = fk_commentNick;
    }

    public LocalDateTime getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(LocalDateTime commentDate) {
        this.commentDate = commentDate;
    }

    public String getCommentContents() {
        return commentContents;
    }

    public void setCommentContents(String commentContents) {
        this.commentContents = commentContents;
    }
}
