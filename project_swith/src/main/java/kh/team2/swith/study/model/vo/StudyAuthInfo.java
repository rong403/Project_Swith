package kh.team2.swith.study.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class StudyAuthInfo {
	private int auth_code;
	private int auth_name;
	
	@Override
	public String toString() {
		return "StudyAuthInfo [auth_code=" + auth_code + ", auth_name=" + auth_name + "]";
	}
}
