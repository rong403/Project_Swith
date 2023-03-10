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
public class StudyReserver {
	private int study_no;
	private String member_id;
	private String req_date;
	private String req_comment;
	
	//프로필 테이블 정보
	private String nick_name;
	private String intro;
	private String profile_img_route;
}
