package kh.team2.swith.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.chat.model.dao.ChatDAO;
import kh.team2.swith.chat.model.vo.Chat;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDAO dao;
	
	public List<Chat> selectRoom() {
		return dao.selectRoom();
	}
	
	public List<Chat> readMember() {
		return dao.readMember();
	}
	
	public int memberCnt(String study_no) {
		return dao.memberCnt(study_no);
	}
	
	public int insertChatting(Chat vo) {
		return dao.insertChatting(vo);
	}

	public List<Chat> selectChatting() {
		return dao.selectChatting();
	}
	
}
