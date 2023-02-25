package kh.team2.swith.study.model.service;

import java.util.List;

import kh.team2.swith.study.model.vo.StudyParticipant;

public interface StudyParticipantService {
	public int insert(StudyParticipant vo) throws Exception;
	public int delete(int agr_number) throws Exception;
	public int update(StudyParticipant vo) throws Exception;
	public StudyParticipant selectOne(int agr_number) throws Exception;
	public int selectStudyListCnt(int study_no) throws Exception;
	public List<StudyParticipant> selectStudyList(int study_no) throws Exception;
	public List<StudyParticipant> selectMemberList(String member_id) throws Exception;
}
