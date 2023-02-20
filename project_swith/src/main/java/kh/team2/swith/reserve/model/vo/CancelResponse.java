package kh.team2.swith.reserve.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class CancelResponse {
	private String cid;
	private String tid;
	private int cancel_amount;
	private int cancel_tax_free_amount;
	
	@Override
	public String toString() {
		return "CancelResponse [cid=" + cid + ", tid=" + tid + ", cancel_amount=" + cancel_amount
				+ ", cancel_tax_free_amount=" + cancel_tax_free_amount + "]";
	}
}
