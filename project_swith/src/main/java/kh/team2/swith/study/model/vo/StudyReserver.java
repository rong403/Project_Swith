package kh.team2.swith.study.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class StudyReserver {
	private int study_no;
	private String member_id;
	private Date req_date;
	private String req_comment;
	
	@Override
	public String toString() {
		return "StudyReserver [study_no=" + study_no + ", member_id=" + member_id + ", req_date=" + req_date
				+ ", req_comment=" + req_comment + "]";
	}
}
