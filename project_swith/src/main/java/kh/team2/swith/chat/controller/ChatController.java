package kh.team2.swith.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.team2.swith.chat.service.ChatService;



@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@GetMapping("/a1")
	public String aaa1() {
		String result = null;
		return result;
	}
	
	@GetMapping("/a2")
	public String aaa2() {
		String result = null;
		return result;
	}
	
	@GetMapping("/a3")
	public String aaa3() {
		String result = null;
		return result;
	}
	
	@PostMapping("/a4")
	public String insertChat(ModelAndView mv,
			@RequestParam(value = "study_no") String study_no,
			@RequestParam(value = "member_id") String member_id,
			@RequestParam(value = "chatting_content") String chatting_content
			) {
			
		String result = null;
		return result;
	}
	
	@GetMapping("/a5")
	public String aaa4() {
		String result = null;
		return result;
	}
}
