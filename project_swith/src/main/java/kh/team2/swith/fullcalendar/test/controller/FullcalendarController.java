package kh.team2.swith.fullcalendar.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test")
public class FullcalendarController {
	@GetMapping("/view1")
	public ModelAndView view1(ModelAndView mv) {
		mv.setViewName("/test/fullcalendar"); 
		return mv;
	}
	@GetMapping("/view2")
	public ModelAndView view2(ModelAndView mv) {
		mv.setViewName("/test/fullcalendar2"); 
		return mv;
	}
	

}
