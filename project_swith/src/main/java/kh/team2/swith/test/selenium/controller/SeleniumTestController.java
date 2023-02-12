package kh.team2.swith.test.selenium.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.team2.swith.test.selenium.model.service.SeleniumTestService;

@Controller
public class SeleniumTestController {

	@Autowired
	private SeleniumTestService service;
	
	@GetMapping("/seleniumTest")
	public void dsfsdf(@RequestParam String area) {
		System.out.println(area);
		service.googleMapCrawling(area);
	}
}
