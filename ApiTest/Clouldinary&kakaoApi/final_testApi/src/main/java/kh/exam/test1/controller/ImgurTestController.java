package kh.exam.test1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ImgurTestController {
	
	@GetMapping("/imgur")
	public String imgur() {
		return "/imgurTest";
	}
}
