package kh.team2.swith.penalty.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.penalty.model.dao.PenaltyDao;
import kh.team2.swith.penalty.model.vo.Penalty;

@Service
public class PenaltyServiceImpl implements PenaltyService {

	@Autowired
	private PenaltyDao dao;
	
	//벌점
	@Override
	public int insertPenalty(Penalty vo) throws Exception {
		return dao.insertPenalty(vo);
	}

	@Override
	public int deletePenalty(int penalty_no) throws Exception {
		return dao.deletePenalty(penalty_no);
	}

	@Override
	public int updatePenalty(Penalty vo) throws Exception {
		return dao.updatePenalty(vo);
	}

	@Override
	public Penalty selectPenalty(int penalty_no) throws Exception {
		return dao.selectPenalty(penalty_no);
	}

	@Override
	public List<Penalty> selectPenaltyList(int agr_number) throws Exception {
		return dao.selectPenaltyList(agr_number);
	}

	
	//벌점 취소
	@Override
	public int insertPenaltyCancel(Penalty vo) throws Exception {
		return dao.insertPenaltyCancel(vo);
	}

	@Override
	public Penalty selectPenaltyCancel(int penalty_no) throws Exception {
		return dao.selectPenaltyCancel(penalty_no);
	}

	@Override
	public List<Penalty> selectPenaltyCancelList(int agr_number) throws Exception {
		return dao.selectPenaltyCancelList(agr_number);
	}

}
