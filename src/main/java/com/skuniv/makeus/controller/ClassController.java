package com.skuniv.makeus.controller;

import javax.servlet.http.HttpSession;

import com.skuniv.makeus.service.UserService;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import com.skuniv.makeus.dto.Board_Managament;
import com.skuniv.makeus.dto.Class;
import com.skuniv.makeus.dto.Myclass;
import com.skuniv.makeus.dto.Users;
import com.skuniv.makeus.service.BoardManagementService;
import com.skuniv.makeus.service.ClassService;
import com.skuniv.makeus.service.MyClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ClassController {
	@Autowired
	ClassService classService;
	@Autowired
	MyClassService myClassService;
	@Autowired
	BoardManagementService boardManagementService;
	@Autowired
	UserService userService;

	@RequestMapping("/createclass")
	public String createclass(Model model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");

		if (user == null){
			model.addAttribute("msg","로그인이 필요합니다.");
			model.addAttribute("url","/signin");
			return "redirect";
		}
		if(user.isOperator()){
			return "class/createclass";
		}else{
			if(user.isPs()){
				return "class/createclass";
			}
			else{
				model.addAttribute("msg","권한이 없습니다.");
				model.addAttribute("url", "/home");
				return "redirect";
			}
		}
	}
	@RequestMapping("/classlist")
	public String classlist(Model model, HttpSession session) throws Exception {
		Users user = (Users) session.getAttribute("user");
		List<Class> classList;
		if(user == null){
			model.addAttribute("msg","로그인이 필요합니다.");
			model.addAttribute("url","/signin");
			return "redirect";

		}

		if(user.isOperator()){
			model.addAttribute("isOp",true);
			classList = classService.classListAll();
		}else if(user.isPs()){
			classList = classService.classList(user.getUserId());
		}else{
			return "redirect:/home";
		}

		model.addAttribute("classList",classList);
		return "class/classlist";
	}

	@Transactional
	@RequestMapping("/classcreatedo")
	public String classcreatedo (Model model, HttpSession session,
								 @RequestParam(value="className", required = true)String classNm,
								 @RequestParam(value="proBoard", required = false)String proBoard,
								 @RequestParam(value="stuBoard", required = false)String stuBoard,
								 @RequestParam(value="submitBoard", required = false)String submitBoard,
								 @RequestParam(value ="newBoardList", required = false)String boardList[]) throws ParseException {
		Users user = (Users) session.getAttribute("user");


		Class newClass = new Class();
		newClass.setClassNm(classNm);
		newClass.setFk_professorId(user.getUserId());
		newClass.setProfessorNm(user.getName());

		classService.createClass(newClass);
		int classId = newClass.getClassId();
		System.out.println("클래스 아이디 : "+classId);
		List<Board_Managament> newBoardList= new ArrayList<>();

		if(proBoard != null && !proBoard.equals("")){
			Board_Managament newBoard = new Board_Managament(proBoard);
			newBoard.setFk_classId(classId);
			newBoard.setFk_classNm(classNm);
			newBoardList.add(newBoard);
			System.out.println("교수님게시판 생성");
		}
		if(stuBoard !=null && !stuBoard.equals("")){
			Board_Managament newBoard = new Board_Managament(stuBoard);
			newBoard.setFk_classId(classId);
			newBoard.setFk_classNm(classNm);
			newBoardList.add(newBoard);
			System.out.println("학생게시판 생성");
		}
		if(submitBoard != null && !submitBoard.equals("")){
			Board_Managament newBoard = new Board_Managament(submitBoard);
			newBoard.setFk_classId(classId);
			newBoard.setFk_classNm(classNm);
			newBoardList.add(newBoard);
			System.out.println("제출게시판 생성");
		}
		if (boardList.length>2){
			for(int i=2; i<boardList.length; i++) {
				System.out.println(boardList[i]);
				JSONParser parser = new JSONParser();
				Object obj = parser.parse(boardList[i]);
				JSONObject jsonObject = (JSONObject) obj;
				Board_Managament newBoard = new Board_Managament();

				newBoard.setBoardNm(String.valueOf(jsonObject.get("boardNm")));
				newBoard.setC(String.valueOf(jsonObject.get("C")));
				newBoard.setR(String.valueOf(jsonObject.get("R")));
				newBoard.setD(String.valueOf(jsonObject.get("D")));
				newBoard.setFk_classId(classId);
				newBoard.setFk_classNm(classNm);
				newBoard.setBoardKind("classBoard");
				newBoardList.add(newBoard);
			}
		}

		boardManagementService.insertClassBoardList(newBoardList);

		Myclass myclass = new Myclass();
		myclass.setMyclassNm(classNm);
		myclass.setFk_userId(user.getUserId());
		myclass.setFk_classId(classId);
		myclass.setConfirm(true);
		myclass.setFk_professorId(user.getUserId());
		myclass.setName(user.getName());

		myClassService.insertMyClassService(myclass);
		return "redirect:classlist";
	}

	@RequestMapping("/editClass")
	public String editClass(Model model, HttpSession session,
							@RequestParam(value="jsonString", required = true)String jsonString ) throws ParseException {
		Users user = (Users) session.getAttribute("user");
		if(user == null){
			return "home";
		}
		if(user.isOperator()||user.isPs()){
			System.out.println("jsonString: "+jsonString);
			JSONParser jsonParser = new JSONParser();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonString);
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonArray.get(0).toString());
			int classId = Integer.parseInt(jsonObject.get("classId").toString());
			List<Myclass> myclassList = myClassService.getMyClassList(classId);
			model.addAttribute("myClassList",myclassList);
		}

		return "class/editclass";
	}

	@RequestMapping("/doConfirm")
	public String doConfirm(Model model, HttpSession session,
							@RequestParam(value="jsonString", required = true)String jsonString,
							@RequestParam(value="classId", required = true)String classId) throws ParseException {
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonString);
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonArray.get(i).toString());
			int userId = Integer.parseInt(jsonObject.get("userId").toString());
			myClassService.myClassConfirm(userId,Integer.parseInt(classId));
		}
		System.out.println(jsonString);
		System.out.println(classId);
		return "redirect:classlist";
	}

	@RequestMapping("/doDeleteClass")
	public String doDeleteClass(Model model , HttpSession session,
								@RequestParam(value = "jsonString", required = true)String jsonString)throws ParseException{
		Users user = (Users) session.getAttribute("user");
		if(user ==null){
			model.addAttribute("msg","로그인이 필요합니다.");
			model.addAttribute("url","/signin");
			return "redirect";
		}
		if (user.isPs() || user.isOperator()) {
			JSONParser jsonParser = new JSONParser();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonString);
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonArray.get(i).toString());
				int classId = Integer.parseInt(jsonObject.get("classId").toString());

				classService.deleteClassService(classId);
				System.out.println("수업 삭제 : " + classId);
			}
			return "redirect:classlist";
		}
		else{
			model.addAttribute("msg","권한이 없습니다.");
			model.addAttribute("url","/home");
			return "redirect";
		}
	}
}
