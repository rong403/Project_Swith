package kh.team2.swith.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.member.util.MailSendService;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	@Autowired
	private MailSendService mailService;
	
	@RequestMapping(value = "/member/viewLogin")
	public String viewLogin() {
		return "member/login";
	}
	
	//homin
//	@RequestMapping(value = "/admin", method = RequestMethod.GET)
//	public String admin() {
//		return "member/security_test/admin/security_success_admin";
//	}
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user() {
		return "member/security_test/user/security_success_user";
	}
	@RequestMapping(value = "/isAuthenticated/login", method = RequestMethod.GET)
	public String loginSuccess() {
		return "member/security_test/login_success";
	}
	
	// 회원가입
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String viewJoin() {
		return "member/join";
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Member vo) {
		String member_pwd = pwdEncoder.encode(vo.getMember_pwd());
		vo.setMember_pwd(member_pwd);
		int result = memberService.insertMember(vo);
		return "member/login";
	}
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public void CheckId(String member_id, HttpServletResponse response) throws IOException {
		int result = memberService.checkId(member_id);
		
		PrintWriter out = response.getWriter();
		if(result == 0) {
			out.print("success");
		} else {
			out.print("fail");
		}
	}
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public void CheckEmail(String email, HttpServletResponse response) throws IOException {
		int result = memberService.checkEmail(email);
		String result2 = null;
		
		PrintWriter out = response.getWriter();
		if(result == 0) {
			result2 = mailService.joinEmail(email);
			out.print(result2);
		} else {
			out.print("fail");
		}
	}
	
	// 마이페이지 기능
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(Member vo, HttpServletResponse response) throws IOException {
		int result = memberService.updateMember(vo);
		PrintWriter out = response.getWriter();
		if(result == 1) {
			out.print("success");
		} else {
			out.print("fail");
		}
		return "redirect:/mypage/myinfo";
	}
	@RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
	public String updatePwd(Member vo, Principal principal, HttpServletResponse response) throws IOException {
		String member_id = principal.getName();
		String member_pwd = pwdEncoder.encode(vo.getMember_pwd());
		vo.setMember_id(member_id);
		vo.setMember_pwd(member_pwd);
		int result = memberService.updatePwd(vo);
		PrintWriter out = response.getWriter();
		if(result == 1) {
			out.print("success");
		} else {
			out.print("fail");
		}
		return "redirect:/mypage/myuppwd";
	}
}
