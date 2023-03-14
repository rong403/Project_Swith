package kh.team2.swith.chat.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kh.team2.swith.chat.model.vo.Chat;
import kh.team2.swith.chat.service.ChatService;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.study.model.vo.Study;

@RequestMapping("echo")
public class EchoHandler extends TextWebSocketHandler {

	@Autowired
	private ChatService chatService;
	
	// 세션 리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결됨 ", session.getId());
	}
	// 클라이언트가 웹소켓 서버로 메세지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		Map<String, Object> map = session.getAttributes();
		String msg = message.getPayload();
		System.out.println(msg);
		String[] arr = msg.split(",");

		logger.info("{} 로부터 {} 받음 ", session.getId(), message.getPayload());
		// 모든 유저에게 메세지 출력
		for(WebSocketSession sess : sessionList) {
			// 메세지 출력 시 배열에 담긴 순서대로 이름, 채팅내용, 방번호 전달
			sess.sendMessage(new TextMessage(arr[0]+","+arr[1] + "," + arr[2]));
		}
		logger.info("메세지 보낸사람 : " + arr[0]);
		logger.info("메세지 내용 : " + arr[1]);
		
		Chat ch = new Chat();
		// 메세지 보낸사람
		ch.setMember_id(arr[0]);;
		// 채팅내용
		ch.setChatting_content(arr[1]);
		// 방번호
		ch.setStudy_no(arr[2]);
		
		// 채팅 대화 DB저장 //
		int result = chatService.insertChatting(ch);
		System.out.println(result);
	}
	// 클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김.", session.getId());
	}
	
	// 채팅 홈 화면
	@GetMapping("select")
	public ModelAndView selectChatHome(
			ModelAndView mv,
			Principal principal
			) throws Exception {
		// 로그인한 사람 정보 가져오기(이름)
		String member_id = principal.getName();
		
		// 채팅방 리스트 출력
		List<Study> result1 = chatService.selectRoom(member_id);
		mv.addObject("selectRoom", result1);
		
		mv.setViewName("chatting/select");
		return mv;
	}
	
	// 방 선택 완료
	@GetMapping("/selectroom")
	public ModelAndView selectRoom(ModelAndView mv,
			@RequestParam(name="study_no", required = false) String study_no,
			Principal principal
			) throws Exception {
		// 로그인한 사람 정보 가져오기(이름)
		String member_id = principal.getName();
		mv.addObject("member_id", member_id);
		mv.addObject("roomNo", study_no);
		
		// 채팅방 정보
		Study result1 = chatService.readRoom(study_no);
		mv.addObject("readRoom", result1);

		// 채팅참여자 정보
		List<Member> result2 = chatService.readMember(study_no);
		mv.addObject("readMember", result2);

		// 채팅 참여자 수
		int result3 = chatService.memberCnt(study_no);
		mv.addObject("memberCnt", result3);
		
		// 채팅 내용 조회
		List<Chat> result4 = chatService.selectChatting(study_no);
		mv.addObject("selectChatting", result4);
		
		mv.setViewName("chatting/selectroom");
		return mv;
	}
//	@GetMapping("/selectRoom")
//	@ResponseBody
//	public String selectRoom(String member_id) {
//		try {
//			return new Gson().toJson(chatService.selectRoom(member_id));
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "FAIN";
//		}
//	}
	
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
