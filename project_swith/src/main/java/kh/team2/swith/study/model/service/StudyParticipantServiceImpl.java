package kh.team2.swith.study.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.study.model.dao.StudyParticipantDao;
import kh.team2.swith.study.model.vo.StudyParticipant;

@Service
public class StudyParticipantServiceImpl implements StudyParticipantService {

	@Autowired
	private StudyParticipantDao dao;
	
	@Override
	public int insert(StudyParticipant vo) throws Exception {
		return dao.insert(vo);
	}

	@Override
	public int delete(int agr_number) throws Exception {
		return dao.delete(agr_number);
	}

	@Override
	public int update(StudyParticipant vo) throws Exception {
		return dao.update(vo);
	}

	@Override
	public StudyParticipant selectOne(int agr_number) throws Exception {
		return dao.selectOne(agr_number);
	}

	@Override
	public List<StudyParticipant> selectStudyList(int study_no) throws Exception {
		return dao.selectStudyList(study_no);
	}

	@Override
	public List<StudyParticipant> selectMemberList(String member_id) throws Exception {
		return dao.selectMemberList(member_id);
	}

}
