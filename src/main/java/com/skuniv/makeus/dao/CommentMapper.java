package com.skuniv.makeus.dao;

import com.skuniv.makeus.dto.Comment;

import java.util.List;

public interface CommentMapper {
    public int addComment(Comment comment);
    public List<Comment> getCommentList (int PostNo);
    public void deleteComment(int commentNo);
    public Comment getCommentByNo (int commentNo);
}
