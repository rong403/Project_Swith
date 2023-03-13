package kh.team2.swith.member.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Report {
	private int report_no;
	private String report_content;
	private int report_category;
	private Date report_date;
	private int report_category_number;
	private String member_id;
}
