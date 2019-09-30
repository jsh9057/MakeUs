package com.skuniv.makeus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skuniv.makeus.service.SigninService;
import com.skuniv.makeus.service.SignupService;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@RestController
@RequestMapping("/rest")
public class SignRestController {
	@Autowired
	SigninService signinService;
	@Autowired
	SignupService signupService;
	
	String success = " {\"result\":\"success\"} "; // 성공시 string 반환 값
	String fail = " {\"result\":\"fail\"} ";
	
	@RequestMapping("/signin")
	@PostMapping
	public String getSigninCheck(@RequestBody String signData) {
		System.out.println("signData : " + signData);
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		int userId;
		String password;
		
		try {
			jsonObj = (JSONObject) jsonParser.parse(signData);
			userId = Integer.parseInt((String) jsonObj.get("userId"));
			password = (String) jsonObj.get("password");
			
			if (signinService.signin(userId, password) != null) {
				return success;
			}
			return fail;
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fail;
	}
	
	@RequestMapping("/signup_nick")
	@PostMapping
	public String nickCheck(@RequestBody String nickjson) {
		System.out.println("nickjson: "+nickjson);
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		String nick;
		try {
			jsonObj = (JSONObject) jsonParser.parse(nickjson);
			nick = (String) jsonObj.get("nick");
			if(signupService.getUsersbyNick(nick) != null) {
				return fail;
			}
			return success;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fail;
	}
	
	@RequestMapping("/signup_userId")
	@PostMapping
	public String stu_noCheck(@RequestBody String stuNojson) {
		System.out.println("nickjson: "+stuNojson);
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		int userNo;
		try {
			jsonObj = (JSONObject) jsonParser.parse(stuNojson);
			userNo = Integer.parseInt((String) jsonObj.get("userId"));
			if(signupService.getUsersbyUserId(userNo)!= null) {
				return fail;
			}
			return success;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fail;
	}

}
