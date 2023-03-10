package kh.team2.swith.study.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.study.model.dao.StudyDao;
import kh.team2.swith.study.model.vo.Study;
import kh.team2.swith.study.model.vo.StudyAdmin;
import kh.team2.swith.study.model.vo.StudyComment;
import kh.team2.swith.study.model.vo.StudyParticipant;

@Service
public class StudyServiceImpl implements StudyService{
	@Autowired
	private StudyDao dao;
	
	//Study
	@Override
	public int insertStudy(Study vo) throws Exception{
		return dao.insertStudy(vo);
	}

	@Override
	public int insertStudyCreateParticipant(String member_id) throws Exception{
		return dao.insertStudyCreateParticipant(member_id);
	}
	@Override
	public List<Study> selectListStudy() throws Exception {
		return dao.selectListStudy();
	}
	@Override
	public List<Study> selectListStudy(int cateCode, String searchInput) throws Exception {
		return dao.selectListStudy(cateCode,searchInput);
	}
	@Override
	public List<Study> selectListMyStudy(String member_id) throws Exception {
		return dao.selectListMyStudy( member_id);
	}

	@Override
	public Study selectStudy(String study_no) throws Exception {
		return dao.selectStudy(study_no);
	}
	
	//TODO
	@Override
	public List<Study> postList(String selectedValue) throws Exception {
        return dao.postList(selectedValue);
    }
	
	//관리자 페이지 start - homin
	@Override
	public List<StudyAdmin> selectListAdmin(String study_keyword, int study_category, int study_condition, int currentPage, int limit) throws Exception {
		return dao.selectListAdmin(study_keyword, study_category, study_condition, currentPage, limit);
	}
	@Override
	public int selectListAdminCnt(String study_keyword, int study_category, int study_condition) throws Exception {
		return dao.selectListAdminCnt(study_keyword, study_category, study_condition);
	}

	@Override
	public int updateStudyRecruitmentCondition(int study_no, int study_recruitment_condition) throws Exception {
		return dao.updateStudyRecruitmentCondition(study_no, study_recruitment_condition);
	}
	//관리자 페이지 end - homin
	
	
	//StudyComment
	@Override
	public int insertStudyComment(StudyComment vo) throws Exception {
		return dao.insertStudyComment(vo);
	}

	@Override
	public int updateStudyComment(StudyComment vo) throws Exception {
		return dao.updateStudyComment(vo);
	}

	@Override
	public int deleteStudyComment(int study_no, String member_id, int study_comment_no) throws Exception {
		return dao.deleteStudyComment(study_no, member_id, study_comment_no);
	}

	@Override
	public StudyComment selectStudyComment(int study_no, String member_id, int study_comment_no) throws Exception {
		return dao.selectStudyComment(study_no, member_id, study_comment_no);
	}

	@Override
	public List<StudyComment> selectListStudyComment(String std_no) throws Exception {
		int study_no = Integer.parseInt(std_no);
		List<StudyComment> list = dao.selectListStudyComment(study_no);
		return list;
	}

	@Override
	public List<StudyComment> selectListAllStudyComment() throws Exception {
		return dao.selectListAllStudyComment();
	}

	@Override
	public int insertRelyComment(StudyComment vo) throws Exception {
		int origin = vo.getStudy_comment_origin();
		int level = vo.getStudy_comment_level();
		int seq = vo.getStudy_comment_seq();
		int check = dao.selectMinSeq(origin, level, seq);
		if(check!=0) {
			int updateSeq = dao.updateReplySeq(origin, check);
			vo.setStudy_comment_seq(check);
		}else {
			int result = dao.selectReplyMaxSeq(origin);
			vo.setStudy_comment_seq(result);
		}
		vo.setStudy_comment_level(level + 1);
		return dao.insertReplyComment(vo);
	}

	@Override
	public int countCheckStudyAdmin(String member_id, String study_no) throws Exception {
		return dao.countCheckStudyAdmin(member_id, study_no);
	}

	@Override
	public int updateMyStudyComment(StudyComment vo) throws Exception {
		return dao.updateMyStudyComment(vo);
	}

	@Override
	public int countCheckStudyPartidipant(String member_id, String study_no) throws Exception {
		return dao.countCheckStudyPartidipant(member_id, study_no);
	}

}
