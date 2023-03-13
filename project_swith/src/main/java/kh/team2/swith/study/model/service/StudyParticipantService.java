package kh.team2.swith.study.model.service;

import java.util.List;
import java.util.Map;

import kh.team2.swith.study.model.vo.StudyParticipant;

public interface StudyParticipantService {
	public int insert(int study_no, String member_id) throws Exception;
	public int delete(int agr_number) throws Exception;
	public int updateStudyParticipant(StudyParticipant vo) throws Exception;
	public int updateStudyParticipantTransfer(int auth_code, int agr_number) throws Exception;
	public StudyParticipant selectOneStudyParticipant(int agr_number) throws Exception;
	public StudyParticipant selectOneStudyParticipantMember(String member_id, int study_no) throws Exception;
	public Map<String,String> selectStudyParticipantPenaltyNo(int penalty_no) throws Exception;
	public Map<String,String> selectStudyParticipantAgrNo(int agr_number) throws Exception;
	public int selectStudyListCnt(int study_no) throws Exception;
	public List<StudyParticipant> selectStudyList(int study_no) throws Exception;
	public List<StudyParticipant> selectMemberList(String member_id) throws Exception;
}
