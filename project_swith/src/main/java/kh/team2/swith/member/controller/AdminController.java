package kh.team2.swith.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.Study;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private StudyService service;
	
	@RequestMapping("")
	public String sdfsdfew() {
		return "admin/admin";
	}
	
	@PostMapping("/studyList.lo")
	@ResponseBody
	public String sdfesg(
			@RequestParam("study_keyword") String study_keyword
		   ,@RequestParam("category_code") int category_code
		   ,@RequestParam("study_condition") int study_condition
			) throws Exception {
		List<Study> studyList = service.selectListStudy();
		
		return new Gson().toJson(studyList);
	}
}
