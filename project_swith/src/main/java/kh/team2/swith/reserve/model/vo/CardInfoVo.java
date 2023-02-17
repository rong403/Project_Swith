package kh.team2.swith.reserve.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class CardInfoVo {
	
//    "bin": "621640",
//    "card_type": "체크",,
//    "kakaopay_purchase_corp": "비씨카드",
//    "kakaopay_purchase_corp_code": "104",
//    "kakaopay_issuer_corp": "수협은행",
//    "kakaopay_issuer_corp_code": "212"
	
	private String tid;
	private String bin;
	private String card_type;
	private String kakaopay_purchase_corp;
	private String kakaopay_purchase_corp_code;
	private String kakaopay_issuer_corp;
	private String kakaopay_issuer_corp_code;
	
	@Override
	public String toString() {
		return "CardInfoVo [tid=" + tid + ", bin=" + bin + ", card_type=" + card_type + ", kakaopay_purchase_corp="
				+ kakaopay_purchase_corp + ", kakaopay_purchase_corp_code=" + kakaopay_purchase_corp_code
				+ ", kakaopay_issuer_corp=" + kakaopay_issuer_corp + ", kakaopay_issuer_corp_code="
				+ kakaopay_issuer_corp_code + "]";
	}
}
