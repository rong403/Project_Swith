package kh.team2.swith.reserve.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.team2.swith.reserve.model.service.KakaopayService;
import kh.team2.swith.reserve.model.vo.ApproveResponse;
import kh.team2.swith.reserve.model.vo.ReadyResponse;

@Controller
@SessionAttributes({"tid","order"}) 
public class KakaopayController {
	@Autowired
	private KakaopayService service;
	
	@GetMapping("/kakaopay.cls")
	@ResponseBody
	public ReadyResponse payReady(@RequestParam(name="room_name") String room_name
			, @RequestParam(name="cnt") String cnt
			, @RequestParam(name="total_price") String total_price
			, Model model) {
		ReadyResponse ready= service.payReady(room_name, cnt, total_price);
		model.addAttribute("tid", ready.getTid());
		// Order정보를 모델에 저장
//		model.addAttribute("order",order);
		return ready;
	}
	
	public ApproveResponse payApprove() {
		ApproveResponse approve = null;
		return approve;
	}
}
