package kh.team2.swith.place.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class Place {
//	"P_NO"	NUMBER		NOT NULL,
//	"P_NAME"	VARCHAR2(200)		NOT NULL,
//	"P_ADDRESS"	VARCHAR2(100)		NOT NULL,
//	"P_INFO"	VARCHAR2(500)		NULL,
//    "P_PHONE" VARCHAR2(13) NOT NULL,
//    "P_X" NUMBER(17,13) NOT NULL,
//    "P_Y" NUMBER(17,13) NOT NULL,
//	"AREA_CODE"	VARCHAR2(5)		NOT NULL
	private int p_no;
	private String p_name;
	private String p_address;
	private String p_info;
	private String p_phone;
	private double p_x;
	private double p_y;
	private String area_code;
	
	private String p_img_origin;
	private String p_img_save;
	private String p_img_route;
}
