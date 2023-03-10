package kh.team2.swith.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.team2.swith.study.model.service.StudyParticipantService;
import kh.team2.swith.study.model.service.StudyReserverService;
import kh.team2.swith.study.model.vo.StudyParticipant;
import kh.team2.swith.study.model.vo.StudyReserver;

@Controller
@RequestMapping("/studyManager")
public class StudyManagerController {


	@Autowired
	private StudyParticipantService spService;
	@Autowired
	private StudyReserverService srService;
	
	@PostMapping("/participantList.lo")
	@ResponseBody
	public String selectListStudyParticipant(@RequestParam("study_no") int study_no) throws Exception {
		List<StudyParticipant> voList = spService.selectStudyList(study_no);
		int cnt = spService.selectStudyListCnt(study_no);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("voList", voList);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	@PostMapping("/reserverList.lo")
	@ResponseBody
	public String selectListStudyReserver(@RequestParam("study_no") int study_no) throws Exception {
		List<StudyReserver> voList = srService.selectStudyList(study_no);
		return new Gson().toJson(voList);
	}
}
