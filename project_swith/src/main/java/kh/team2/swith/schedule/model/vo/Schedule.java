package kh.team2.swith.schedule.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Component
public class Schedule {
	
	private int schedule_no;
	private String schedule_content ;
	private String start_date ;
	private String end_date ;
	private String member_id ;
	private int study_no ;
	
}
