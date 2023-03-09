package kh.team2.swith.reserve.model.service;

import java.util.List;

import kh.team2.swith.reserve.model.vo.CardInfoVo;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

public interface CardInfoService {
	public int insertCardInfo(CardInfoVo vo);
	public int updateCardInfo(CardInfoVo vo);
	public int deleteCardInfo(String tid);
	public CardInfoVo selectCardInfo(String tid);
	public List<CardInfoVo> selectListCardInfo();
	
	//관리자 페이지 스터디 카페/룸 삭제시
	public int deleteCardInfoPlaceRoomDelete(List<ReserveInfo> reserveList) throws Exception;
}
