package kh.team2.swith.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.team2.swith.area.model.service.AreaService;
import kh.team2.swith.area.model.vo.Area;
import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.member.model.vo.MemberProfile;
import kh.team2.swith.member.model.vo.Report;
import kh.team2.swith.place.model.service.PlaceService;
import kh.team2.swith.place.model.vo.Place;
import kh.team2.swith.study.model.service.StudyCategoryService;
import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.Study;
import kh.team2.swith.study.model.vo.StudyAdmin;
import kh.team2.swith.study.model.vo.StudyCategory;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private StudyService studyService;
	@Autowired
	private PlaceService placeService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private StudyCategoryService scService;
	
	@GetMapping("")
	public ModelAndView viewAdmin(ModelAndView mv) throws Exception {
		List<String> sidoList = areaService.selectSidoList();
		List<StudyCategory> scList = scService.selectCategoryList();
		mv.addObject("sidoList", sidoList);
		mv.addObject("scList", scList);
		mv.setViewName("admin/admin");
		return mv;
	}
	
	@PostMapping("/studyList.lo")
	@ResponseBody
	public String selectListStudyAdmin(
			@RequestParam("study_keyword") String study_keyword
		   ,@RequestParam("study_category") int study_category
		   ,@RequestParam("study_condition") int study_condition
		   ,@RequestParam(name="page", defaultValue = "1", required = false) String currentPageStr
			) throws Exception {
		
		//?????? ?????????
		int currentPage = 1;
		//???????????? ?????? ??????
		int limit = 5;
		//????????? ??????????????? ??????
		int pageNum = 5;
		
		currentPage = Integer.parseInt(currentPageStr);

		//?????? ????????? ????????? ?????? ???????????? ????????? ??????
		int listCnt = studyService.selectListAdminCnt(study_keyword, study_category, study_condition);
		List<StudyAdmin> studyList = studyService.selectListAdmin(study_keyword, study_category, study_condition, currentPage, limit);
		
		// ??? ????????? ??? ?????? : ????????? ?????? 1?????? ??? 1page??? ???????????? ?????? 0.9??? ?????????.
		int maxPage = (int)((double)listCnt / limit + 0.8);
		// ?????? ????????? ?????? ????????? ??????
		int startPage = (((int)((double)currentPage /pageNum + 0.95))-1)*pageNum + 1;
		// ??????, ???????????? ????????? ????????? ?????? 10??? ??????, ??? ???????????? 10/20/30page??? ????????? ??????
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
	
	@PostMapping("/placeList.lo")
	@ResponseBody
	public String selectListPlaceAdmin(
			@RequestParam("studyCafe_keyword") String studyCafe_keyword
		   ,@RequestParam("sido_name") String sido_name
		   ,@RequestParam("area_code") int area_code
		   ,@RequestParam(name="page", defaultValue = "1", required = false) String currentPageStr
			) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();		
		
		if(sido_name.equals("??????") || area_code == 0) {
			resultMap.put("check", false);
		} else {
			//?????? ?????????
			int currentPage = 1;
			//???????????? ?????? ??????
			int limit = 5;
			//????????? ??????????????? ??????
			int pageNum = 5;
			
			currentPage = Integer.parseInt(currentPageStr);

			//?????? ????????? ????????? ?????? ???????????? ????????? ??????
			int listCnt = placeService.selectPlaceCountAdmin(studyCafe_keyword, sido_name, area_code);
			List<Place> placeList = placeService.selectListPlaceAdmin(studyCafe_keyword, sido_name, area_code, currentPage, limit);
			
			// ??? ????????? ??? ?????? : ????????? ?????? 1?????? ??? 1page??? ???????????? ?????? 0.9??? ?????????.
			int maxPage = (int)((double)listCnt / limit + 0.8);
			// ?????? ????????? ?????? ????????? ??????
			int startPage = (((int)((double)currentPage /pageNum + 0.95))-1)*pageNum + 1;
			// ??????, ???????????? ????????? ????????? ?????? 10??? ??????, ??? ???????????? 10/20/30page??? ????????? ??????
			int endPage = startPage + pageNum - 1;
			if(maxPage < endPage)
				endPage = maxPage;
			
			
			resultMap.put("check", true);
			resultMap.put("list", placeList);
			resultMap.put("currentPage", currentPage);
			resultMap.put("maxPage", maxPage);
			resultMap.put("startPage", startPage);
			resultMap.put("endPage", endPage);
		}
		
		return new Gson().toJson(resultMap);
	}
	
	@PostMapping("/memberList.lo")
	@ResponseBody
	public String selectListMemberAdmin(
			@RequestParam("member_serch_type") String member_serch_type
		   ,@RequestParam("member_keyword") String member_keyword
		   ,@RequestParam(name="page", defaultValue = "1", required = false) String currentPageStr
			) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();		
		
		if(member_serch_type.equals("??????")) {
			resultMap.put("check", 1);
		} else {
			if(!member_serch_type.equals("??????") && member_keyword.equals("")) {
				resultMap.put("check", 2);
			} else {
				//?????? ?????????
				int currentPage = 1;
				//???????????? ?????? ??????
				int limit = 4;
				//????????? ??????????????? ??????
				int pageNum = 5;
				
				currentPage = Integer.parseInt(currentPageStr);

				//?????? ????????? ????????? ?????? ???????????? ????????? ??????
				int listCnt = memberService.selectMemberCountAdmin(member_keyword, member_serch_type);
				List<MemberProfile> memberList = memberService.selectListMemberAdmin(member_keyword, member_serch_type, currentPage, limit);
				
				// ??? ????????? ??? ?????? : ????????? ?????? 1?????? ??? 1page??? ???????????? ?????? 0.9??? ?????????.
				int maxPage = (int)((double)listCnt / limit + 0.8);
				// ?????? ????????? ?????? ????????? ??????
				int startPage = (((int)((double)currentPage /pageNum + 0.95))-1)*pageNum + 1;
				// ??????, ???????????? ????????? ????????? ?????? 10??? ??????, ??? ???????????? 10/20/30page??? ????????? ??????
				int endPage = startPage + pageNum - 1;
				if(maxPage < endPage)
					endPage = maxPage;
				
				resultMap.put("check", 0);
				resultMap.put("list", memberList);
				resultMap.put("currentPage", currentPage);
				resultMap.put("maxPage", maxPage);
				resultMap.put("startPage", startPage);
				resultMap.put("endPage", endPage);
			}
		}
		
		return new Gson().toJson(resultMap);
	}
	
	@PostMapping("/reportList.lo")
	@ResponseBody
	public String selectListReportAdmin(
			@RequestParam("member_id") String member_id
			) throws Exception {
		
		List<Report> voList = memberService.selectListReport(member_id);
		
		return new Gson().toJson(voList);
	}
	
	@PostMapping("/memberUpdate.lo")
	@ResponseBody
	public int updateMemberAdmin(
			@RequestParam("member_id") String member_id
			) {
		int result = 0;
		try {
			result = memberService.updateMemberStop(member_id);
		} catch(Exception e) {
			
		}
		return result;
	}
}
