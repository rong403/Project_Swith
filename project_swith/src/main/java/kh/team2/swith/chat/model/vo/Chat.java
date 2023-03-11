package kh.team2.swith.chat.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class Chat {
//	agr_number, chatting_content, chatting_time, agr_date, out_date, member_id, auth_code
	private String study_no;
	private String study_name;
	private String member_id;
	private String chatting_content;
	
	private int agr_number;
	private Date req_date;
	private Date agr_date;
	private Date out_date;
	private int auth_code;
	
}
