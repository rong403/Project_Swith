package kh.team2.swith.place.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.team2.swith.place.model.service.PlaceService;
import kh.team2.swith.place.model.vo.PlaceInfo;

@Controller
@RequestMapping("/place")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	@PostMapping("/read")
	@ResponseBody
	public String ajaxPlaceList(
			@RequestParam(name="area_code", defaultValue = "1") int area_code
			, @RequestParam(name="page", defaultValue = "1") String currentPageStr
			) throws Exception {

		//초기 페이지
		int currentPage = 1;
		//페이지당 목록 개수
		int limit = 10;
		//보여줄 페이지목록 개수
		int pageNum = 3;
		
		currentPage = Integer.parseInt(currentPageStr);

		//전체 게시글 개수와 해당 페이지별 목록을 리턴
		int listCnt = placeService.selectPlaceCount(area_code);
		List<PlaceInfo> volist = placeService.selectListPlace(area_code, currentPage, limit);
		
		// 총 페이지 수 계산 : 목록이 최소 1개일 때 1page로 처리하기 위해 0.9를 더한다.
		int maxPage = (int)((double)listCnt / limit + 0.9);
		// 현재 보여줄 시작 페이지 번호
		int startPage = (((int)((double)currentPage /pageNum + 0.95))-1)*pageNum + 1;
		// 만약, 목록으로 보여질 페이지 수가 10개 이면, 끝 페이지는 10/20/30page가 되어야 한다
		int endPage = startPage + pageNum - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", volist);
		resultMap.put("currentPage", currentPage);
		resultMap.put("maxPage", maxPage);
		resultMap.put("startPage", startPage);
		resultMap.put("endPage", endPage);
		
		return new Gson().toJson(resultMap);
	}
	
	@GetMapping("/write")
	public String write()  throws Exception {
		return "placeWrite";
	}
	
	@PostMapping("/write")
	public String write(PlaceInfo vo) throws Exception {
		
//		int result = placeService.insertPlace(vo);
		
		return "redirect:/";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("p_no") int p_no) throws Exception {
		
		int result = placeService.deletePlace(p_no);
		
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public String update() throws Exception {
		return "placeUpdate";
	}
	
	@PostMapping("/update")
	public String update(PlaceInfo vo) throws Exception {
		
		int result = placeService.updatePlace(vo);
		
		return "redirect:/";
	}
	
}
