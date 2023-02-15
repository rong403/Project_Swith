package kh.team2.swith.reserve.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class ApproveResponse {
	private String aid;
	private String tid;
	private String cid;
	private String sid;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private String item_name;
	private String item_code;
	private int quantity;
	private CardInfoVo card_info;
	private String created_at;
	private String approved_at;
	private String payload;
	@Override
	public String toString() {
		return "ApproveResponse [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", sid=" + sid + ", partner_order_id="
				+ partner_order_id + ", partner_user_id=" + partner_user_id + ", payment_method_type="
				+ payment_method_type + ", item_name=" + item_name + ", item_code=" + item_code + ", quantity="
				+ quantity + ", card_info=" + card_info + ", created_at=" + created_at + ", approved_at=" + approved_at
				+ ", payload=" + payload + "]";
	}
}
