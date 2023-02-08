package kh.team2.swith.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	@GetMapping("/login")
	public void login() {
		
	}
	@PostMapping("/login")
	public String login(HttpServletRequest request) {
		int result = 0;
		if(result == 0) {
			return "redirect:/error";
		} else {
			return "redirect:/";
		}
	}
	@GetMapping("/error")
	public String error() {
		return "errorpage";
	}
}
