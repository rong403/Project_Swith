package kh.team2.swith.chat.service;

import java.util.List;

import kh.team2.swith.chat.model.vo.Chat;

public interface ChatService {
	public abstract List<Chat> selectRoom();
	public abstract List<Chat> readMember();
	public abstract int memberCnt(String study_no);
	public abstract int insertChatting(Chat vo);
	public abstract List<Chat> selectChatting();

}
