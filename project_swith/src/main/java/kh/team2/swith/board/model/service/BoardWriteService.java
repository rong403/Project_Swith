package kh.team2.swith.board.model.service;

import java.util.List;

import kh.team2.swith.board.model.vo.BoardAttachment;
import kh.team2.swith.board.model.vo.BoardCategory;
import kh.team2.swith.board.model.vo.BoardComment;
import kh.team2.swith.board.model.vo.BoardWrite;

public interface BoardWriteService {
	public int insertBoard(BoardWrite vo)  throws Exception;
	public int updateBoard() throws Exception;
	public int deleteBoard() throws Exception;
	public BoardWrite selectBoard() throws Exception;
	public List<BoardWrite> selectListBoard() throws Exception;
	public List<BoardWrite> selectListBoard(int currentPageNum, int limits) throws Exception;
	public List<BoardWrite> selectListBoard(int currentPageNum, int limits, String searchWord) throws Exception;
	public int selectBoardCount() throws Exception;
	public int insertBoardComment() throws Exception;
	public int updateBoardComment() throws Exception;
	public int deleteBoardComment() throws Exception;
	public BoardComment selectBoardComment() throws Exception;
	public List<BoardComment> selectListBoardCommnet() throws Exception; //board_no에 해당하는 list
	public int selectBoardCommentCount() throws Exception;
	public int insertBoardAttachment() throws Exception;
	public int updateBoardAttachment() throws Exception;
	public int deleteBoardAttachment() throws Exception;
	public BoardAttachment selectBoardAttachment() throws Exception;
	public List<BoardAttachment> selectListBoardAttachment() throws Exception; //board_no에 해당하는 list
	public int selectBoardAttachmentCount() throws Exception;
	public BoardCategory selectBoardCategory() throws Exception;
}