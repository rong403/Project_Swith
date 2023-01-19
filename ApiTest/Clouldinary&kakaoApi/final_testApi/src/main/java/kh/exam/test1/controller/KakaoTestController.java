package kh.exam.test1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class KakaoTestController {

	@GetMapping("/kakaoMap")
	public String kakao() {
		return "/kakaoTest";
	}
}
