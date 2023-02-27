package kh.team2.swith.board.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Component
public class BoardAttachment {
//	ATTACHMENT_NO	NUMBER
//	ORIGIN_NAME	VARCHAR2(255 BYTE)
//	SAVE_NAME	VARCHAR2(255 BYTE)
//	SAVE_ROUTE	VARCHAR2(200 BYTE)
//	BOARD_NO	NUMBER
	private int attachment_no;
	private String origin_name;
	private String save_name;
	private String save_route;
	private int board_no;
	
	@Override
	public String toString() {
		return "BoardAttachment [attachment_no=" + attachment_no + ", origin_name=" + origin_name + ", save_name="
				+ save_name + ", save_route=" + save_route + ", board_no=" + board_no + "]";
	}
}
