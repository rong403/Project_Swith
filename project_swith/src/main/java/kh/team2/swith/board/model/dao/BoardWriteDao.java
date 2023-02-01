package kh.team2.swith.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.board.model.vo.BoardWrite;

@Repository
public class BoardWriteDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBoard(BoardWrite vo) {
		//namespace.id 수정해야함
		return sqlSession.insert("board.insertBoard", vo);
	}
}
