package com.skuniv.makeus.controller;

import java.util.List;

import com.skuniv.makeus.dto.Myclass;
import com.skuniv.makeus.dto.Users;
import com.skuniv.makeus.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skuniv.makeus.dto.Board_Managament;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/rest")
public class MenuRestController {

    @Autowired
    BoardManagementService boardManagementService;
    @Autowired
    MyClassService myClassService;
    @Autowired
    ClassService classService;

    List<Board_Managament> boardList;
    List<Board_Managament> gradeList;
    List<Board_Managament> commonList;
    List<Board_Managament> otherList;
    List<Myclass> myclassList;
    Users user;

    String success = " {\"result\":\"success\"} "; // 성공시 string 반환 값
    String fail = " {\"result\":\"fail\"} ";
    String empty = " {\"result\":\"empty\"} ";

    @RequestMapping("/grademenu")
    @PostMapping
    public List<Board_Managament> grademenu() {
        gradeList = boardManagementService.loadGradeList();
        if (gradeList != null) {
            return gradeList;
        }
        return null;
    }

    @RequestMapping("/commonmenu")
    @PostMapping
    public List<Board_Managament> commonMenu() {
        commonList = boardManagementService.loadCommonMenuList();
        if (commonList != null) {
            return commonList;
        }
        System.out.println("commonlist load fail");
        return null;
    }

    @RequestMapping("/classmenu")
    @PostMapping
    public List<Board_Managament> classmenu(HttpSession session) throws Exception {

        user = (Users) session.getAttribute("user");
        if(user!=null) {
            if (user.isPs() == false) {
                boardList = boardManagementService.loadClassMenuList();
                return boardList;
            }else if(user.isPs()==true){
                boardList = boardManagementService.loadClassMenuList();
                return boardList;
            }
        }
        return null;
    }

    @RequestMapping("/myclass")
    @PostMapping
    public List<Myclass> myclass(HttpSession session) throws Exception {
        user = (Users) session.getAttribute("user");
        if(user != null) {
            if(user.isOperator()){
                System.out.println("관리자!");
                myclassList = myClassService.operatorMyClass();
                return myclassList;
            }
            if (user.isPs() == false) {
                System.out.println("학생!");
                myclassList = myClassService.myclassList(user.getUserId());
                return myclassList;
            }else if(user.isPs() == true){
                System.out.println("교수님!");
                myclassList = myClassService.myclassList(user.getUserId());
                return myclassList;
            }
            return null;
        }
        return null;
    }

//    @RequestMapping("/classmenuP")
//    @PostMapping
//    public List<Class> classmenuP(HttpSession session) throws Exception {
//        user = (Users) session.getAttribute("user");
//        if (user.isPs()) {
//            classList = classService.classList(user.getUserId());
//            return classList;
//        }
//        return null;
//    }

    // 현재 삭제한 기능
    @RequestMapping("/othermenu")
    @PostMapping
    public List<Board_Managament> otherMenu() {
        otherList = boardManagementService.loadOtherMenuList();
        if (otherList != null) {
            return otherList;
        }
        System.out.println("otherlist load fail");
        return null;
    }

}
