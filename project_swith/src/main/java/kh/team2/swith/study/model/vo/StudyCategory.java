package kh.team2.swith.study.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Component
public class StudyCategory {
	//study_category_code 	study_category_name
	//	1					IT
	//	2					어학
	//	4					취업
	//	8					자격증
	//	16					고시/공무원
	//	32					취미/교양
	//	64					기타
	private int study_category_code;
	private String study_category_name;
}
