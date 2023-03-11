package kh.team2.swith.study.model.service;

import java.util.List;
import java.util.Map;

import kh.team2.swith.study.model.vo.Study;
import kh.team2.swith.study.model.vo.StudyAdmin;
import kh.team2.swith.study.model.vo.StudyComment;
import kh.team2.swith.study.model.vo.StudyParticipant;

public interface StudyService {
	//Study
	public int insertStudy(Study vo) throws Exception;
	public List<Study> selectListStudy() throws Exception;
	public List<Study> selectListStudy(int cateCode, String searchInput) throws Exception;
	public List<Study> selectListMyStudy(String member_id) throws Exception;
	public Study selectStudy(String study_no) throws Exception;
	public List<Study> postList(String studyName) throws Exception;
	public List<StudyAdmin> selectListAdmin(String study_keyword, int study_category, int study_condition, int currentPage, int limit) throws Exception;
	public int selectListAdminCnt(String study_keyword, int study_category, int study_condition) throws Exception;
	public int insertStudyCreateParticipant(String member_id) throws Exception;
	
	//StudyComment
	public int insertStudyComment(StudyComment vo) throws Exception;
	public int updateStudyComment(StudyComment vo) throws Exception;
	public int updateMyStudyComment(StudyComment vo) throws Exception;
	public int deleteStudyComment(int study_no, String member_id, int study_comment_no) throws Exception;
	public StudyComment selectStudyComment(int study_no, String member_id, int study_comment_no) throws Exception;
	public List<StudyComment> selectListStudyComment(String study_no) throws Exception;
	public List<StudyComment> selectListAllStudyComment() throws Exception;
	public int insertRelyComment(StudyComment vo) throws Exception;
	public int countCheckStudyAdmin(String member_id, String study_no) throws Exception;
	
	//StudyParticipant
	public int updateStudyParticipant(int auth_code, int agr_number) throws Exception;
	public StudyParticipant selectOneStudyParticipant(int agr_number) throws Exception;
	public Map<String,String> selectStudyParticipantPenaltyNo(int penalty_no) throws Exception;
	public Map<String,String> selectStudyParticipantAgrNo(int agr_number) throws Exception;

}
