package com.kh.final02;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@GetMapping("/aaa")
	public String aaa() {
		String result = null;
		
		return "/index/aaa";
	}
	
	@PostMapping("/aaa")
	public ModelAndView wef(MultipartHttpServletRequest files, ModelAndView mv) {
		System.out.println("eiwinfin여기진입 ");
		
		return mv;
	}
}
