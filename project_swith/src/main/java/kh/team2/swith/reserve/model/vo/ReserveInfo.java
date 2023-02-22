package kh.team2.swith.reserve.model.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class ReserveInfo {
	private String reserve_no;
	private String member_id;
	private int room_no;
	private String reserve_price;
	private String reserve_name;
	private String reserve_email;
	private String reserve_phone;
	private int reserve_start_time;
	private int reserve_end_time;
	private String reserve_date;
	private Date reserve_pay;
	private String tid;
	private String payment_method_type;
	
	@Override
	public String toString() {
		return "ReserveInfo [reserve_no=" + reserve_no + ", member_id=" + member_id + ", room_no=" + room_no
				+ ", reserve_price=" + reserve_price + ", reserve_name=" + reserve_name + ", reserve_email="
				+ reserve_email + ", reserve_phone=" + reserve_phone + ", reserve_start_time=" + reserve_start_time
				+ ", reserve_end_time=" + reserve_end_time + ", reserve_date=" + reserve_date + ", reserve_pay="
				+ reserve_pay + ", tid=" + tid + ", payment_method_type=" + payment_method_type + "]";
	}
}
