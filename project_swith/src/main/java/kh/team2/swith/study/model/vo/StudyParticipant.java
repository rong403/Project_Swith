package kh.team2.swith.study.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

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
	
	@Override
	public String toString() {
		return "StudyParticipant [agr_number=" + agr_number + ", req_date=" + req_date + ", agr_date=" + agr_date
				+ ", out_date=" + out_date + ", member_id=" + member_id + ", study_no=" + study_no + ", auth_code="
				+ auth_code + "]";
	}
}
