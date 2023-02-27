package kh.team2.swith.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Component
public class BoardComment {
//	COMMENT_NO	NUMBER
//	COMMENT	VARCHAR2(1000 BYTE)
//	COMMEMT_DATE	DATE
//	COMMENT_ORIGIN	NUMBER
//	COMMENT_LEVEL	NUMBER
//	COMMENT_SEQ	NUMBER
//	BOARD_NO	NUMBER
//	MEMBER_ID	VARCHAR2(20 BYTE)
	private int comment_no;
	private String comment;
	private Date comment_date;
	private int comment_origin;
	private int comment_level;
	private int comment_seq;
	private int board_no;
	private String member_id;
	
	@Override
	public String toString() {
		return "BoardComment [comment_no=" + comment_no + ", comment=" + comment + ", comment_date=" + comment_date
				+ ", comment_origin=" + comment_origin + ", comment_level=" + comment_level + ", comment_seq="
				+ comment_seq + ", board_no=" + board_no + ", member_id=" + member_id + "]";
	}
}
