package kh.team2.swith.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.reserve.model.service.KakaopayService;
import kh.team2.swith.reserve.model.service.ReserveService;
import kh.team2.swith.reserve.model.vo.ApproveResponse;
import kh.team2.swith.reserve.model.vo.ReadyResponse;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@Controller
@SessionAttributes({ "tid", "room_name", "total_price"})
public class KakaopayController {
	@Autowired
	private KakaopayService service;
	
	@Autowired
	private ReserveService rService;
	
	@Autowired
	private MemberService mService;

	@GetMapping("/kakaopay.cls")
	@ResponseBody
	public ReadyResponse payReady(@RequestParam(name = "room_name") String room_name,
			@RequestParam(name = "cnt") String cnt, @RequestParam(name = "total_price") String total_price,
			Model model) {
		ReadyResponse ready = service.payReady(room_name, cnt, total_price);
		model.addAttribute("tid", ready.getTid());
		model.addAttribute("room_name", room_name);
		model.addAttribute("total_price", total_price);

		return ready;
	}
	
	@GetMapping("/reservecomplete")
	public String payApprove(
			@RequestParam("pg_token") String pg_token
			, @ModelAttribute("tid") String tid
			, @ModelAttribute("room_name") String room_name
			, @ModelAttribute("total_price") String total_price
			, Model model) {
		//DB save test code
		String user_id = "user3";
		Member mvo = mService.selectMember(user_id); //nullpoingException
		
		// 카카오 결제 승인 요청
		ApproveResponse approve = service.payApprove(pg_token, tid);
		//model.addAttribute("reserveInfo", approve);
		// TODO hhjng
		// 예약정보 저장
		ReserveInfo rInfoVo = null;
		rInfoVo.setReserve_no(1);
		rInfoVo.setMember_id(user_id);
		rInfoVo.setRoom_no(0);
		rInfoVo.setReserve_price(total_price);
		rInfoVo.setReserve_name(mvo.getMember_name());
		rInfoVo.setReserve_email(mvo.getEmail());
		rInfoVo.setReserve_phone(mvo.getHnd_no());
		rInfoVo.setReserve_comment("comment");
		
		int result = rService.insertReserve(rInfoVo);
		
		//DB 저장 실패시, kakaopay 결제 취소 요청 필요 //TODO
//		if(result < 1) {
//			return "redirect:/order";
//		} else {
//			return "reserveinfo";
//		}
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
