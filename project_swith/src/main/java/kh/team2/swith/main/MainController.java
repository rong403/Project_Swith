package kh.team2.swith.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@GetMapping(value="/postList")
	public ModelAndView postList(ModelAndView mv ,@RequestParam(name = "orderBy", defaultValue = "createdAtDesc") String orderBy) throws Exception {
	    List<Study> posts = null;
	    if (orderBy.equals("createdAtDesc")) {
	        posts = studyService.findAllByOrderByCreatedAtDesc();
	    } else if (orderBy.equals("viewCountDesc")) {
	        posts = studyService.findAllByOrderByViewCountDesc();
	    } else if (orderBy.equals("likeCountDesc")) {
	        posts = studyService.findAllByOrderByLikeCountDesc();
	    }
	    mv.setViewName("main");
	    mv.addObject("studylist", posts);
	    return mv;
	}
}
