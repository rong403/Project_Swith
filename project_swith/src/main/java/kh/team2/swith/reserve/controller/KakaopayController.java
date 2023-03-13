package kh.team2.swith.reserve.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import kh.team2.swith.place.model.service.PlaceService;
import kh.team2.swith.place.room.model.service.RoomServcie;
import kh.team2.swith.reserve.model.service.CardInfoService;
import kh.team2.swith.reserve.model.service.KakaopayService;
import kh.team2.swith.reserve.model.service.ReserveService;
import kh.team2.swith.reserve.model.vo.ApproveResponse;
import kh.team2.swith.reserve.model.vo.CardInfoVo;
import kh.team2.swith.reserve.model.vo.ReadyResponse;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@Controller
@SessionAttributes({ "tid", "room_name", "total_price", "reserve_date"
	, "start_time", "end_time", "area", "pl_name"})
public class KakaopayController {
	@Autowired
	private KakaopayService service;
	
	@Autowired
	private CardInfoService cService;
	
	@Autowired
	private ReserveService rService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PlaceService pService;
	
	@Autowired
	private RoomServcie strService;

	@GetMapping("/kakaopay.cls")
	@ResponseBody
	public ReadyResponse payReady(
			@RequestParam(name = "room_name") String room_name
			, @RequestParam(name = "cnt") String cnt
			, @RequestParam(name = "total_price") String total_price
			, @RequestParam(name = "reserve_date") String reserve_date
			, @RequestParam(name = "ajax_start_time") String ajax_start_time
			, @RequestParam(name= "ajax_end_time") String ajax_end_time
			, @RequestParam(name= "area") String area
			, @RequestParam(name= "pl_name") String pl_name
			, Model model
			, HttpServletRequest request) {
		ReadyResponse ready = service.payReady(room_name, cnt, total_price, request.getContextPath());
		model.addAttribute("tid", ready.getTid());
		model.addAttribute("room_name", room_name);
		model.addAttribute("total_price", total_price);
		model.addAttribute("reserve_date", reserve_date);
		int start_time = Integer.parseInt(ajax_start_time);
		int end_time = Integer.parseInt(ajax_end_time);
		model.addAttribute("start_time", start_time);
		model.addAttribute("end_time", end_time);
		model.addAttribute("area", area);
		model.addAttribute("pl_name", pl_name);

		return ready;
	}
	
	@GetMapping("/successKakaopay")
	public String payApprove(
			@RequestParam("pg_token") String pg_token
			, @ModelAttribute("tid") String tid
			, @ModelAttribute("room_name") String room_name
			, @ModelAttribute("total_price") String total_price
			, @ModelAttribute("reserve_date") String reserve_date
			, @ModelAttribute("start_time") int start_time
			, @ModelAttribute("end_time") int end_time
			, @ModelAttribute("area") String area
			, @ModelAttribute("pl_name") String pl_name
			, CardInfoVo cInfoVo
			, ReserveInfo rInfoVo
			, Principal principal
			, Model model) throws Exception {
		// login 정보 가져오기
		String user_id = principal.getName();
		Member mvo = mService.selectMember(user_id);
		if(user_id == null || mvo == null) {
			return "place";
		}
		
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
		
		// 스터디룸 번호 알아오기
		int p_no = pService.selectPlaceNo(area, pl_name);
		int room_no = strService.selectRoomNo(p_no, room_name);
		
		// 예약정보 저장
		rInfoVo.setMember_id(user_id);
		rInfoVo.setRoom_no(room_no);
		rInfoVo.setReserve_price(total_price);
		rInfoVo.setReserve_name(mvo.getMember_name());
		rInfoVo.setReserve_email(mvo.getEmail());
		rInfoVo.setReserve_phone(mvo.getHnd_no());
		rInfoVo.setReserve_start_time(start_time);
		rInfoVo.setReserve_end_time(end_time);
		rInfoVo.setReserve_date(reserve_date);
		rInfoVo.setTid(tid);
		rInfoVo.setPayment_method_type(approve.getPayment_method_type());
		
		int resultReserve = rService.insertReserve(rInfoVo);
		
		//DB 저장 실패시, kakaopay 결제 취소 요청 필요
		if(resultCardInfo < 1 || resultReserve < 1) {
			service.payCancel(rInfoVo);
			return "place";
		} else {
			model.addAttribute("approve", approve);
			model.addAttribute("total_price", total_price);
			model.addAttribute("msgAlert", "결제 실패!!");
			
			return "reserved/reserveInfo";
		}
	}
	
	// 결제 취소시 실행 url
	@GetMapping("/pay/cancel")
	public String payCancel(Model model) {
		model.addAttribute("msgAlert", "결제 실패!!");
		return "error/kakaopayError";
	}

	// 결제 실패시 실행 url
	@GetMapping("/pay/fail")
	public String payFail() {
		return "error/kakaopayError";
	}
}
