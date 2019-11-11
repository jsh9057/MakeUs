package com.skuniv.makeus.controller;

import com.skuniv.makeus.dto.Class;
import com.skuniv.makeus.dto.Myclass;
import com.skuniv.makeus.dto.MyclassEnrol;
import com.skuniv.makeus.dto.Users;
import com.skuniv.makeus.service.ClassService;
import com.skuniv.makeus.service.MyClassService;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class EnrolController {
    @Autowired
    ClassService classService;
    @Autowired
    MyClassService myClassService;

    @RequestMapping("/enrollment")
    public String enrolmentlist(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:signin";
        } else if (user.isPs() == true) {
            return "redirect:home";
        }
        List<MyclassEnrol> myclasslist = myClassService.studentMyClassList(user.getUserId());
        List<Class> allclasslist = classService.classListAll();
        model.addAttribute("enrolList", myclasslist);
        model.addAttribute("enrolAllList", allclasslist);
        return "class/enrollment";
    }

    @RequestMapping("/doEnroll")
    public String doEnrol(Model model, HttpSession session,
                          @RequestParam(value = "jsonString", required = true) String jsonString) throws ParseException {
        Users user = (Users) session.getAttribute("user");
        System.out.println(jsonString);
        JSONParser jsonParser = new JSONParser();
        JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonString);
        List<Myclass> myclassList = myClassService.allMyclass(user.getUserId());
        String msg = "";
        String url = "../enrollment";
        for (int i = 0; i < jsonArray.size(); i++) {
            boolean isOverlap = false;
            JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonArray.get(i).toString());
            int classId = Integer.parseInt(jsonObject.get("classId").toString());
            System.out.println(i + "번 : " + jsonObject.get("classId"));
            for (Myclass myclass : myclassList) {
                if (myclass.getFk_classId() == classId) {
                    isOverlap = true;
                    msg = "이미 등록된 수업은 수강신청에서 제외됩니다.";
                }

            }
            if (isOverlap == false) {
                Class tempClass = classService.getClass(classId);
                Myclass myclass = new Myclass(user.getUserId(), user.getName(), tempClass);
                myClassService.tempInsertMyclass(myclass);
            }
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        return "redirect";
    }

    @RequestMapping("/doEnrollCancel")
    public String doEnrollCancel(Model model, HttpSession session,
                                 @RequestParam(value = "jsonString", required = true) String jsonString,
                                 @RequestParam(value = "classId",required = true) int postClassId) throws ParseException {

        Users user = (Users) session.getAttribute("user");
        if(user == null){
            model.addAttribute("msg","로그인을 해주십시오.");
            model.addAttribute("url","/signin");
            return "redirect";
        }
        System.out.println(jsonString);
        JSONParser jsonParser = new JSONParser();
        JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonString);
        int classId = postClassId;
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonArray.get(i).toString());
            System.out.println(i + "번 : " + jsonObject.get("userId"));
            int delUserId = Integer.parseInt(String.valueOf(jsonObject.get("userId")));
            myClassService.cancelMyclass(delUserId,classId);
        }
        return "redirect:/classlist";
    }

}
