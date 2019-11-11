package com.skuniv.makeus.service;

import com.skuniv.makeus.dao.CommentMapper;
import com.skuniv.makeus.dto.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    CommentMapper commentMapper;

    public int addCommentService(Comment comment){
        return commentMapper.addComment(comment);
    }

    public List<Comment> getCommentListService(int postNo){
        return commentMapper.getCommentList(postNo);
    }
    public void deleteCommentService(int commentNo){
        commentMapper.deleteComment(commentNo);
    }
    public Comment getCommentByNoService(int commentNo){
        return commentMapper.getCommentByNo(commentNo);
    }

}
