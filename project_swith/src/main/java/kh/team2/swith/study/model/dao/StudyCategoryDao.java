package kh.team2.swith.study.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.study.model.vo.StudyCategory;

@Repository
public class StudyCategoryDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<StudyCategory> selectCategoryList(){
		return sqlSession.selectList("Study.selectCategoryList");
	}
}
