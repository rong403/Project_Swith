package kh.team2.swith.reserve.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.team2.swith.reserve.model.service.ReserveService;

@Controller
@RequestMapping("/reserve")
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
}
