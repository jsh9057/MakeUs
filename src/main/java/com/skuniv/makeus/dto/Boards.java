package com.skuniv.makeus.dto;

import java.time.LocalDateTime;

public class Boards {
	int postNo;
	String postNm;
	String postTitle;
	String postContents;
	LocalDateTime postDate;
	int hits;
	String fk_postNick;
	int fk_postUserId;
	int fk_boardNo;
	int fk_classId;
	int fk_groupId;
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostNm() {
		return postNm;
	}
	public void setPostNm(String postNm) {
		this.postNm = postNm;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContents() {
		return postContents;
	}
	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}
	public LocalDateTime getPostDate() {
		return postDate;
	}
	public void setPostDate(LocalDateTime postDate) {
		this.postDate = postDate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getFk_postNick() {
		return fk_postNick;
	}
	public void setFk_postNick(String fk_postNick) {
		this.fk_postNick = fk_postNick;
	}
	public int getFk_postUserId() {
		return fk_postUserId;
	}
	public void setFk_postUserId(int fk_postUserId) {
		this.fk_postUserId = fk_postUserId;
	}
	public int getFk_boardNo() {
		return fk_boardNo;
	}
	public void setFk_boardNo(int fk_boardNo) {
		this.fk_boardNo = fk_boardNo;
	}
	public int getFk_classId() {
		return fk_classId;
	}
	public void setFk_classId(int fk_classId) {
		this.fk_classId = fk_classId;
	}
	public int getFk_groupId() {
		return fk_groupId;
	}
	public void setFk_groupId(int fk_groupId) {
		this.fk_groupId = fk_groupId;
	}
}
