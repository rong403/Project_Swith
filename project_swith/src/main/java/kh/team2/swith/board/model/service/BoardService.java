package kh.team2.swith.board.model.service;

import java.util.List;

import kh.team2.swith.board.model.vo.BoardAttachment;
import kh.team2.swith.board.model.vo.BoardCategory;
import kh.team2.swith.board.model.vo.BoardComment;
import kh.team2.swith.board.model.vo.Board;

public interface BoardService {
	public int insertBoard(Board vo)  throws Exception;
	public int updateBoard(Board vo) throws Exception;
	public int deleteBoard(int board_no) throws Exception;
	public Board selectBoard(String board_no) throws Exception;
	public List<Board> selectListBoard(int study_no) throws Exception;
	public List<Board> selectListBoard2() throws Exception;
	public List<Board> selectListBoard(int currentPageNum, int limits) throws Exception;
	public List<Board> selectListBoard(int currentPageNum, int limits, String searchWord) throws Exception;
	public int selectBoardCount() throws Exception;
	public int insertBoardComment(int board_no, BoardComment vo) throws Exception;
	public int updateBoardComment(int board_no, BoardComment vo) throws Exception;
	public int deleteBoardComment(int board_no, int commentNum) throws Exception;
	public BoardComment selectBoardComment(int board_no, int commentNum) throws Exception;
	public List<BoardComment> selectListBoardCommnet(int board_no) throws Exception; //board_no에 해당하는 list
	public int selectBoardCommentCount() throws Exception;
	public int insertBoardAttachment(BoardAttachment vo) throws Exception;
	public int updateBoardAttachment(BoardAttachment vo) throws Exception;
	public int deleteBoardAttachment(int boardNum, int attachNum) throws Exception;
	public BoardAttachment selectBoardAttachment(int board_no, int attachNum) throws Exception;
	public List<BoardAttachment> selectListBoardAttachment(int board_no) throws Exception; //board_no에 해당하는 list
	public int selectBoardAttachmentCount() throws Exception;
	public BoardCategory selectBoardCategory(int categoryCode) throws Exception;
}