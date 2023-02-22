package kh.team2.swith.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage1() {
		return "myPage/myPage";
	}
	@RequestMapping(value = "/myskd", method = RequestMethod.GET)
	public String myPage2() {
		return "myPage/mySchedule";
	}
	@RequestMapping(value = "/mystd", method = RequestMethod.GET)
	public String myPage3() {
		return "myPage/myStudy";
	}
	@RequestMapping(value = "/mystden", method = RequestMethod.GET)
	public String myPage4() {
		return "myPage/myStudyEnroll";
	}
}
