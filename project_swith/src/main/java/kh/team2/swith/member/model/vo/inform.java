package kh.team2.swith.member.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class inform {
	private int inform_no;
	private List<Member> member_id;
	private String inform_content;
}
