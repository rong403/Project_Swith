package kh.team2.swith.place.model.vo;

import org.springframework.stereotype.Component;

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
	private int p_no;
	
	public PlaceImg() {
		super();
	}

	public PlaceImg(int p_img_no, String p_img_origin, String p_img_save, String p_img_route, int p_no) {
		super();
		this.p_img_no = p_img_no;
		this.p_img_origin = p_img_origin;
		this.p_img_save = p_img_save;
		this.p_img_route = p_img_route;
		this.p_no = p_no;
	}

	@Override
	public String toString() {
		return "PlaceImg [p_img_no=" + p_img_no + ", p_img_origin=" + p_img_origin + ", p_img_save=" + p_img_save
				+ ", p_img_route=" + p_img_route + ", p_no=" + p_no + "]";
	}

	public int getP_img_no() {
		return p_img_no;
	}

	public void setP_img_no(int p_img_no) {
		this.p_img_no = p_img_no;
	}

	public String getP_img_origin() {
		return p_img_origin;
	}

	public void setP_img_origin(String p_img_origin) {
		this.p_img_origin = p_img_origin;
	}

	public String getP_img_save() {
		return p_img_save;
	}

	public void setP_img_save(String p_img_save) {
		this.p_img_save = p_img_save;
	}

	public String getP_img_route() {
		return p_img_route;
	}

	public void setP_img_route(String p_img_route) {
		this.p_img_route = p_img_route;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
}
