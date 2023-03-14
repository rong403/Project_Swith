package kh.team2.swith.study.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.study.model.dao.StudyReserverDao;
import kh.team2.swith.study.model.vo.StudyReserver;

@Service
public class StudyReserverServiceImpl implements StudyReserverService {

	@Autowired
	private StudyReserverDao dao;
	
	@Override
	public int insert(StudyReserver vo) throws Exception {
		return dao.insert(vo);
	}

	@Override
	public int delete(int study_no, String member_id) throws Exception {
		return dao.delete(study_no, member_id);
	}

	@Override
	public int update(int study_no, String member_id, int req_condition) throws Exception {
		return dao.update(study_no, member_id, req_condition);
	}

	@Override
	public int selectStudyReserverCondition(String study_no, String member_id) throws Exception {
		return dao.selectStudyReserverCondition(study_no, member_id);
	}
	
	@Override
	public List<Object> selectStudyReserverList(String member_id) throws Exception {
		return dao.selectStudyReserverList(member_id);
	}
	
	@Override
	public StudyReserver selectOne(int study_no, String member_id) throws Exception {
		return dao.selectOne(study_no, member_id);
	}

	@Override
	public List<StudyReserver> selectStudyList(int study_no) throws Exception {
		return dao.selectStudyList(study_no);
	}

	@Override
	public List<StudyReserver> selectMemberList(String member_id) throws Exception {
		return dao.selectMemberList(member_id);
	}
}
