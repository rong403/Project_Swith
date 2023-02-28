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
		return sqlSession.update("board.updateBoard", vo);
	}
	public int deleteBoard(int boardNum) throws Exception{
		return sqlSession.delete("board.deleteBoard", boardNum);
	}
	public BoardWrite selectBoard(int boardNum) throws Exception{
		return sqlSession.selectOne("board.selectBoard", boardNum);
	}
	public List<BoardWrite> selectListBoard() throws Exception{
		return sqlSession.selectList("board.selectListBoard");
	}
	public List<BoardWrite> selectListBoard(int currentPageNum, int limits) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPageNum", currentPageNum);
		map.put("limits", limits);
		return sqlSession.selectList("board.selectListBoardPage", map);
	}
	public List<BoardWrite> selectListBoard(int currentPageNum, int limits, String searchWord) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPageNum", currentPageNum);
		map.put("limits", limits);
		map.put("searchWord", searchWord);
		return sqlSession.selectList("board.selectListBoardSearch", map);
	}
	public int selectBoardCount() throws Exception {
		return sqlSession.selectOne("board.selectBoardCount");
	}
	
	//BoardComment
	public int insertBoardComment(int boardNum, BoardComment vo) throws Exception{
		return sqlSession.insert("board.insertBoardComment", vo);
	}
	public int updateBoardComment(int boardNum, BoardComment vo) throws Exception{
		return sqlSession.update("board.updateBoardComment", vo);
	}
	public int deleteBoardComment(int boardNum, int commentNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("commentNum", commentNum);
		return sqlSession.delete("board.deleteBoardComment", map);
	}
	public BoardComment selectBoardComment(int boardNum, int commentNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("commentNum", commentNum);
		return sqlSession.selectOne("board.selectBoardComment", map);
	}
	public List<BoardComment> selectListBoardComment(int boardNum) throws Exception{
		return sqlSession.selectList("board.selectListBoardComment", boardNum);
	}
	public int selectBoardCommentCount() throws Exception{
		return sqlSession.selectOne("board.selectBoardCommentCount");
	}
	
	//BoardAttachment
	public int insertBoardAttachment(BoardAttachment vo) throws Exception{
		return sqlSession.insert("board.insertBoardAttachment", vo);
	}
	public int updateBoardAttachment(BoardAttachment vo) throws Exception{
		return sqlSession.update("board.updateBoardAttachment", vo);
	}
	public int deleteBoardAttachment(int boardNum, int attachNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("attachNum", attachNum);
		return sqlSession.delete("board.deleteBoardAttachment", map);
	}
	public BoardAttachment selectBoardAttachment(int boardNum, int attachNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("attachNum", attachNum);
		return sqlSession.selectOne("board.selectBoardAttachment", map);
	}
	public List<BoardAttachment> selectListBoardAttachment(int boardNum) throws Exception{
		return sqlSession.selectList("board.selectListBoardAttachment", boardNum);
	}
	public int selectBoardAttachmentCount() throws Exception{
		return sqlSession.selectOne("board.selectBoardAttachmentCount");
	}
	
	//BoardCategory
	public BoardCategory selectBoardCategory(int categoryCode) throws Exception{
		return sqlSession.selectOne("board.selectBoardCategory", categoryCode);
	}
}