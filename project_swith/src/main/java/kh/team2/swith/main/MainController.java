package kh.team2.swith.main;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.team2.swith.study.model.service.StudyCategoryService;
import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.Study;
import kh.team2.swith.study.model.vo.StudyCategory;

@Controller
public class MainController {

	@Autowired
	private StudyService studyService;
	@Autowired
	private StudyCategoryService categoryService;


	
	@RequestMapping(value="/postList", method = RequestMethod.POST)
	public ModelAndView postList(@RequestParam("selectValue") String selectedValue, ModelAndView mv) {
		List<Study> postList = null;
		try {
			postList = studyService.postList(selectedValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("postList", postList);
		return mv;
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv,
			@RequestParam(name = "cateCode", required = false, defaultValue = "0") String cateCodeStr,
			@RequestParam(name="searchInput", required= false, defaultValue = "") String searchInput,
			Principal principal
			) throws Exception {

		int cateCode = 0;  // 전체 0
		try {
			cateCode = Integer.parseInt(cateCodeStr);
		}catch (Exception e) {
		}
		List<Study> list = null;
		List<Study> mylist= null;
		if(principal != null) {
			String member_id = principal.getName();
			System.out.println("aaaa:"+ member_id);
			mylist  = studyService.selectListMyStudy(member_id);
		}else {
		}
		
		list = studyService.selectListStudy(cateCode, searchInput);
		List<StudyCategory> categorylist  = categoryService.selectCategoryList();
		for(Study svo : list) {
			int categoryBitSum = svo.getStudy_category();
			List<StudyCategory> tvo = new ArrayList<StudyCategory>();
			for(int i=0; i< 8; i++) {
				if((categoryBitSum & (1<<i)) == (1<<i)) {
					StudyCategory cvo = categorylist.get(i);
					tvo.add(cvo);
				}
			}
			svo.setStudy_category_list(tvo);
		}
		
		mv.setViewName("main");
		mv.addObject("studyMylist", mylist);
		mv.addObject("studylist", list);
		mv.addObject("cateCode", cateCode);
		mv.addObject("categorylist", categorylist);
		return mv;
	}
	

	
	
	
	
}
