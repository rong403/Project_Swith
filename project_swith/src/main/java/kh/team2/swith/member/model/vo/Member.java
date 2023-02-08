package kh.team2.swith.member.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Member {
	
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
	private List<MemberAuthInfo> member_auth_code;
	
}
