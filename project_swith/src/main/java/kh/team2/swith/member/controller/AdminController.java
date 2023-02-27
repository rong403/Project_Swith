package kh.team2.swith.member.controller;

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

import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.Study;
import kh.team2.swith.study.model.vo.StudyAdmin;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private StudyService studyService;
	
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
		   ,@RequestParam(name="page", defaultValue = "1", required = false) String currentPageStr
			) throws Exception {
		
		//초기 페이지
		int currentPage = 1;
		//페이지당 목록 개수
		int limit = 5;
		//보여줄 페이지목록 개수
		int pageNum = 5;
		
		currentPage = Integer.parseInt(currentPageStr);

		//전체 게시글 개수와 해당 페이지별 목록을 리턴
		int listCnt = studyService.selectListAdminCnt(study_keyword, category_code, study_condition);
		List<StudyAdmin> studyList = studyService.selectListAdmin(study_keyword, category_code, study_condition, currentPage, limit);
		
		// 총 페이지 수 계산 : 목록이 최소 1개일 때 1page로 처리하기 위해 0.9를 더한다.
		int maxPage = (int)((double)listCnt / limit + 0.8);
		// 현재 보여줄 시작 페이지 번호
		int startPage = (((int)((double)currentPage /pageNum + 0.95))-1)*pageNum + 1;
		// 만약, 목록으로 보여질 페이지 수가 10개 이면, 끝 페이지는 10/20/30page가 되어야 한다
		int endPage = startPage + pageNum - 1;
		if(maxPage < endPage)
			endPage = maxPage;
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", studyList);
		resultMap.put("currentPage", currentPage);
		resultMap.put("maxPage", maxPage);
		resultMap.put("startPage", startPage);
		resultMap.put("endPage", endPage);
		
		return new Gson().toJson(resultMap);
	}
}
