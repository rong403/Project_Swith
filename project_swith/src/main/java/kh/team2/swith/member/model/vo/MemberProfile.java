package kh.team2.swith.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@ToString
@Setter
@Getter
@Component
public class MemberProfile {
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String email;
	private String hnd_no;
	private String post_no;
	private String add1;
	private String add2;
	private String agree1;
	private String agree2;
	private String agree3;
	private String member_auth;
	private int enabled;
	private String status_date;
	private int failure_cnt;
	
	//profile
	private String nick_name;
	private String intro;
	
	//prifileImg
	private String profile_img_origin;
	private String profile_img_save;
	private String profile_img_route;
}
