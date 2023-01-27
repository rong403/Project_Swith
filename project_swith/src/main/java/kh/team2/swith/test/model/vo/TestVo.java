package kh.team2.swith.test.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Getter
@Setter
public class TestVo {
	private String id;
	private String pwd;
	
	public TestVo() {
		super();
	}
}
