package kh.team2.swith.study.model.dao;

import java.util.List;

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
	
	public Study selectStudy(String study_no)  {
		return sqlSession.selectOne("Study.selectStudy", study_no);
	}
	
	//StudyComment
	public int insertStudyComment() {
		return 0;
	}
	public int updateStudyComment() {
		return 0;
	}
	public int deleteStudyComment() {
		return 0;
	}
	public StudyComment selectStudyComment() {
		return null;
	}
	public List<StudyComment> selectListStudyComment(){
		return null;
	}
	
	//TODO
//    public List<Study> findAllByOrderByCreatedAtDesc() {
//        return sqlSession.selectList("Study.findAllByOrderByCreatedAtDesc");
//    }
//    
//    
//    public List<Study> findAllByOrderByViewCountDesc() {
//        return sqlSession.selectList("Study.findAllByOrderByViewCountDesc");
//    }
//    
//    
//    public List<Study> findAllByOrderByLikeCountDesc() {
//        return sqlSession.selectList("Study.findAllByOrderByLikeCountDesc");
//    }
}
