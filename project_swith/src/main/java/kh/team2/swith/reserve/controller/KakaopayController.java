package kh.team2.swith.reserve.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.team2.swith.reserve.model.service.KakaopayService;
import kh.team2.swith.reserve.model.vo.ApproveResponse;
import kh.team2.swith.reserve.model.vo.ReadyResponse;

@Controller
@SessionAttributes({ "tid", "order" })
public class KakaopayController {
	@Autowired
	private KakaopayService service;

	@GetMapping("/kakaopay.cls")
	@ResponseBody
	public ReadyResponse payReady(@RequestParam(name = "room_name") String room_name,
			@RequestParam(name = "cnt") String cnt, @RequestParam(name = "total_price") String total_price,
			Model model) {
		ReadyResponse ready = service.payReady(room_name, cnt, total_price);
		model.addAttribute("tid", ready.getTid());
		//TODO hhjng
		// 예약정보 저장?
		return ready;
	}
	
	@GetMapping("/reservecomplete")
	public String payApprove(@RequestParam("pg_token") String pg_token, @ModelAttribute("tid") String tid, Model model) {
		// 카카오 결제 승인 요청
		ApproveResponse approve = service.payApprove(pg_token, tid);
		model.addAttribute("reserveInfo", approve);
		// TODO hhjng
		// 예약정보 저장
		return "redirect:/reserveinfo";
	}
	
	// TODO hhjng
	// 결제 취소시 실행 url
	@GetMapping("/order/pay/cancel")
	public String payCancel() {
		return "redirect:/carts";
	}

	// 결제 실패시 실행 url
	@GetMapping("/order/pay/fail")
	public String payFail() {
		return "redirect:/carts";
	}
}
