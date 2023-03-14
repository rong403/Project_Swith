package kh.team2.swith.board.model.service;

import java.util.List;

import kh.team2.swith.board.model.vo.BoardAttachment;
import kh.team2.swith.board.model.vo.BoardCategory;
import kh.team2.swith.board.model.vo.BoardComment;
import kh.team2.swith.board.model.vo.BoardWrite;

public interface BoardWriteService {
	public int insertBoard(BoardWrite vo)  throws Exception;
	public int updateBoard(BoardWrite vo) throws Exception;
	public int deleteBoard(int boardNum) throws Exception;
	public BoardWrite selectBoard(int boardNum) throws Exception;
	public List<BoardWrite> selectListBoard(int study_no) throws Exception;
	public List<BoardWrite> selectListBoard2() throws Exception;
	public List<BoardWrite> selectListBoard(int currentPageNum, int limits) throws Exception;
	public List<BoardWrite> selectListBoard(int currentPageNum, int limits, String searchWord) throws Exception;
	public int selectBoardCount() throws Exception;
	public int insertBoardComment(int boardNum, BoardComment vo) throws Exception;
	public int updateBoardComment(int boardNum, BoardComment vo) throws Exception;
	public int deleteBoardComment(int boardNum, int commentNum) throws Exception;
	public BoardComment selectBoardComment(int boardNum, int commentNum) throws Exception;
	public List<BoardComment> selectListBoardCommnet(int boardNum) throws Exception; //board_no에 해당하는 list
	public int selectBoardCommentCount() throws Exception;
	public int insertBoardAttachment(BoardAttachment vo) throws Exception;
	public int updateBoardAttachment(BoardAttachment vo) throws Exception;
	public int deleteBoardAttachment(int boardNum, int attachNum) throws Exception;
	public BoardAttachment selectBoardAttachment(int boardNum, int attachNum) throws Exception;
	public List<BoardAttachment> selectListBoardAttachment(int boardNum) throws Exception; //board_no에 해당하는 list
	public int selectBoardAttachmentCount() throws Exception;
	public BoardCategory selectBoardCategory(int categoryCode) throws Exception;
}