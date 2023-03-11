package kh.team2.swith.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.chat.model.vo.Chat;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Chat> selectRoom() {
		return sqlSession.selectList("Chatting.selectRoom");
	}
	
	public List<Chat> readMember() {
		return sqlSession.selectList("Chatting.readMember");
	}
	
	public int memberCnt(String study_no) {
		return sqlSession.selectOne("Chatting.memberCnt", study_no);
	}
	
	public int insertChatting(Chat vo) {
		return sqlSession.insert("Chatting.insertChatting", vo);
	}
	
	public List<Chat> selectChatting() {
		return sqlSession.selectList("Chatting.selectChatting");
	}
}
