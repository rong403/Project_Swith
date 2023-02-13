package kh.team2.swith.study.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.study.model.vo.Study;

@Repository
public class StudyDao {
	@Autowired
	private SqlSession session;
	
	public int insertStudy(Study vo) {
		return session.insert("Study.insertStudy", vo);
	}
}
