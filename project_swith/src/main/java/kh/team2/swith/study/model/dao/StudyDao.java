package kh.team2.swith.study.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.study.model.vo.Study;
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

	public Study selectStudy(String study_no) {
		return sqlSession.selectOne("Study.selectStudy", study_no);
	}

	// 게시글 조회
	public List<Study> postList(String selectedValue) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		return sqlSession.selectList("Study.postList", paramMap);
	}


	// StudyComment
	public int insertStudyComment(StudyComment vo) {
		return sqlSession.insert("Study.insertStudyComment", vo);
	}

	public int updateStudyComment(StudyComment vo) {
		return sqlSession.update("Study.updateStudyComment", vo);
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
	// comment count 추가 필요

}
