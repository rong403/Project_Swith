package kh.team2.swith.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.member.model.vo.Member;


@Controller
public class MemberController {
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String viewJoin() {
		return "join";
	}
	@RequestMapping(value = "/main/viewLogin")
	public String viewLogin() {
		return "member/login";
	}
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return "member/security_test/admin/security_success_admin";
	}
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user() {
		return "member/security_test/user/security_success_user";
	}
}
