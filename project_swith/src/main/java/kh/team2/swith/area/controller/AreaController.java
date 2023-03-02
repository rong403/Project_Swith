package kh.team2.swith.area.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.team2.swith.area.model.service.AreaService;
import kh.team2.swith.area.model.vo.Area;

@Controller
public class AreaController {

	@Autowired
	private AreaService service;
	
	@PostMapping("/sigungu.lo")
	@ResponseBody
	public String sigungulistAjax(@RequestParam("sido_name") String sido_name) throws Exception {
		List<Area> volist = null;
		if(!sido_name.equals("선택") && !sido_name.equals("전체")) {
			volist = service.selectSigunguList(sido_name);
		}
		return new Gson().toJson(volist);
	}
}
