package kh.team2.swith.study.model.service;

import java.util.List;
import java.util.Map;

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
	public Map<String, String> selectStudyParticipantPenaltyNo(int penalty_no) throws Exception {
		return dao.selectStudyParticipantPenaltyNo(penalty_no);
	}
	
	@Override
	public Map<String, String> selectStudyParticipantAgrNo(int agr_number) throws Exception {
		return dao.selectStudyParticipantAgrNo(agr_number);
	}

	@Override
	public int updateStudyParticipant(int auth_code, int agr_number) throws Exception {
		return dao.updateStudyParticipant(auth_code, agr_number);
	}

	@Override
	public StudyParticipant selectOneStudyParticipant(int agr_number) throws Exception {
		return dao.selectOneStudyParticipant(agr_number);
	}

	@Override
	public StudyParticipant selectOneStudyParticipantMember(String member_id, int study_no) throws Exception {
		return dao.selectOneStudyParticipantMember(member_id, study_no);
	}


	@Override
	public int selectStudyListCnt(int study_no) throws Exception {
		return dao.selectStudyListCnt(study_no);
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
