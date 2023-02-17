package kh.team2.swith.reserve.model.service;

import java.util.List;

import kh.team2.swith.reserve.model.vo.CardInfoVo;

public interface CardInfoService {
	public int insertCardInfo(CardInfoVo vo);
	public int updateCardInfo(CardInfoVo vo);
	public int deleteCardInfo(String tid);
	public CardInfoVo selectCardInfo(String tid);
	public List<CardInfoVo> selectListCardInfo();
}
