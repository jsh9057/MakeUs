package com.skuniv.makeus.controller;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skuniv.makeus.dto.Users;
import com.skuniv.makeus.service.SigninService;
import com.skuniv.makeus.service.SignupService;

@Controller
public class SignController {
	@Autowired
	SigninService signService;
	@Autowired
	SignupService signupService;
	
	@RequestMapping("/signin")
	public String signin(Model model) {
		return "sign/signin";
	}
	
	@RequestMapping("/signinpost")
	public String signinpost(Model model , HttpSession session,
			@RequestParam(value="userId", required = true)int userId,
			@RequestParam(value="password", required = true)String password) {
	
		
		
		if(signService.signin(userId, password)!=null) {
			Users user = signService.signin(userId, password); // users객체 호출
			session.setAttribute("nick", user.getNick()); // nick setting
			session.setAttribute("userId", userId);//userId setting
			
			return "home";
		}
		
		return "sign/signin";
	}
	
	@RequestMapping("/signup")
	public String signup(Model model) {
		return "sign/signup";
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
