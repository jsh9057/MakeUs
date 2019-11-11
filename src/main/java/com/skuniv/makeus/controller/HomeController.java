package com.skuniv.makeus.controller;

import javax.servlet.http.HttpSession;

import com.skuniv.makeus.dto.Boards;
import com.skuniv.makeus.dto.Users;
import com.skuniv.makeus.service.BoardManagementService;
import com.skuniv.makeus.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;

@Controller
public class HomeController {

	@Autowired
	BoardService boardService ;
	@Autowired
	BoardManagementService boardManagementService;

	final static int NOTICECOUNT = 6;
	final static int NOTICENUMBOARD = 11;
	final static String NOTICENM = "공지사항";

	final static int NOTICECOUNT2 = 5;
	final static int NOTICENUMBOARD2 = 12;
	final static  String NOTICENM2 = "자유게시판";

	@RequestMapping("/home")
	public String home(Model model, HttpSession session) throws Exception {
		Users user = (Users)session.getAttribute("user");
		if (user !=null){
			if(user.isPs()==true) {
				System.out.println("교수님");
			}else if(user.isPs()==false){
				System.out.println("학생");
			}
		}

		List<Boards> boardsList = boardService.boardListService(NOTICENUMBOARD);
		if(boardsList.size()<NOTICECOUNT){
			model.addAttribute("list",boardsList);
		}else{
			boardsList = boardsList.subList(0,NOTICECOUNT);
			model.addAttribute("list",boardsList);
		}
		model.addAttribute("boardNm",NOTICENM);

		List<Boards> boardsList2 = boardService.boardListService(NOTICENUMBOARD2);
		if(boardsList.size()<NOTICECOUNT2){
			model.addAttribute("list2",boardsList2);
		}else{
			boardsList = boardsList.subList(0,NOTICECOUNT2);
			model.addAttribute("list2",boardsList2);
		}
		model.addAttribute("boardNm2",NOTICENM2);
		return "home";	
	}
	@RequestMapping("/header")
	public String header(Model model, HttpSession session) {

		return "header";	
	}
	
	@RequestMapping("/menu")
	public String menu(Model model, HttpSession session) {

		return "menu";
	}

	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session) {

		session.removeAttribute("user");
		return "redirect:/home";
	}


}
