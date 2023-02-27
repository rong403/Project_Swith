package kh.team2.swith.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.board.model.vo.BoardAttachment;
import kh.team2.swith.board.model.vo.BoardCategory;
import kh.team2.swith.board.model.vo.BoardComment;
import kh.team2.swith.board.model.vo.BoardWrite;

@Repository
public class BoardWriteDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBoard(BoardWrite vo) throws Exception {
		//namespace.id 수정해야함
		return sqlSession.insert("board.insertBoard", vo);
	}
	public int updateBoard(BoardWrite vo) throws Exception{
		return sqlSession.update("", vo);
	}
	public int deleteBoard(int boardNum) throws Exception{
		return sqlSession.delete("", boardNum);
	}
	public BoardWrite selectBoard(int boardNum) throws Exception{
		return sqlSession.selectOne("", boardNum);
	}
	public List<BoardWrite> selectListBoard() throws Exception{
		return sqlSession.selectList("");
	}
	public List<BoardWrite> selectListBoard(int currentPageNum, int limits) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPageNum", currentPageNum);
		map.put("limits", limits);
		return sqlSession.selectList("", map);
	}
	public List<BoardWrite> selectListBoard(int currentPageNum, int limits, String searchWord) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPageNum", currentPageNum);
		map.put("limits", limits);
		map.put("searchWord", searchWord);
		return sqlSession.selectList("", map);
	}
	public int selectBoardCount() throws Exception {
		return 0;
	}
	public int insertBoardComment(int boardNum, BoardComment vo) throws Exception{
		return sqlSession.insert("", vo);
	}
	public int updateBoardComment(int boardNum, BoardComment vo) throws Exception{
		return sqlSession.update("", vo);
	}
	public int deleteBoardComment(int boardNum, int commentNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("commentNum", commentNum);
		return sqlSession.delete("", map);
	}
	public BoardComment selectBoardComment(int boardNum, int commentNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("commentNum", commentNum);
		return sqlSession.selectOne("", map);
	}
	public List<BoardComment> selectListBoardComment(int boardNum) throws Exception{
		return sqlSession.selectList("", boardNum);
	}
	public int selectBoardCommentCount() throws Exception{
		return 0;
	}
	public int insertBoardAttachment(BoardAttachment vo) throws Exception{
		return sqlSession.insert("", vo);
	}
	public int updateBoardAttachment(BoardAttachment vo) throws Exception{
		return sqlSession.update("", vo);
	}
	public int deleteBoardAttachment(int boardNum, int attachNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("attachNum", attachNum);
		return sqlSession.delete("", map);
	}
	public BoardAttachment selectBoardAttachment(int boardNum, int attachNum) throws Exception{
		return null;
	}
	public List<BoardAttachment> selectListBoardAttachment(int boardNum) throws Exception{
		return null;
	}
	public int selectBoardAttachmentCount() throws Exception{
		return 0;
	}
	public BoardCategory selectBoardCategory(int categoryCode) throws Exception{
		return null;
	}
}