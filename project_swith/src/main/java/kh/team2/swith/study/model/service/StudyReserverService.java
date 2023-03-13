package kh.team2.swith.study.model.service;

import java.util.List;

import kh.team2.swith.study.model.vo.StudyReserver;

public interface StudyReserverService {
	public int insert(StudyReserver vo) throws Exception;
	public int delete(int study_no, String member_id) throws Exception;
	public int update(int study_no, String member_id, int req_condition) throws Exception;
	public int selectStudyReserverCondition(String study_no, String member_id) throws Exception;
	public StudyReserver selectOne(int study_no, String member_id) throws Exception;
	public List<StudyReserver> selectStudyList(int study_no) throws Exception;
	public List<StudyReserver> selectMemberList(String member_id) throws Exception;
}
