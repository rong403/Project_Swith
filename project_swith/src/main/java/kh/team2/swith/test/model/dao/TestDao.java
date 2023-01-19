package kh.team2.swith.test.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.test.model.vo.TestVo;

@Repository
public class TestDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertTest(TestVo vo) {
		return sqlSession.insert("Test.insertTest", vo);
	}
}
