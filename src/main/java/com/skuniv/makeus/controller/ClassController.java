package com.skuniv.makeus.controller;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClassController {
	@RequestMapping("/createclass")
	public String createclass(Model model, HttpSession session) {
		return "class/createclass";
	}
	@RequestMapping("/classlist")
	public String classlist(Model model, HttpSession session) {
		return "class/classlist";
	}
}
