package kh.team2.swith.reserve.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Component
public class ReserveChart {
	private String chart_date;
	private int chart_cnt;
	private int chart_price;
	private String chart_area;
}
