package kh.team2.swith.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.Study;

@Controller
public class MainController {

	@Autowired
	private StudyService studyService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv) throws Exception {
		List<Study> list  = studyService.selectListStudy();
//		model.addAttribute("studylist", list);
//		return "main";
		
		mv.setViewName("main");
		mv.addObject("studylist", list);
		return mv;
	}
}
