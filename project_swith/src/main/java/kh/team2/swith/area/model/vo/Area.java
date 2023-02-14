package kh.team2.swith.area.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Area {
	private String area_code;
	private String sigungu_name;
	private String sido_name;
	@Override
	public String toString() {
		return "Area [area_code=" + area_code + ", sigungu_name=" + sigungu_name + ", sido_name=" + sido_name + "]";
	}
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getSigungu_name() {
		return sigungu_name;
	}
	public void setSigungu_name(String sigungu_name) {
		this.sigungu_name = sigungu_name;
	}
	public String getSido_name() {
		return sido_name;
	}
	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}
	
	
}
