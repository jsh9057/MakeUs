package com.skuniv.makeus.controller;

import com.skuniv.makeus.dto.*;
import com.skuniv.makeus.service.BoardManagementService;
import com.skuniv.makeus.service.BoardService;
import com.skuniv.makeus.service.MyClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BoardController {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    BoardService boardService;
    @Autowired
    BoardManagementService boardManagementService;
    @Autowired
    MyClassService myClassService;

    static final String ALL = "A";
    static final String PROFESSOR = "P";
    static final String STUDENT = "S";

    static final String CLASSBOARD = "classBoard";
    static final String COMMONBOARD = "commonBoard";
    static final String GROUPBARD = "groupBoard";

    @RequestMapping("/board/{boardNo}") //게시판 리스트 화면 호출
    public String boardList(@PathVariable int boardNo, Model model, HttpSession session) throws Exception {
        Users user = (Users) session.getAttribute("user");

        Board_Managament board_managament = boardManagementService.getBoard_Management(boardNo);

        String R = board_managament.getR(); // A: 모두 , P: 교수님 , S: 학생
        String C = board_managament.getC();

        model.addAttribute("boardNo", board_managament.getBoardNo());
        model.addAttribute("boardNm", board_managament.getBoardNm());

        //게시판 속성이 수업게시판일 경우
        if (board_managament.getBoardKind().equals(CLASSBOARD)) {
            //로그인 했을 때
            if (user != null) {
                model.addAttribute("classNm", board_managament.getFk_classNm());
                //관리자
                if (user.isOperator()) {
                    model.addAttribute("list", boardService.boardListService(boardNo));
                    model.addAttribute("C", true);
                    model.addAttribute("D", true);
                    return "board/boardlist";
                }

                // 회원으로 접속했을 시 자신의 수업이 맞다면
                List<Myclass> userClassList = myClassService.myclassList(user.getUserId());
                if (boardManagementService.isMyclssBoard(boardNo, userClassList)) {
                    // 읽기 권한 확인 ALL -> 모두 조회가능
                    if (R.equals(ALL)) {
                        model.addAttribute("list", boardService.boardListService(boardNo));

                        // 읽기 권한 확인 STUDENT -> 학생만 조회가능
                    } else if (R.equals(STUDENT)) {
                            // 학생일 경우 모든 게시물 조회가능
                                if (user.isPs() == false) {
                                    model.addAttribute("list", boardService.boardListService(boardNo));
                                    // 교수님일 경우 자신의 글만 조회가능
                                } else if (user.isPs() == true) {
                                    model.addAttribute("list", boardService.myPostService(boardNo, user.getUserId()));
                                }
                            // 읽기 원한 확인 PROFESSOR -> 교수만 조회가능
                    } else if (R.equals(PROFESSOR)) {
                                // 교수님일 경우 모든 게시물 조회가능
                                if (user.isPs() == true) {
                                    model.addAttribute("list", boardService.boardListService(boardNo));
                                    //학생일경우 자신의 글만 조회가능
                                } else if (user.isPs() == false) {
                                    model.addAttribute("list", boardService.myPostService(boardNo, user.getUserId()));
                                }
                    }

                    // 글쓰기 권한
                    if (C.equals(ALL)) {
                        model.addAttribute("C", true);
                        //교수님 일때
                    } else if (C.equals(PROFESSOR)) {
                        if (user.isPs()) {
                            model.addAttribute("C", true);
                        } else {
                            model.addAttribute("C", false);
                        }
                        //학생 일때
                    } else if (C.equals(STUDENT)) {
                        if (user.isPs()) {
                            model.addAttribute("C", false);
                        } else {
                            model.addAttribute("C", true);
                        }
                    }
                    return "board/boardlist";

                } else {
                    model.addAttribute("msg", "해당 게시판에 권한이 없습니다.");
                    model.addAttribute("url", "/home");
                    return "/redirect";
                }

                //로그인 X일 때
            } else if (user == null) {
                model.addAttribute("msg", "로그인이 필요합니다.");
                model.addAttribute("url", "/signin");
                return "redirect";
            }
            // 게시판의 성질이 공통게시판일 경우
        }

        //게시판 속성이 공통게시판일 경우
        else if (board_managament.getBoardKind().equals(COMMONBOARD)) {
            model.addAttribute("list", boardService.boardListService(boardNo));

            // 비회원 시 공통게시판 create 불가능
            if (user == null) {
                model.addAttribute("C", false);
            }
            else if(user != null ){
                // 관리자는 모든권한 가능
                if (user.isOperator()==true) {
                    model.addAttribute("list", boardService.boardListService(boardNo));
                    model.addAttribute("C", true);
                    model.addAttribute("D", true);
                    return "board/boardlist";
                }
                // 관리자가 아닐경우
                else if(user.isOperator()==false){
                    model.addAttribute("list", boardService.boardListService(boardNo));
                    if (C.equals(ALL)) {
                        model.addAttribute("C", true);
                        //교수님 일때
                    } else if (C.equals(PROFESSOR)) {
                        if (user.isPs()) {
                            model.addAttribute("C", true);
                        } else {
                            model.addAttribute("C", false);
                        }
                        //학생 일때
                    } else if (C.equals(STUDENT)) {
                        if (user.isPs()) {
                            model.addAttribute("C", false);
                        } else {
                            model.addAttribute("C", true);
                        }
                    }
                    return "board/boardlist";
                }
            }else{
                return "board/boardlist";
            }
        }
        //게시판 속성이 그룹게시판일 경우
        else if(board_managament.getBoardKind().equals(GROUPBARD)){
        }

        model.addAttribute("list", boardService.boardListService(boardNo));
        return "board/boardlist";
    }


    @Transactional
    @RequestMapping("/detail/{postNo}")
    public String boardDetail(@PathVariable int postNo, Model model, HttpSession session) throws Exception {

        Users user = (Users) session.getAttribute("user");
        boardService.upHitService(postNo);
        Boards board = boardService.boardDetailService(postNo);

        if (board == null) {
            model.addAttribute("msg", "존재하지않는 게시글 입니다.");
            model.addAttribute("url", "/home");
            return "redirect";
        }

        Board_Managament board_managament = boardManagementService.getBoard_Management(board.getFk_boardNo());
        String D = board_managament.getD();

        model.addAttribute("D",false);
        model.addAttribute("U",false);

        // 삭제 권한 부여
        // 게시판의 속성이 공통게시판일 경우
        if(board_managament.getBoardKind().equals(COMMONBOARD)){

            model.addAttribute("R",true);
            if(user != null){
                // 교수님일 때
                if(user.isPs() == true){
                    // 교수님일 때, 게시판 삭제 권한이 모두일 때
                    if(D.equals(ALL)){
                        model.addAttribute("D",true);
                    }
                    // 교수님 일때, 게시판 삭제 권한이 교수님 일 때
                    else if(D.equals(PROFESSOR)){
                        model.addAttribute("D",true);
                    }
                }

                // 학생일 때
                else if(user.isPs() == false){
                    // 학생일 때, 게시판 권한이 모두일 때
                    if(D.equals(ALL)){
                        model.addAttribute("D",true);
                    }
                    // 학생일 때, 게시판 권한이 학생일 때
                    else if(D.equals(STUDENT)){
                        model.addAttribute("D",true);
                    }
                    // 학생일 때, 게시판 권한이 교수님일 때
                }
            }
            else{
                List<Files> file = boardService.fileDetail(postNo);
                if (file != null) {
                    model.addAttribute("files", file);
                }
                model.addAttribute("detail",board);
                return "board/detail";
            }
        }
        // 게시판의 속성이 과목게시판일 경우
        else if(board_managament.getBoardKind().equals(CLASSBOARD)){
            if(user != null) {
                int userId = user.getUserId();
                int classId = board.getFk_classId();
                System.out.println("user Id : "+userId);
                System.out.println("class Id : "+classId);
                // 해당 과목을 수강하는
                System.out.println("isMyclass : "+myClassService.isMyClassService(userId,classId));
                if(myClassService.isMyClassService(userId,classId)==1){
                    System.out.println("교수님 수강함");
                    // 해당과목의 교수님일 경우
                    if(user.isPs()==true){
                        // 교수님일때 ,과목게시판의 삭제 권한이 모두 일 경우
                        System.out.println("교수님 맞음");
                        if(D.equals(ALL)){
                            model.addAttribute("D",true);
                        }
                        // 교수님일때, 과목게시판의 삭제 권한이 교수일 경우
                        else if(D.equals(PROFESSOR)){
                            model.addAttribute("D",true);
                            System.out.println("교수님 삭제권한 획득");
                        }
                    }else if(user.isPs() == false){
                        // 학생일 때, 게시판 삭제 권한이 모두일 때
                        if(D.equals(ALL)){
                            model.addAttribute("D",true);
                        }
                        // 학생일 때, 게시판 삭제 권한이 학생일 때
                        else if(D.equals(STUDENT)){
                            model.addAttribute("D",true);
                        }
                    }
                }
                // 해당 과목을 수강하지 않는경우
                else{

//                    if (user.isOperator() == false) {
//                        model.addAttribute("msg", "해당 과목을 수강하고 있지않습니다.");
//                        model.addAttribute("url", "/home");
//                        return "redirect";
//                    }
                }
            }
            // 과목게시판은 로그인을 해야만 접근 가능
            else if(user == null) {
                model.addAttribute("msg","로그인이 필요합니다.");
                model.addAttribute("url","/signin");
                return "redirect";
            }
        }
        // 게시판의 속성이 그룹게시판일 경우
        else if(board_managament.getBoardKind().equals(GROUPBARD)){
        }

        // 작성자 본인일 경우 OR 관리자일 경우
        if (user.isOperator()) {
            model.addAttribute("D", true);
        }
        if(board.getFk_postUserId() == user.getUserId()){
            model.addAttribute("D",true);
            model.addAttribute("U",true);
        }

        model.addAttribute("detail",board);
        List<Files> file = boardService.fileDetail(postNo);
        if (file != null) {
            model.addAttribute("files", file);
        }
        return "board/detail";
    }

    @Transactional
    @RequestMapping("/write/{boardNo}") //게시글 작성폼 호출
    public String boardInsertForm(@PathVariable int boardNo, Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("boardNo", boardNo);
            return "board/write";
        } else {
            model.addAttribute("msg", "로그인이 필요합니다.");
            model.addAttribute("url", "/signin");
            return "redirect";
        }
    }

    @Transactional
    @RequestMapping("/writedo")
    public String boardInsertProc(Model model, HttpSession session,
                                  @RequestParam(value = "boardNo", required = true) int boardNo,
                                  @RequestParam(value = "title", required = true) String title,
                                  @RequestParam(value = "content", required = true) String content,
                                  @RequestPart MultipartFile[] files,
                                  @RequestPart MultipartFile[] imgfiles) throws Exception {
        Users user = (Users) session.getAttribute("user");
        Board_Managament board_managament = boardManagementService.getBoard_Management(boardNo);
        String C = board_managament.getC();
        Boolean permission = false;
        System.out.println(board_managament.getFk_classId());


        if (C.equals(STUDENT)) {
            if (!user.isPs()) {
                permission = true;
            }
        } else if (C.equals(PROFESSOR)) {
            if (user.isPs()) {
                permission = true;
            }
        } else {
            permission = true;
        }

        if (user.isOperator()) {
            permission = true;
        }

        if (permission) {
            Boards board = new Boards();

            board.setPostNm(user.getName());
            board.setPostTitle(title);
            board.setPostContents(content);
            board.setFk_postNick(user.getNick());
            board.setFk_postUserId(user.getUserId());
            board.setFk_boardNo(boardNo);
            board.setFk_classId(board_managament.getFk_classId());

            if (!files[0].isEmpty()) {
                board.setFile(true);
            }
            if (!imgfiles[0].isEmpty()) {
                board.setImg(true);
            }
            boardService.boardInsertService(board);
            boardService.fileInsert(files, imgfiles, board.getPostNo());
            return "redirect:/board/" + boardNo;
        } else {
            model.addAttribute("msg", "권한이 없습니다.");
            model.addAttribute("url", "/home");
            return "/redirect";
        }
    }


    @RequestMapping("/update/{postNo}") //게시글 수정폼 호출
    public String boardUpdateForm(@PathVariable int postNo, Model model, HttpSession session) throws Exception {
        Users user = (Users) session.getAttribute("user");
        Boards board = boardService.boardDetailService(postNo);
        if(board !=null)
        {
            if (user != null) {
                if (board.getFk_postUserId() == user.getUserId()) {
                    model.addAttribute("detail", boardService.boardDetailService(postNo));
                    model.addAttribute("files", boardService.fileDetail(postNo));
                    return "board/update";
                } else {
                    model.addAttribute("msg", "권한이없습니다.");
                    model.addAttribute("url", "/home");
                    return "/redirect";
                }
            } else {
                model.addAttribute("msg", "로그인이 필요합니다.");
                model.addAttribute("url", "/signin");
                return "/redirect";
            }
        }
        else {
            model.addAttribute("msg","존재하지않는 게시물입니다.");
            model.addAttribute("url","/home");
            return  "/redirect";
        }
    }

    @Transactional
    @RequestMapping("/updatedo")
    public String boardUpdatedo(@RequestParam(value = "title", required = true) String title,
                                @RequestParam(value = "content", required = true) String content,
                                @RequestPart MultipartFile[] files,
                                @RequestPart MultipartFile[] imgfiles,
                                @RequestParam(value = "postNo") int postNo,
                                @RequestParam(value = "fileDeletes", required = false) int[] delFiles,
                                HttpSession session) throws Exception {

        Users user = (Users) session.getAttribute("user");
        Boards updateBoard = new Boards();

        updateBoard.setPostNo(postNo);
        updateBoard.setPostTitle(title);
        updateBoard.setPostContents(content);

        if(delFiles!=null){
            for (int fileNo : delFiles) {
                boardService.fileDeleteService(fileNo);
            }
        }
        boardService.fileInsert(files, imgfiles, postNo);

        updateBoard = boardService.isFileCheckService(updateBoard);
        boardService.boardUpdateService(updateBoard);

        return "redirect:/detail/" + postNo;
    }

    @Transactional
    @RequestMapping("/delete/{boardNo}/{postNo}")
    public String boardDelete(@PathVariable int postNo, @PathVariable int boardNo) throws Exception {
        boardService.boardDeleteService(postNo);

        return "redirect:/board/" + boardNo;
    }


}