package kh.team2.swith.reserve.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.reserve.model.dao.CardInfoDao;
import kh.team2.swith.reserve.model.vo.CardInfoVo;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@Service
public class CardInfoServiceImpl implements CardInfoService{
	@Autowired
	private CardInfoDao dao;
	
	@Override
	public int insertCardInfo(CardInfoVo vo) {
		return dao.insertCardInfo(vo);
	}

	@Override
	public int updateCardInfo(CardInfoVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCardInfo(String tid) {
		return dao.deleteCardInfo(tid);
	}

	@Override
	public CardInfoVo selectCardInfo(String tid) {
		return dao.selectCardInfo(tid);
	}

	@Override
	public List<CardInfoVo> selectListCardInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	//관리자 페이지 스터디 카페/룸 삭제시
	@Override
	public int deleteCardInfoPlaceRoomDelete(List<ReserveInfo> reserveList) throws Exception {
		return dao.deleteCardInfoPlaceRoomDelete(reserveList);
	}
}
