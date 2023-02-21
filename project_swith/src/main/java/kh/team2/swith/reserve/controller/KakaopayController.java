package kh.team2.swith.reserve.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.reserve.model.service.CardInfoService;
import kh.team2.swith.reserve.model.service.KakaopayService;
import kh.team2.swith.reserve.model.service.ReserveService;
import kh.team2.swith.reserve.model.vo.ApproveResponse;
import kh.team2.swith.reserve.model.vo.CardInfoVo;
import kh.team2.swith.reserve.model.vo.ReadyResponse;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@Controller
@SessionAttributes({ "tid", "room_name", "total_price"})
public class KakaopayController {
	@Autowired
	private KakaopayService service;
	
	@Autowired
	private CardInfoService cService;
	
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
	
	@GetMapping("/reserveinfo")
	public String payApprove(
			@RequestParam("pg_token") String pg_token
			, @ModelAttribute("tid") String tid
			, @ModelAttribute("room_name") String room_name
			, @ModelAttribute("total_price") String total_price
			, CardInfoVo cInfoVo
			, ReserveInfo rInfoVo
			,Model model) {
		// login 정보 가져오기
		String user_id = "user22";
		Member mvo = mService.selectMember(user_id);
		
		// 카카오 결제 승인 요청
		ApproveResponse approve = service.payApprove(pg_token, tid);
		
		//카드 결제가 아니라면 null값 세팅
		if(approve.getPayment_method_type().equals("CARD")) {
			cInfoVo.setBin(approve.getCard_info().getBin());
			cInfoVo.setCard_type(approve.getCard_info().getCard_type());
			cInfoVo.setKakaopay_purchase_corp(approve.getCard_info().getKakaopay_purchase_corp());
			cInfoVo.setKakaopay_purchase_corp_code(approve.getCard_info().getKakaopay_purchase_corp_code());
			cInfoVo.setKakaopay_issuer_corp(approve.getCard_info().getKakaopay_issuer_corp());
			cInfoVo.setKakaopay_issuer_corp_code(approve.getCard_info().getKakaopay_issuer_corp_code());
		}
		cInfoVo.setTid(tid);
		int resultCardInfo = cService.insertCardInfo(cInfoVo);
		
		// 예약정보 저장
		rInfoVo.setMember_id(user_id);
		rInfoVo.setRoom_no(154);
		rInfoVo.setReserve_price(total_price);
		rInfoVo.setReserve_name(mvo.getMember_name());
		rInfoVo.setReserve_email(mvo.getEmail());
		rInfoVo.setReserve_phone(mvo.getHnd_no());
		rInfoVo.setReserve_comment("comment");
		rInfoVo.setTid(tid);
		rInfoVo.setPayment_method_type(approve.getPayment_method_type());
		
		int resultReserve = rService.insertReserve(rInfoVo);
		
		//DB 저장 실패시, kakaopay 결제 취소 요청 필요 //TODO hhjng 추후 경로, 조건 수정
		if(resultCardInfo < 1 && resultReserve < 1) {
			return "redirect:/map";
		} else {
			model.addAttribute("approve", approve);
			model.addAttribute("total_price", total_price);
			return "reserve/reserved";
		}
	}
	
	// TODO hhjng
	// 결제 취소시 실행 url->service에서도 수정 필요
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
