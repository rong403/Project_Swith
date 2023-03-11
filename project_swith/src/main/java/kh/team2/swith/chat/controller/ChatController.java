package kh.team2.swith.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.team2.swith.chat.model.vo.Chat;
import kh.team2.swith.chat.service.ChatService;



@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	// 채팅방 리스트
	@GetMapping("/selectRoom")
	@ResponseBody
	public String selectRoom(String member_id) {
		try {
			return new Gson().toJson(chatService.selectRoom(member_id));
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIN";
		}
	}
	
	// 채팅 참여자 정보
	@GetMapping("/readMember")
	@ResponseBody
	public String readMember(String study_no) {
		try {
			return new Gson().toJson(chatService.readMember(study_no));
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIN";
		}
	}
	
	// 채팅방 멤버수
	@GetMapping("/memberCnt")
	@ResponseBody
	public String memberCnt(String study_no) {
		try {
			return new Gson().toJson(chatService.memberCnt(study_no));
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIN";
		}
	}
	
	// 채팅 DB 등록
	@PostMapping("/insertChatting")
	@ResponseBody
	public String insertChatting(Chat vo) {
		try {
			return new Gson().toJson(chatService.insertChatting(vo));
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	// 채팅 내용 조회
	@GetMapping("/selectChatting")
	@ResponseBody
	public String selectChatting(String study_no) {
		try {
			return new Gson().toJson(chatService.selectChatting(study_no));
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
	
}
