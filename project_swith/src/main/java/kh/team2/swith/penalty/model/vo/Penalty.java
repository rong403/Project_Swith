package kh.team2.swith.penalty.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Component
public class Penalty {
	//공통
	private int penalty_no;
	private int agr_number;
	
	//벌점 테이블
	private int penalty_point;
	private String penalty_reason;
	private Date penalty_time;

	//벌점 취소 테이블
	private String penalty_cancel_reason;
	private Date penalty_cancel_time;
	
	@Override
	public String toString() {
		return "Penalty [penalty_no=" + penalty_no + ", agr_number=" + agr_number + ", penalty_point=" + penalty_point
				+ ", penalty_reason=" + penalty_reason + ", penalty_time=" + penalty_time + ", penalty_cancel_reason="
				+ penalty_cancel_reason + ", penalty_cancel_time=" + penalty_cancel_time + "]";
	}
}
