package com.skuniv.makeus.controller;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/home")
	public String home(Model model, HttpSession session) {
		System.out.println("home.jsp");
		return "home";	
	}
	@RequestMapping("/header")
	public String header(Model model, HttpSession session) {
		System.out.println("header.jsp");
		return "header";	
	}
	
	@RequestMapping("/menu")
	public String menu(Model model, HttpSession session) {
		System.out.println("menu.jsp");
		return "menu";	
	}
	
}
