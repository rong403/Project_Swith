package kh.team2.swith.study.model.dao;

import java.util.List;

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
	
	public List<Study> selectListStudy() {
		return session.selectList("Study.selectListStudy");
	}
	
	public Study selectStudy(String study_no)  {
		return session.selectOne("Study.selectStudy", study_no);
	}
}
