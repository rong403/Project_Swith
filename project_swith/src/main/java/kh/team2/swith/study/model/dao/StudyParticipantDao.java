package kh.team2.swith.study.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.study.model.vo.StudyParticipant;

@Repository
public class StudyParticipantDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(int study_no, String member_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("study_no", study_no);
		map.put("member_id", member_id);
		return sqlSession.insert("Study.insertStudyParticipant", map);
	}

	public int delete(int agr_number) throws Exception {
		return sqlSession.delete("Study.deleteStudyParticipant", agr_number);
	}
	
	public int updateStudyParticipant(StudyParticipant vo) throws Exception {
		return sqlSession.update("Study.updateStudyParticipant", vo);
	}
	
	public int updateStudyParticipantTransfer(int auth_code, int agr_number) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("auth_code", auth_code);
		map.put("agr_number", agr_number);
		return sqlSession.update("Study.updateStudyParticipantTransfer", map);
	}
	
	public Map<String,String> selectStudyParticipantPenaltyNo(int penalty_no) throws Exception {
		return sqlSession.selectOne("Study.selectStudyParticipantPenaltyNo", penalty_no);
	}
	
	public Map<String, String> selectStudyParticipantAgrNo(int agr_number) throws Exception {
		return sqlSession.selectOne("Study.selectStudyParticipantAgrNo", agr_number);
	}
	public StudyParticipant selectOneStudyParticipant(int agr_number) throws Exception {
		return sqlSession.selectOne("Study.selectOneStudyParticipant", agr_number);
	}
	public StudyParticipant selectOneStudyParticipantMember(String member_id, int study_no) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("study_no", study_no);
		return sqlSession.selectOne("Study.selectOneStudyParticipantMember", map);
	}
	
	public int selectStudyListCnt(int study_no) throws Exception {
		return sqlSession.selectOne("Study.selectStudyParticipantCnt1", study_no);
	}
	
	public List<StudyParticipant> selectStudyList(int study_no) throws Exception {
		return sqlSession.selectList("Study.selectStudyParticipantList1", study_no);
	}

	public List<StudyParticipant> selectMemberList(String member_id) throws Exception {
		return sqlSession.selectList("Study.selectStudyParticipantList2", member_id);
	}
}
