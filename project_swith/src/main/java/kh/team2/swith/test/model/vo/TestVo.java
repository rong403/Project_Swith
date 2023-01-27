package kh.team2.swith.test.model.vo;

import org.springframework.stereotype.Component;

@Component
public class TestVo {
	private String id;
	private String pwd;
	
	public TestVo() {
		super();
	}
	@Override
	public String toString() {
		return "TestVo [id=" + id + ", pwd=" + pwd + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
