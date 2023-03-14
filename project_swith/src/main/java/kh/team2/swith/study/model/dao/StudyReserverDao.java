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
		return sqlSession.insert("Study.insertStudyReserver", vo);
	}

	public int delete(int study_no, String member_id) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("study_no", study_no);
		resultMap.put("member_id", member_id);
		return sqlSession.delete("Study.deleteStudyReserver", resultMap);
	}
	
	public int update(int study_no, String member_id, int req_condition) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("study_no", study_no);
		resultMap.put("member_id", member_id);
		resultMap.put("req_condition", req_condition);
		return sqlSession.update("Study.updateStudyReserver", resultMap);
	}

	public int selectStudyReserverCondition(String study_no, String member_id) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("study_no", study_no);
		resultMap.put("member_id", member_id);
		return sqlSession.selectOne("Study.selectStudyReserverCondition", resultMap);
	}
	
	public List<Object> selectStudyReserverList(String member_id) throws Exception {
		return sqlSession.selectList("Study.selectStudyReserverList3", member_id);
	}
	
	public StudyReserver selectOne(int study_no, String member_id) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("study_no", study_no);
		resultMap.put("member_id", member_id);
		return sqlSession.selectOne("Study.selectOneStudyReserver", resultMap);
	}

	public List<StudyReserver> selectStudyList(int study_no) throws Exception {
		return sqlSession.selectList("Study.selectStudyReserverList1", study_no);
	}

	public List<StudyReserver> selectMemberList(String member_id) throws Exception {
		return sqlSession.selectList("Study.selectStudyReserverList2", member_id);
	}
}
