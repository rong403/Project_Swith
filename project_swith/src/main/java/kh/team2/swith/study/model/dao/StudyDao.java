package kh.team2.swith.study.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.study.model.vo.Study;
import kh.team2.swith.study.model.vo.StudyAdmin;
import kh.team2.swith.study.model.vo.StudyComment;

@Repository
public class StudyDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertStudy(Study vo) {
		return sqlSession.insert("Study.insertStudy", vo);
	}

	public List<Study> selectListStudy() {
		return sqlSession.selectList("Study.selectListStudy");
	}
	public List<Study> selectListStudy(int cateCode, String searchInput) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateCode", cateCode);
		map.put("searchInput", searchInput);
		return sqlSession.selectList("Study.selectListStudy", map);
	}
	public List<Study> selectListMyStudy(String member_id) {
		return sqlSession.selectList("Study.selectListMyStudy", member_id);
	}

	
	public Study selectStudy(String study_no) {
		return sqlSession.selectOne("Study.selectStudy", study_no);
	}

	public int insertStudyCreateParticipant(String member_id) {
		return sqlSession.insert("Study.insertStudyCreateParticipant", member_id);
	}
	// 게시글 조회
	public List<Study> postList(String selectedValue) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		return sqlSession.selectList("Study.postList", paramMap);
	}
	
	//관리자 페이지 start - homin
	public List<StudyAdmin> selectListAdmin(String study_keyword, int study_category, int study_condition, int currentPage, int limit) throws Exception {
		int offset = (currentPage - 1)*limit; //시작 행
		RowBounds row = new RowBounds(offset, limit); // Rowbounds 객체
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("study_keyword", study_keyword);
		resultMap.put("study_category", study_category);
		resultMap.put("study_condition", study_condition);
		return sqlSession.selectList("Study.selectListAdmin", resultMap, row);
	}
	public int selectListAdminCnt(String study_keyword, int study_category, int study_condition) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("study_keyword", study_keyword);
		resultMap.put("study_category", study_category);
		resultMap.put("study_condition", study_condition);
		
		return sqlSession.selectOne("Study.selectListAdminCnt", resultMap);
	}
	//관리자 페이지 end - homin


	// StudyComment
	public int insertStudyComment(StudyComment vo) {
		return sqlSession.insert("Study.insertStudyComment", vo);
	}

	public int updateStudyComment(StudyComment vo) {
		return sqlSession.update("Study.updateStudyComment", vo);
	}
	
	public int updateMyStudyComment(StudyComment vo) {
		return sqlSession.update("Study.updateMyStudyComment", vo);
	}

	public int deleteStudyComment(int study_no, String member_id, int study_comment_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("study_no", study_no);
		map.put("member_id", member_id);
		map.put("study_comment_no", study_comment_no);
		return sqlSession.delete("Study.deleteStudyComment", map);
	}

	public StudyComment selectStudyComment(int study_no, String member_id, int study_comment_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("study_no", study_no);
		map.put("member_id", member_id);
		map.put("study_comment_no", study_comment_no);
		return sqlSession.selectOne("Study.selectStudyComment", map);
	}

	public List<StudyComment> selectListStudyComment(int study_no) {
		return sqlSession.selectList("Study.selectListStudyComment", study_no);
	}

	public List<StudyComment> selectListAllStudyComment() {
		return sqlSession.selectList("Study.selectListAllStudyComment");
	}
	public int selectStudyCommentCount() {
		return sqlSession.selectOne("Study.selectStudyCommentCount");
	}
	
	public int selectMinSeq(int study_comment_origin, int study_comment_level, int study_comment_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("study_comment_origin", study_comment_origin);
		map.put("study_comment_level", study_comment_level);
		map.put("study_comment_seq", study_comment_seq);
		return sqlSession.selectOne("Study.selectMinSeq", map);
	}
	public int selectReplyMaxSeq(int study_comment_origin) {
		return sqlSession.selectOne("Study.selectReplyMaxSeq", study_comment_origin);
	}
	public int updateReplySeq(int study_comment_origin, int check) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("study_comment_origin", study_comment_origin);
		map.put("check", check);
		return sqlSession.update("Study.updateReplySeq", map);
	}
	public int insertReplyComment(StudyComment vo) {
		return sqlSession.insert("Study.insertReplyComment", vo);
	}
	
	public int countCheckStudyAdmin(String member_id, String study_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("study_no", study_no);
		return sqlSession.selectOne("Study.countCheckStudyAdmin", map);
	}
	
	public Map<String,String> selectStudyParticipantPenaltyNo(int penalty_no) throws Exception {
		return sqlSession.selectOne("Study.selectStudyParticipantPenaltyNo", penalty_no);
	}

}
