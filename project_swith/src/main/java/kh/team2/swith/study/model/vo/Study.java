package kh.team2.swith.study.model.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Study {
	private int study_no;       	//스터디 번호
	private String study_name;  	//모임명
	private String study_category; 	//카테고리
	private String study_info; 		//간단 소개
	private String study_placeInfo; //모임 정보(위지위그)
	private String study_sido;		// 시/도
	private String study_sigungu;	// 시/군/구
	private String study_image;		//대표 사진
	private String study_tag;		//태그
	private int auth_code;    		//권한 코드
}
