package com.skuniv.makeus.controller;

import com.skuniv.makeus.dto.Boards;
import com.skuniv.makeus.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BoardController {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    BoardService boardService;

    @RequestMapping("/board/{boardNo}") //게시판 리스트 화면 호출
    public String boardList(@PathVariable int boardNo, Model model) throws Exception{
        model.addAttribute("list", boardService.boardListService(boardNo));
        //System.out.println("list1 :"+boardService.boardListService());
        return "board/boardlist"; //생성할 jsp
    }

    @RequestMapping("/detail/{postNo}")
    private String boardDetail(@PathVariable int postNo, Model model) throws Exception{
        model.addAttribute("detail", boardService.boardDetailService(postNo));
        return "board/detail";
    }
    
    @RequestMapping("/write") //게시글 작성폼 호출
    private String boardInsertForm(){
        return "board/write";
    }

    @RequestMapping("/writepost")
    private int boardInsertProc(HttpServletRequest request) throws Exception{
        Boards boards = (Boards) request.getParameterMap();
        return boardService.boardInsertService(boards);
    }

//    @RequestMapping("/update/{bno}") //게시글 수정폼 호출
//    private String boardUpdateForm(@PathVariable int bno, Model model) throws Exception{
//        model.addAttribute("detail", boardService.boardDetailService(bno));
//        return "update";
//    }
//
//    @RequestMapping("/updateProc")
//    private int boardUpdateProc(HttpServletRequest request) throws Exception{
//        Boards boards = (Boards) request.getParameterMap();
//        return boardService.boardUpdateService(boards);
//    }
//
//    @RequestMapping("/delete/{bno}")
//    private String boardDelete(@PathVariable int bno) throws Exception{
//        boardService.boardDeleteService(bno);
//        return "redirect:/list";
//    }
}