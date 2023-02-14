package kh.team2.swith.place.model.vo;

import org.springframework.stereotype.Component;

@Component
public class PlaceInfo {
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
	
	public PlaceInfo() {
		super();
	}
	
	public PlaceInfo(int p_no, String p_name, String p_address, String p_info) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_address = p_address;
		this.p_info = p_info;
	}

	@Override
	public String toString() {
		return "PlaceInfo [p_no=" + p_no + ", p_name=" + p_name + ", p_address=" + p_address + ", p_info=" + p_info
				+ ", p_phone=" + p_phone + ", p_x=" + p_x + ", p_y=" + p_y + ", area_code=" + area_code + "]";
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_address() {
		return p_address;
	}

	public void setP_address(String p_address) {
		this.p_address = p_address;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public String getP_phone() {
		return p_phone;
	}

	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}

	public double getP_x() {
		return p_x;
	}

	public void setP_x(double p_x) {
		this.p_x = p_x;
	}

	public double getP_y() {
		return p_y;
	}

	public void setP_y(double p_y) {
		this.p_y = p_y;
	}

	public String getArea_code() {
		return area_code;
	}

	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
}
