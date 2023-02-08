package kh.team2.swith.place.model.vo;

import org.springframework.stereotype.Component;

@Component
public class PlaceInfo {
//	"P_NO"	NUMBER		NOT NULL,
//	"P_NAME"	VARCHAR2(200)		NOT NULL,
//	"P_ADDRESS"	VARCHAR2(100)		NOT NULL,
//	"P_INFO"	VARCHAR2(500)		NULL
	private int p_no;
	private String p_name;
	private String p_address;
	private String p_info;
	
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
}
