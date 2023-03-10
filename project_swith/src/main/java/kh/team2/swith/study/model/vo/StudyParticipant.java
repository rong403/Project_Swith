package kh.team2.swith.study.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Component
public class StudyParticipant {
	private int agr_number;
	private Date req_date;
	private Date agr_date;
	private Date out_date;
	private String member_id;
	private int study_no;
	private int auth_code;
	
	//프로필 테이블 정보
	private String profile_img_route;
	private String nick_name;
	private String intro;
	
}
