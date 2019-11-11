package com.skuniv.makeus.controller;

import javax.servlet.http.HttpSession;

import com.skuniv.makeus.dto.Myclass;
import com.skuniv.makeus.service.BoardManagementService;
import com.skuniv.makeus.service.MyClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skuniv.makeus.dto.Users;
import com.skuniv.makeus.service.SigninService;
import com.skuniv.makeus.service.SignupService;

import java.util.List;

@Controller
public class SignController {
	@Autowired
	SigninService signService;
	@Autowired
	SignupService signupService;
	@Autowired
	MyClassService myClassService;
	@Autowired
	BoardManagementService boardManagementService;


	@RequestMapping("/signin")
	public String signin(Model model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user == null){
			return "sign/signin";
		}
		else {
			model.addAttribute("msg","이미 로그인 되어있습니다.");
			model.addAttribute("url","/home");
			return "redirect";
		}
	}
	
	@RequestMapping("/signinpost")
	public String signinpost(Model model , HttpSession session,
			@RequestParam(value="userId", required = true)int userId,
			@RequestParam(value="password", required = true)String password) {

		Users user = signService.signin(userId, password); // users객체 호출


		if(user!=null) {
			List <Myclass> myclassList = myClassService.myclassList(user.getUserId());
			session.setAttribute("user", user); // user
			System.out.println("세션생성!!");
			return "redirect:/home";
		}
		
		return "sign/signin";
	}
	
	@RequestMapping("/signup")
	public String signup(Model model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user == null){
			return "sign/signup";
		}
		else {
			model.addAttribute("msg","로그아웃 후, 회원가입을 해 주십시오.");
			model.addAttribute("url","/home");
			return "redirect";
		}
	}


	@RequestMapping("/signuppost")
	public String signuppost(Model model,
			@RequestParam(value="stuNo", required = true)int userId,
			@RequestParam(value="nick", required = true)String nick,
			@RequestParam(value="password", required = true)String password,
			@RequestParam(value="name", required = true)String name,
			@RequestParam(value="grade", required = true)int grade,
			@RequestParam(value="phone", required = true)String phone,
			@RequestParam(value="email", required = true)String email
			) {


		Users user = new Users();
		user.setUserId(userId);
		user.setNick(nick);
		user.setPassword(password);
		user.setName(name);
		user.setGrade(grade);
		user.setPhone(phone);
		user.setEmail(email);
		System.out.println("siguppost");
		signupService.registUser(user);
		
		return "sign/signin";
	}
	

}
