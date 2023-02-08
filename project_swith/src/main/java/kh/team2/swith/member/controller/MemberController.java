package kh.team2.swith.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String viewJoin() {
		return "member/join";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String viewLogin() {
		return "member/login";
	}
}
