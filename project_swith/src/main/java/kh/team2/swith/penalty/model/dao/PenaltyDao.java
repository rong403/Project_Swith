package kh.team2.swith.penalty.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.penalty.model.vo.Penalty;

@Repository
public class PenaltyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//벌점
	public int insertPenalty(Penalty vo) throws Exception {
		return  sqlSession.insert("penalty.insertPenalty", vo);
	}
	public int deletePenalty(int penalty_no) throws Exception {
		return  sqlSession.delete("penalty.deletePenalty", penalty_no);
	}
	public int updatePenalty(Penalty vo) throws Exception {
		return  sqlSession.update("penalty.updatePenalty", vo);
	}
	public Penalty selectPenalty(int penalty_no) throws Exception {
		return  sqlSession.selectOne("penalty.selectPenalty", penalty_no);
	}
	public List<Penalty> selectPenaltyList(int agr_number) throws Exception {
		return  sqlSession.selectList("penalty.selectPenaltyList", agr_number);
	}
	
	//벌점 취소
	public int insertPenaltyCancel(Penalty vo) throws Exception {
		return sqlSession.insert("penalty.insertPenaltyCancel", vo);
	}

	public Penalty selectPenaltyCancel(int penalty_no) throws Exception {
		return sqlSession.selectOne("penalty.selectPenaltyCancel", penalty_no);
	}

	public List<Penalty> selectPenaltyCancelList(int agr_number) throws Exception {
		return sqlSession.selectList("penalty.selectPenaltyCancelList", agr_number);
	}
}
