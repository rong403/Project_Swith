package kh.team2.swith.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardWrite {
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
}
