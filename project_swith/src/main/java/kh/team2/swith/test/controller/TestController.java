package kh.team2.swith.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.team2.swith.test.model.service.TestService;
import kh.team2.swith.test.model.vo.TestVo;

@Controller
public class TestController {
	@Autowired
	private TestService service;
	
	@GetMapping("/insert")
	public ModelAndView insert(ModelAndView mv) {
		mv.setViewName("/test/test"); 
		return mv;
	}
	@PostMapping("/insert")
	public String doInsert(TestVo vo) {
		int result = service.insertTest(vo);
		return "redirect:/";
	}
//	@GetMapping("/login")
//	public ModelAndView login(ModelAndView mv) {
//		mv.setViewName("/security_test/security_test"); 
//		return mv;
//	}
	@PostMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("/security_test/security_test"); 
		return mv;
	}
}
