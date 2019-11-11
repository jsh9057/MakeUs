package com.skuniv.makeus.controller;


import com.skuniv.makeus.dto.Comment;
import com.skuniv.makeus.dto.Users;
import com.skuniv.makeus.service.BoardManagementService;
import com.skuniv.makeus.service.BoardService;
import com.skuniv.makeus.service.CommentService;
import org.apache.catalina.User;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/rest")
public class CommentRestContorller {

    @Autowired
    CommentService commentService;
    @Autowired
    BoardManagementService boardManagementService;
    @Autowired
    BoardService boardService;

    static final String ALL = "A";
    static final String PROFESSOR = "P";
    static final String STUDENT = "S";

    @RequestMapping("/addComment")
    @ResponseBody
    public String restAddComment(HttpSession session, String content, int postNo, int boardNo) {
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            String C = boardManagementService.getBoard_Management(boardNo).getC();
            Comment comment = new Comment();
            comment.setCommentContents(content);
            comment.setFk_commentNick(user.getNick());
            comment.setFk_commentPostNo(postNo);

            if (C.equals(ALL)) {
                boardService.upCommentCountService(postNo, 1);
                commentService.addCommentService(comment);
                return "success";
            } else if (C.equals(STUDENT)) {
                if (user.isPs() == true) {
                    return "fail";
                } else if (user.isPs() == false) {
                    boardService.upCommentCountService(postNo, 1);
                    commentService.addCommentService(comment);
                    return "success";
                }
            } else if (C.equals(PROFESSOR)) {
                if (user.isPs() == true) {
                    boardService.upCommentCountService(postNo, 1);
                    commentService.addCommentService(comment);
                    return "success";
                } else if (user.isPs() == false) {
                    return "fail";
                }
            }
            return "fail";
        } else {

            return "fail/login";
        }
    }

    @RequestMapping(value = "/commentList", produces = "application/json; charset=utf8")
    @ResponseBody
    public ResponseEntity restCommentLsit(HttpSession session, String postNo) {
        Users user = (Users) session.getAttribute("user");
        HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        System.out.println("postNo : " + postNo);
        List<Comment> comments = commentService.getCommentListService(Integer.parseInt(postNo));
        if (comments.size() > 0) {
            for (int i = 0; i < comments.size(); i++) {
                HashMap hm = new HashMap();
                if (user!=null && comments.get(i).getFk_commentNick().equals(user.getNick())) {
                    hm.put("commentNo", comments.get(i).getCommentNo());
                    hm.put("me", true);
                }
                hm.put("comment", comments.get(i).getCommentContents());
                hm.put("writer", comments.get(i).getFk_commentNick());
                hm.put("date", comments.get(i).getCommentDate());
                hmlist.add(hm);
            }
        }
        JSONArray jsonArray = new JSONArray(hmlist);
        return new ResponseEntity(jsonArray.toString(), responseHeaders, HttpStatus.CREATED);
    }

    @RequestMapping("/commentDelete")
    @ResponseBody
    public String restCommentDelete(HttpSession session, int commentNo) {
        System.out.println("삭제"+commentNo);
        Users user = (Users) session.getAttribute("user");
        Comment comment = commentService.getCommentByNoService(commentNo);
        String commentUser = comment.getFk_commentNick();
        if(comment==null){
            return "fail";
        }
        if (user != null) {
            if (commentUser.equals(user.getNick())) {
                commentService.deleteCommentService(commentNo);
                boardService.upCommentCountService(comment.getFk_commentPostNo(), -1);
                return "success";
            } else {
                return "fail";
            }
        }else{
            return "fail";
        }
    }
}
