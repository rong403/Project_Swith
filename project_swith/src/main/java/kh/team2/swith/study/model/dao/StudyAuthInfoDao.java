package kh.team2.swith.study.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.study.model.vo.StudyAuthInfo;

@Repository
public class StudyAuthInfoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public StudyAuthInfo selectOne(int auth_code) throws Exception {
		return sqlSession.selectOne("studyAuthInfo.selectOne", auth_code);
	}

	public List<StudyAuthInfo> selectList() throws Exception {
		return sqlSession.selectList("studyAuthInfo.selectList");
	}
}
