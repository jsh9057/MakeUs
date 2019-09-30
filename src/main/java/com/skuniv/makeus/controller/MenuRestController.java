package com.skuniv.makeus.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skuniv.makeus.dto.Board_Managament;
import com.skuniv.makeus.service.BoardManagementService;
import com.skuniv.makeus.service.SigninService;
import com.skuniv.makeus.service.SignupService;

@RestController
@RequestMapping("/rest")
public class MenuRestController {
	
	@Autowired
	BoardManagementService boardManagementService;
	
	List<Board_Managament> gradeList;
	List<Board_Managament> commonList;
	List<Board_Managament> otherList;
	
	String success = " {\"result\":\"success\"} "; // 성공시 string 반환 값
	String fail = " {\"result\":\"fail\"} ";
	
	@RequestMapping("/grademenu")
	@PostMapping
	public List<Board_Managament> gradeMenu() {
		gradeList = boardManagementService.loadGradeMenuList();
			if (gradeList !=null) {
				return gradeList;
			}
		System.out.println("gradelist load fail");
		return null;
	}
	
	@RequestMapping("/commonmenu")
	@PostMapping
	public List<Board_Managament> commonMenu(){
		commonList = boardManagementService.loadCommonMenuList();
		if(commonList != null) {
			return commonList;
		}
		System.out.println("commonlist load fail");
		return null;
	}
	// 현재 삭제한 기능
	@RequestMapping("/othermenu")
	@PostMapping
	public List<Board_Managament> otherMenu(){
		otherList = boardManagementService.loadOtherMenuList();
		if(otherList != null) {
			return otherList;
		}
		System.out.println("otherlist load fail");
		return null;
	}
	//
}
