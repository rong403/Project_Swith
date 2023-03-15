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
import kh.team2.swith.board.model.vo.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBoard(Board vo) throws Exception {
		//namespace.id 수정해야함
		return sqlSession.insert("board.insertBoard", vo);
	}
	public int updateBoard(Board vo) throws Exception{
		return sqlSession.update("board.updateBoard", vo);
	}

	public int deleteBoard(int board_no) throws Exception{
		return sqlSession.delete("board.deleteBoard", board_no);
	}
	public Board selectBoard(String board_no) throws Exception{
		return sqlSession.selectOne("board.selectBoard", board_no);
	}
	public List<Board> selectListBoard(int study_no) throws Exception{
		return sqlSession.selectList("board.selectListBoard", study_no);
	}
	public List<Board> selectListBoard2() throws Exception{
		return sqlSession.selectList("board.selectListBoard2");
	}

	public List<Board> selectListBoard(int currentPageNum, int limits) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPageNum", currentPageNum);
		map.put("limits", limits);
		return sqlSession.selectList("board.selectListBoardPage", map);
	}
	public List<Board> selectListBoard(int currentPageNum, int limits, String searchWord) throws Exception{
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
	public int insertBoardComment(int board_no, BoardComment vo) throws Exception{
		return sqlSession.insert("board.insertBoardComment", vo);
	}
	public int updateBoardComment(int board_no, BoardComment vo) throws Exception{
		return sqlSession.update("board.updateBoardComment", vo);
	}
	public int deleteBoardComment(int board_no, int commentNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", board_no);
		map.put("commentNum", commentNum);
		return sqlSession.delete("board.deleteBoardComment", map);
	}
	public BoardComment selectBoardComment(int board_no, int commentNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", board_no);
		map.put("commentNum", commentNum);
		return sqlSession.selectOne("board.selectBoardComment", map);
	}
	public List<BoardComment> selectListBoardComment(int board_no) throws Exception{
		return sqlSession.selectList("board.selectListBoardComment", board_no);
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
	public int deleteBoardAttachment(int board_no, int attachNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", board_no);
		map.put("attachNum", attachNum);
		return sqlSession.delete("board.deleteBoardAttachment", map);
	}
	public BoardAttachment selectBoardAttachment(int board_no, int attachNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", board_no);
		map.put("attachNum", attachNum);
		return sqlSession.selectOne("board.selectBoardAttachment", map);
	}
	public List<BoardAttachment> selectListBoardAttachment(int board_no) throws Exception{
		return sqlSession.selectList("board.selectListBoardAttachment", board_no);
	}
	public int selectBoardAttachmentCount() throws Exception{
		return sqlSession.selectOne("board.selectBoardAttachmentCount");
	}
	
	//BoardCategory
	public BoardCategory selectBoardCategory(int categoryCode) throws Exception{
		return sqlSession.selectOne("board.selectBoardCategory", categoryCode);
	}
}