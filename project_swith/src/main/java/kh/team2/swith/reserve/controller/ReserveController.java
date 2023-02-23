package kh.team2.swith.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.team2.swith.reserve.model.service.CardInfoService;
import kh.team2.swith.reserve.model.service.KakaopayService;
import kh.team2.swith.reserve.model.service.ReserveService;
import kh.team2.swith.reserve.model.vo.CancelResponse;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@Controller
//@RequestMapping("/reserve")
public class ReserveController {
	@Autowired
	private KakaopayService kService;
	
	@Autowired
	private ReserveService rService;
	
	@Autowired
	private CardInfoService cService;
	
	//homin	
	@PostMapping("/rezroom.lo")
	@ResponseBody
	public String rezRoom(@RequestParam("room_no") int room_no) {
		List<ReserveInfo> reserveList = rService.selectListRoomReserve(room_no);
		
		return new Gson().toJson(reserveList);
	}
	
	@PostMapping("/rezplace")
	public String rezPlace() {
		return "redirect:/";
	}
	
	@GetMapping("/rezconfirm")
	public String rezConfirm() {
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping("/rezcancel")
	public String rezCancel(
			@RequestParam(name="member_id") String member_id
			,@RequestParam(name="reserve_no") String reserve_no) {
		//예약내역 가져오기(결제 취소 및 카드정보 삭제용 tid값 필요)
		ReserveInfo rInfo = rService.selectReserve(member_id, reserve_no);
		//가져온 날짜 데이터 파싱(자동으로 붙는 시:분:초 제거)
		String parsedDate = rInfo.getReserve_date().substring(0, 10);
		rInfo.setReserve_date(parsedDate);

		//결제 취소 TODO hhjng
		CancelResponse cancel = kService.payCancel(rInfo);
		//예약 취소 테이블에 넣기
		int canResult = rService.insertCancelReserve(rInfo);
		int rResult = rService.deleteReserve(member_id, reserve_no);
		
		//카드정보 테이블에서 삭제
		int cardResult = cService.deleteCardInfo(rInfo.getTid());
		
		return "myreserve";
	}
	
	public String selectStudyPayDetail() {
		return "redirect:/";
	}
	
	@GetMapping("/myreserve")
	public ModelAndView myReserveList(ModelAndView mv) {
		String member_id = "user22";
		List<ReserveInfo> rList = rService.selectListMyReserve(member_id);
		mv.addObject("rlist", rList);
		mv.setViewName("myPage/myReserveList");
		return mv;
	}
}
