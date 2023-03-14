package kh.team2.swith.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.board.model.dao.BoardDao;
import kh.team2.swith.board.model.vo.BoardAttachment;
import kh.team2.swith.board.model.vo.BoardCategory;
import kh.team2.swith.board.model.vo.BoardComment;
import kh.team2.swith.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;
	
	public int insertBoard(Board vo) throws Exception{
		return dao.insertBoard(vo);
	}

	@Override
	public int updateBoard(Board vo) throws Exception {
		return dao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(int boardNum) throws Exception {
		return dao.deleteBoard(boardNum);
	}

	@Override
	public Board selectBoard(int boardNum) throws Exception {
		return dao.selectBoard(boardNum);
	}

	@Override
	public List<Board> selectListBoard(int study_no) throws Exception {
		return dao.selectListBoard(study_no);
	}
	@Override
	public List<Board> selectListBoard2() throws Exception {
		return dao.selectListBoard2();
	}

	@Override
	public List<Board> selectListBoard(int currentPageNum, int limits) throws Exception {
		return dao.selectListBoard(currentPageNum, limits);
	}

	@Override
	public List<Board> selectListBoard(int currentPageNum, int limits, String searchWord) throws Exception {
		return dao.selectListBoard(currentPageNum, limits, searchWord);
	}

	@Override
	public int selectBoardCount() throws Exception {
		return dao.selectBoardCount();
	}

	@Override
	public int insertBoardComment(int boardNum, BoardComment vo) throws Exception {
		return dao.insertBoardComment(boardNum, vo);
	}

	@Override
	public int updateBoardComment(int boardNum, BoardComment vo) throws Exception {
		return dao.updateBoardComment(boardNum, vo);
	}

	@Override
	public int deleteBoardComment(int boardNum, int commentNum) throws Exception {
		return dao.deleteBoardComment(boardNum, commentNum);
	}

	@Override
	public BoardComment selectBoardComment(int boardNum, int commentNum) throws Exception {
		return dao.selectBoardComment(boardNum, commentNum);
	}

	@Override
	public List<BoardComment> selectListBoardCommnet(int boardNum) throws Exception {
		return dao.selectListBoardComment(boardNum);
	}

	@Override
	public int selectBoardCommentCount() throws Exception {
		return dao.selectBoardCommentCount();
	}

	@Override
	public int insertBoardAttachment(BoardAttachment vo) throws Exception {
		return dao.insertBoardAttachment(vo);
	}

	@Override
	public int updateBoardAttachment(BoardAttachment vo) throws Exception {
		return dao.updateBoardAttachment(vo);
	}

	@Override
	public int deleteBoardAttachment(int boardNum, int attachNum) throws Exception {
		return dao.deleteBoardAttachment(boardNum, attachNum);
	}

	@Override
	public BoardAttachment selectBoardAttachment(int boardNum, int attachNum) throws Exception {
		return dao.selectBoardAttachment(boardNum, attachNum);
	}

	@Override
	public List<BoardAttachment> selectListBoardAttachment(int boardNum) throws Exception {
		return dao.selectListBoardAttachment(boardNum);
	}

	@Override
	public int selectBoardAttachmentCount() throws Exception {
		return dao.selectBoardAttachmentCount();
	}

	@Override
	public BoardCategory selectBoardCategory(int categoryCode) throws Exception {
		return dao.selectBoardCategory(categoryCode);
	}
}