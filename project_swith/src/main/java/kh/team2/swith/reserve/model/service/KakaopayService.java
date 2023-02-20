package kh.team2.swith.reserve.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import kh.team2.swith.reserve.model.vo.ApproveResponse;
import kh.team2.swith.reserve.model.vo.CancelResponse;
import kh.team2.swith.reserve.model.vo.ReadyResponse;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@PropertySource("classpath:kakaopay.properties")
@Service
public class KakaopayService {
	
	@Autowired
	Environment env;
	
	// 결제 요청 준비
	public ReadyResponse payReady(String room_name, String cnt, String total_price) {
		// TODO hhjng
		//유저정보 가져오기?

		// 카카오가 요구한 결제요청request값 담아주기
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", "partner_order_id");
		parameters.add("partner_user_id", "partner_user_id");
		parameters.add("item_name", room_name);
		parameters.add("quantity", cnt);
		parameters.add("total_amount", total_price);
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "http://localhost:8090/swith/reserveinfo"); // 결제승인시 넘어갈 url
		parameters.add("cancel_url", "http://localhost:8090/swith/map"); // 결제취소시 넘어갈 url
		parameters.add("fail_url", "http://localhost:8090/swith/map"); // 결제 실패시 넘어갈 url

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		// 외부url요청 통로 열기.
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";
		// template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
		ReadyResponse ready = template.postForObject(url, requestEntity, ReadyResponse.class);
		// 받아온 값 return
		return ready;
	}
	
	// 결제 승인 요청
	public ApproveResponse payApprove(String pg_token, String tid) {
		// request값 담기.
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", "partner_order_id");
		parameters.add("partner_user_id", "partner_user_id");
		parameters.add("pg_token", pg_token);
		// 하나의 map안에 header와 parameter값을 담아줌.
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

		// 외부url 통신
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
		// 보낼 외부 url, 요청 메시지(header,parameter), 처리후 값을 받아올 클래스
		ApproveResponse approve = template.postForObject(url, requestEntity, ApproveResponse.class);
		return approve;
	}
	
	// 결제 취소 요청
	public CancelResponse payCancel(ReserveInfo rInfo) {
		// request값 담기
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", rInfo.getTid());
		parameters.add("cancel_amount", rInfo.getReserve_price());
		parameters.add("cancel_tax_free_amount", "0");
		// 하나의 map안에 header와 parameter값을 담아줌.
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

		// 외부url 통신
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/cancel";
		//보낼 외부 url, 요청 메시지(header,parameter), 처리후 값을 받아올 클래스
		CancelResponse cancel = template.postForObject(url, requestEntity, CancelResponse.class);
		
		return cancel;
	}

	// header() 세팅
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK "+ env.getProperty("kakaopay.admin"));
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		return headers;
	}
}
