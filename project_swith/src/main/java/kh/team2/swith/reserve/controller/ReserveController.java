package kh.team2.swith.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.team2.swith.reserve.model.service.ReserveService;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@Controller
//@RequestMapping("/reserve")
public class ReserveController {
	@Autowired
	private ReserveService service;
	
	@PostMapping("/rezplace")
	public String rezPlace() {
		return "redirect:/";
	}
	
	@GetMapping("/rezconfirm")
	public String rezConfirm() {
		return "redirect:/";
	}
	
	@PostMapping("/rezcancel")
	public String rezCancel() {
		return "redirect:/";
	}
	
	public String selectStudyPayDetail() {
		return "redirect:/";
	}
	
	@GetMapping("/myreserve")
	public ModelAndView myReserveList(ModelAndView mv) {
		String member_id = "user3";
		List<ReserveInfo> rList = service.selectListMyReserve(member_id);
		mv.addObject("rlist", rList);
		mv.setViewName("myPage/myReserveList");
		return mv;
	}
}
