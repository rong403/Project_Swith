package kh.team2.swith.chat.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("echo")
public class EchoHandler extends TextWebSocketHandler {
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
			sess.sendMessage(new TextMessage(arr[0]+","+arr[1]));
		}

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
//			HttpServletRequest req
			Principal principal
			) {
		// 로그인한 사람 정보 가져오기(이름)
		
		mv.addObject("memberId", principal.getName());
		
//		// 로그인한 사람 빼고 친구 리스트 출력
//		List<Chatting> result = service.selectEmpList(emp_no);
//		mv.addObject("selectEmpList", result);
//
//		// 로그인한 사람 정보 출력
//		Chatting result2 = service.selectOne(emp_no);
//		mv.addObject("selectOne", result2);
//
//		// 채팅방 리스트 출력
//		List<Chatting> result3 = service.selectRoom(emp_no);
//		mv.addObject("selectRoom", result3);
		
		mv.setViewName("chatting/select");
		return mv;
	}
	
	@GetMapping("selectroom")
	public ModelAndView selectRoom(
			ModelAndView mv,
//			HttpServletRequest req
			Principal principal
			) {
		// 로그인한 사람 정보 가져오기(이름)
		mv.addObject("memberId", principal.getName());
		mv.setViewName("chatting/selectroom");
		return mv;
	}


}
