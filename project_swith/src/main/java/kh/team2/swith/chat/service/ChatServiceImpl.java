package kh.team2.swith.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.chat.model.dao.ChatDAO;
import kh.team2.swith.chat.model.vo.Chat;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.study.model.vo.Study;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDAO dao;
	
	@Override
	public List<Study> selectRoom(String member_id) throws Exception {
		return dao.selectRoom(member_id);
	}

	@Override
	public List<Member> readMember(String study_no) throws Exception {
		return dao.readMember(study_no);
	}

	@Override
	public int memberCnt(String study_no) throws Exception {
		return dao.memberCnt(study_no);
	}

	@Override
	public int insertChatting(Chat vo) throws Exception {
		return dao.insertChatting(vo);
	}

	@Override
	public List<Chat> selectChatting(String study_no) throws Exception {
		return dao.selectChatting(study_no);
	}
	
}
