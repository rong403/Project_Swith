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
		return sqlSession.insert("studyParticipant.insert", vo);
	}

	public int delete(int agr_number) throws Exception {
		return sqlSession.delete("studyParticipant.delete", agr_number);
	}

	public int update(StudyParticipant vo) throws Exception {
		return sqlSession.update("studyParticipant.update", vo);
	}
	
	public StudyParticipant selectOne(int agr_number) throws Exception {
		return sqlSession.selectOne("studyParticipant.selectOne", agr_number);
	}

	public List<StudyParticipant> selectStudyList(int study_no) throws Exception {
		return sqlSession.selectList("studyParticipant.selectStudyList", study_no);
	}

	public List<StudyParticipant> selectMemberList(String member_id) throws Exception {
		return sqlSession.selectList("studyParticipant.selectMemberList", member_id);
	}
}
