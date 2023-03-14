package kh.team2.swith.study.model.vo;


import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Component
public class Study {
	private int study_no;       	//스터디 번호
	private String study_name;  	//스터디 명
	private String study_type; 	//스터디 장소?
	private String study_info; 		//스터디 소개
	private int study_people;		//모집 인원
	private String study_detailInfo; //모임 정보(위지위그) ERD 추가
	private Date study_create_date; //스터디 생성일 sysdate
	private Date study_start_date;   //스터디 시작일
	private Date study_end_date; 	//스터디 종료일 (스터디 끝내기 버튼을 눌렀을 때 sysdate)
	private String study_tag;		//태그
	private int study_recruitment_condition; //1모집중, 2모집마감
	private String area_code;  		//지역 코드
	private int study_category; //스터디 카테고리 코드(비트연산 DB저장용)
	private List<StudyCategory> study_category_list; //화면용 스터디 카테고리 내용 모두 포함 
	
	//스터디 요일(study_date) 부분에 스터디 모임 정보(위지위그, study_placeInfo) 변경
	
}
