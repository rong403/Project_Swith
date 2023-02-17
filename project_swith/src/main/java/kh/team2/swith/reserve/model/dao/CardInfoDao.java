package kh.team2.swith.reserve.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.reserve.model.vo.CardInfoVo;

@Repository
public class CardInfoDao {
	@Autowired
	private SqlSession session;
	
	public int insertCardInfo(CardInfoVo vo) {
		return session.insert("cardInfo.insertCardInfo", vo);
	}
	
	public int updateCardInfo(CardInfoVo vo) {
		return session.update("cardInfo.updateCardInfo", vo);
	}
	
	public int deleteCardInfo(String tid) {
		return session.delete("cardInfo.deleteCardInfo", tid);
	}
	
	public CardInfoVo selectCardInfo(String tid) {
		return session.selectOne("cardInfo.selectCardInfo", tid);
	}
	
	public List<CardInfoVo> selectListCardInfo(){
		return session.selectList("cardInfo.selectListCardInfo");
	}
}
