package kh.team2.swith.study.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class StudyComment {
	private int study_comment_no;
	private String member_id;
	private int study_no;
	private String study_comment;
	private Date study_comment_date;
	private int study_comment_origin;
	private int study_comment_level;
	private int study_comment_seq;
	private String nick_name;
	@Override
	public String toString() {
		return "StudyComment [study_comment_no=" + study_comment_no + ", member_id=" + member_id + ", study_no="
				+ study_no + ", study_comment=" + study_comment + ", study_comment_date=" + study_comment_date
				+ ", study_comment_origin=" + study_comment_origin + ", study_comment_level=" + study_comment_level
				+ ", study_comment_seq=" + study_comment_seq + ", nick_name=" + nick_name + "]";
	}
	
}
