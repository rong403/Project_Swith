package kh.team2.swith.study.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.study.model.vo.StudyParticipant;

@Repository
public class StudyParticipantDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(StudyParticipant vo) throws Exception {
		return sqlSession.insert("Study.insertStudyParticipant", vo);
	}

	public int delete(int agr_number) throws Exception {
		return sqlSession.delete("Study.deleteStudyParticipant", agr_number);
	}

	public int update(StudyParticipant vo) throws Exception {
		return sqlSession.update("Study.updateStudyParticipant", vo);
	}
	
	public StudyParticipant selectOne(int agr_number) throws Exception {
		return sqlSession.selectOne("Study.selectOneStudyParticipant", agr_number);
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
