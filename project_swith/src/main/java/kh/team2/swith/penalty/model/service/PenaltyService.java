package kh.team2.swith.penalty.model.service;

import java.util.List;

import kh.team2.swith.penalty.model.vo.Penalty;

public interface PenaltyService {
	//벌점
	public int insertPenalty(Penalty vo) throws Exception;
	public int deletePenalty(int penalty_no) throws Exception;
	public int updatePenalty(Penalty vo) throws Exception;
	public Penalty selectPenalty(int penalty_no) throws Exception;
	public List<Penalty> selectPenaltyList(int agr_number) throws Exception;
	
	//벌점 취소
	public int insertPenaltyCancel(Penalty vo) throws Exception;
	public Penalty selectPenaltyCancel(int penalty_no) throws Exception;
	public List<Penalty> selectPenaltyCancelList(int agr_number) throws Exception;
}
