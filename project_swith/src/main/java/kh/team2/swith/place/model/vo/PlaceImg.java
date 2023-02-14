package kh.team2.swith.place.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class PlaceImg {
//	"P_IMG_NO"	NUMBER		NOT NULL,
//	"P_IMG_ORIGIN"	VARCHAR2(255)		NOT NULL,
//	"P_IMG_SAVE"	VARCHAR2(255)		NOT NULL,
//    "P_IMG_ROUTE"	VARCHAR2(100)		NOT NULL,
//	"P_NO"	NUMBER		NOT NULL
	private int p_img_no;
	private String p_img_origin;
	private String p_img_save;
	private String p_img_route;
}
