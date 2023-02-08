package kh.team2.swith.place.model.vo;

import org.springframework.stereotype.Component;

@Component
public class PlaceCode {
//	"SIGUNGU_CODE"	VARCHAR2(5)		NOT NULL,
//	"SIGUNGU"	VARCHAR2(21)		NOT NULL,
//	"SIDO"	VARCHAR2(21)		NOT NULL
	private String sigungu_code;
	private String sigungu;
	private String sido;
	
	public PlaceCode() {
		super();
	}
	
	public PlaceCode(String sigungu_code, String sigungu, String sido) {
		super();
		this.sigungu_code = sigungu_code;
		this.sigungu = sigungu;
		this.sido = sido;
	}
	
	@Override
	public String toString() {
		return "PlaceCode [sigungu_code=" + sigungu_code + ", sigungu=" + sigungu + ", sido=" + sido + "]";
	}
	
	public String getSigungu_code() {
		return sigungu_code;
	}
	public void setSigungu_code(String sigungu_code) {
		this.sigungu_code = sigungu_code;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	
	
	
}
