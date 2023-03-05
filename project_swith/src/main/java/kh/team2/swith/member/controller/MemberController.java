package kh.team2.swith.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 로그인
	@RequestMapping(value = "/member/viewLogin")
	public String viewLogin() {
		return "member/login";
	}
	// 아이디 찾기
	@RequestMapping(value = "/member/viewSearchId")
	public String searchId() {
		return "member/searchId";
	}
	@RequestMapping(value = "/member/SearchId", method = RequestMethod.POST)
	public String searchId(Member vo, Model model, RedirectAttributes rttr) {
		String result = memberService.selectId(vo);
		if(result != null) {
			model.addAttribute("idData", result);
			model.addAttribute("member_name", vo.getMember_name());
			model.addAttribute("email", vo.getEmail());
			return "member/viewId";
		} else {
			rttr.addFlashAttribute("msg","존재하지 않는 회원정보입니다.");
			return "redirect:/member/viewSearchId";
		}
	}
	@RequestMapping(value = "/member/SearchFullId", method = RequestMethod.POST)
	public String SearchFullId(Member vo, RedirectAttributes rttr) {
		mailService.sIdEmail(memberService.selectFullId(vo), vo.getMember_name(), vo.getEmail());
		rttr.addFlashAttribute("msg","가입하신 이메일로 아이디가 발송되었습니다.");
		return "redirect:/member/viewLogin";
	}
	// 비밀번호 찾기
	@RequestMapping(value = "/member/viewSearchPwd")
	public String searchPwd() {
		return "member/searchPwd";
	}
	@RequestMapping(value = "/member/checkEmail")
	public String checkEmail() {
		return "member/checkEmail";
	}
	@RequestMapping(value = "/member/viewUpdateUserPwd", method = RequestMethod.POST)
	public String updateUserPwd(Member vo, Model model, RedirectAttributes rttr) {
		String result = vo.getMember_id();
		if(result != null) {
			model.addAttribute("member_id", result);
			return "member/viewPwd";
		} else {
			rttr.addFlashAttribute("msg","인증 절차를 다시 진행해주세요.");
			return "redirect:/member/viewSearchPwd";
		}
	}
	
	@RequestMapping(value = "/member/SearchPwd", method = RequestMethod.POST)
	public String searchPwd(Member vo, Model model, RedirectAttributes rttr) {
		int result = memberService.selectPwd(vo);
		String result2 = null;
		
		if(result == 1) {
			result2 = mailService.joinEmail(vo.getEmail());
			rttr.addFlashAttribute("authNumber", result2);
			rttr.addFlashAttribute("member_id", vo.getMember_id());
			rttr.addFlashAttribute("msg","가입하신 이메일로 인증번호가 발송되었습니다.");
			return "redirect:/member/checkEmail";
		} else {
			rttr.addFlashAttribute("msg","존재하지 않는 회원정보입니다.");
			return "redirect:/member/viewSearchPwd";
		}
	}
	@RequestMapping(value = "/member/updateUserPwd", method = RequestMethod.POST)
	public String updateUserPwd(Member vo, RedirectAttributes rttr) throws IOException {
		String member_pwd = pwdEncoder.encode(vo.getMember_pwd());
		vo.setMember_pwd(member_pwd);
		int result = memberService.updatePwd(vo);
		if(result == 1) {
			rttr.addFlashAttribute("msg","비밀번호가 성공적으로 변경되었습니다.");
			return "redirect:/member/viewLogin";
		} else {
			rttr.addFlashAttribute("msg","비밀번호 변경을 실패했습니다.");
			return "redirect:/member/viewSearchPwd";
		}
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
