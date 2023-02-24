package kh.team2.swith.study.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.study.model.vo.StudyReserver;

@Repository
public class StudyReserverDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(StudyReserver vo) throws Exception {
		return sqlSession.insert("studyReserver.insert", vo);
	}

	public int delete(int study_no, String member_id) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("study_no", study_no);
		resultMap.put("member_id", member_id);
		return sqlSession.delete("studyReserver.delete", resultMap);
	}

	public StudyReserver selectOne(int study_no, String member_id) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("study_no", study_no);
		resultMap.put("member_id", member_id);
		return sqlSession.selectOne("studyReserver.selectOne", resultMap);
	}

	public List<StudyReserver> selectStudyList(int study_no) throws Exception {
		return sqlSession.selectList("studyReserver.selectStudyList", study_no);
	}

	public List<StudyReserver> selectMemberList(String member_id) throws Exception {
		return sqlSession.selectList("studyReserver.selectMemberList", member_id);
	}
}
