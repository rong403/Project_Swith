package kh.team2.swith.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board {
	//BOARD_NO NUMBER 게시글번호 
	//BOARD_TITEL VARCHAR2(200) 제목 
	//BOARD_CONTENTS VARCHAR2(1000) 내용 
	//BOARD_WRITE DATE 작성일 
	//BOARD_STATUS NUMBER 삭제여부 
	//CATEGORY_CODE NUMBER 카테고리 코드 
	//STUDY_NO NUMBER 스터디 번호 
	//MEMBER_ID VARCHAR2(20) 회원아이디 
	private int board_no;
	private String board_title;
	private String board_contents;
	private Date board_write;
	private int board_status;
	private int category_code;
	private int study_no;
	private String member_id;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public Date getBoard_write() {
		return board_write;
	}
	public void setBoard_write(Date board_write) {
		this.board_write = board_write;
	}
	public int getBoard_status() {
		return board_status;
	}
	public void setBoard_status(int board_status) {
		this.board_status = board_status;
	}
	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}