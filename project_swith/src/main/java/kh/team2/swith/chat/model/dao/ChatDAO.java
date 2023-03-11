package kh.team2.swith.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.chat.model.vo.Chat;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.study.model.vo.Study;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 채팅방 리스트
	public List<Study> selectRoom(String member_id) {
		return sqlSession.selectList("Chatting.selectRoom", member_id);
	}
	// 채팅방 정보
	public Study readRoom(String study_no) throws Exception {
		return sqlSession.selectOne("Chatting.readRoom", study_no);
	}
	// 채팅 참여자 정보
	public List<Member> readMember(String study_no) {
		return sqlSession.selectList("Chatting.readMember", study_no);
	}
	
	// 채팅방 멤버수
	public int memberCnt(String study_no) {
		return sqlSession.selectOne("Chatting.memberCnt", study_no);
	}
	
	// 채팅 DB 등록
	public int insertChatting(Chat vo) {
		return sqlSession.insert("Chatting.insertChatting", vo);
	}
	
	// 채팅 내용 조회
	public List<Chat> selectChatting(String study_no) {
		return sqlSession.selectList("Chatting.selectChatting", study_no);
	}
}
