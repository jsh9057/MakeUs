package com.skuniv.makeus.controller;

import com.skuniv.makeus.dto.Board_Managament;
import com.skuniv.makeus.dto.Users;
import com.skuniv.makeus.service.BoardManagementService;
import com.skuniv.makeus.service.SignupService;
import com.skuniv.makeus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class EditController {

    @Autowired
    BoardManagementService boardManagementService;
    @Autowired
    UserService userService;
    @Autowired
    SignupService signupService;

    @RequestMapping("/edit")
    public String edit(Model model, HttpSession session){
        for (Board_Managament b : boardManagementService.loadCommonMenuList()){
            System.out.println(b.getBoardNm());
        }
        model.addAttribute("commonList",boardManagementService.loadCommonMenuList());
        return "edit/edit";
    }

    @RequestMapping("/editdo")
    public String editDo(Model model, HttpSession session,
                         @RequestParam(value = "boardNm", required = true) String boardNm,
                         @RequestParam(value = "isCategory", required = true)Boolean isCategory,
                         @RequestParam(value = "r", required = false) String R,
                         @RequestParam(value = "c",required = false) String C,
                         @RequestParam(value = "d",required = false) String D,
                         @RequestParam(value = "categoryNo",required = false) String categoryNo){
        System.out.println(boardNm);
        Users user = (Users) session.getAttribute("user");
        if(user==null){
            model.addAttribute("msg","관리자만 접근 가능합니다.");
            model.addAttribute("url","/home");
            return "redirect";
        }
        if(user.isOperator()) {
            Board_Managament board_managament = new Board_Managament();
            board_managament.setBoardNm(boardNm);
            board_managament.setCategory(true);
            board_managament.setBoardKind("commonBoard");
            System.out.println(isCategory);
            if (isCategory==false) {
                board_managament.setCategory(false);
                int c = Integer.parseInt(categoryNo);
                if(c != 0){
                    board_managament.setFk_parent(c);
                }
                board_managament.setC(C);
                board_managament.setR(R);
                board_managament.setD(D);
            }
            boardManagementService.insertCommonBoardService(board_managament);
            return "redirect:/home";
        }else {
            model.addAttribute("msg","관리자만 접근 가능합니다.");
            model.addAttribute("url","/home");
            return "redirect";
        }
    }

    @RequestMapping("useredit")
    public String userEdit(Model model, HttpSession session){

        model.addAttribute("list",userService.allUserListService());
        return "edit/useredit";
    }

    @RequestMapping("user/{userId}")
    public String userDetail(Model model, HttpSession session, @PathVariable int userId){
        Users user = (Users) session.getAttribute("user");

        if(user != null){
            if(user.isOperator()){
                model.addAttribute("detail", signupService.getUsersbyUserId(userId));
                return "edit/userdetail";
            }
            else {
                return "redirect:/home";
            }
        }else{
            return "redirect:/signin";
        }
    }

    @RequestMapping("usereditdo/{userId}")
    public String userEditDo(HttpSession session, @PathVariable int userId){
        Users user = (Users) session.getAttribute("user");
        if(user != null){
            if(user.isOperator()){
                Users detail = signupService.getUsersbyUserId(userId);
                if(detail.isPs()==true){
                    detail.setPs(false);
                }else{
                    detail.setPs(true);

                }
                userService.updatePsSerivce(detail);
                return "redirect:/user/"+detail.getUserId();
            }else{
                return "redirect:/home";
            }
        }else{
            return "redirect:/signin";
        }
    }
}
