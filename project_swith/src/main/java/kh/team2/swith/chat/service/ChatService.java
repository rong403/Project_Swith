package kh.team2.swith.chat.service;

import java.util.List;

import kh.team2.swith.chat.model.vo.Chat;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.study.model.vo.Study;

public interface ChatService {
	
	// 채팅방 리스트
	List<Study> selectRoom(String member_id) throws Exception;
	// 채팅방 정보
	Study readRoom(String study_no) throws Exception;
	// 채팅 참여자 정보
	List<Member> readMember(String study_no) throws Exception;
	// 채팅방 멤버수
	int memberCnt(String study_no) throws Exception;
	// 채팅 DB 등록
	int insertChatting(Chat vo) throws Exception;
	// 채팅 내용 조회
	List<Chat> selectChatting(String study_no) throws Exception;

}
