package kh.team2.swith.reserve.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class CancelReserveInfo {
	private int reserve_no;
	private String member_id;
	private int room_no;
	private String reserve_price;
	private String reserve_name;
	private String reserve_email;
	private String reserve_phone;
	private Date reserve_start_time;
	private Date reserve_end_time;
	private String reserve_comment;
	private Date reserve_pay;
	
	@Override
	public String toString() {
		return "CancelReserveInfo [reserve_no=" + reserve_no + ", member_id=" + member_id + ", room_no=" + room_no
				+ ", reserve_price=" + reserve_price + ", reserve_name=" + reserve_name + ", reserve_email="
				+ reserve_email + ", reserve_phone=" + reserve_phone + ", reserve_start_time=" + reserve_start_time
				+ ", reserve_end_time=" + reserve_end_time + ", reserve_comment=" + reserve_comment + ", reserve_pay="
				+ reserve_pay + "]";
	}
}
