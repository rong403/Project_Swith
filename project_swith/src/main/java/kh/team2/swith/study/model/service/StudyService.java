package kh.team2.swith.study.model.service;

import java.util.List;

import kh.team2.swith.study.model.vo.Study;
import kh.team2.swith.study.model.vo.StudyAdmin;
import kh.team2.swith.study.model.vo.StudyComment;

public interface StudyService {
	//Study
	public int insertStudy(Study vo) throws Exception;
	public List<Study> selectListStudy() throws Exception;
	public Study selectStudy(String study_no) throws Exception;
	public List<Study> postList(String selectedValue) throws Exception;
	public List<StudyAdmin> selectListAdmin(String study_keyword, int study_category, int study_condition, int currentPage, int limit) throws Exception;
	public int selectListAdminCnt(String study_keyword, int study_category, int study_condition) throws Exception;
	
	
	//StudyComment
	public int insertStudyComment(StudyComment vo) throws Exception;
	public int updateStudyComment(StudyComment vo) throws Exception;
	public int deleteStudyComment(int study_no, String member_id, int study_comment_no) throws Exception;
	public StudyComment selectStudyComment(int study_no, String member_id, int study_comment_no) throws Exception;
	public List<StudyComment> selectListStudyComment(int study_no) throws Exception;
	public List<StudyComment> selectListAllStudyComment() throws Exception;
	//comment count 추가 필요

}
