package kh.team2.swith.board.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Component
public class BoardCategory {
//	CATEGORY_CODE	NUMBER
//	CATEGORY_NAME	VARCHAR2(20 BYTE)
	private int category_code;
	private String category_name;
	
	@Override
	public String toString() {
		return "BoardCategory [category_code=" + category_code + ", category_name=" + category_name + "]";
	}
}
