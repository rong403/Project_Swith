package kh.team2.swith.place.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.team2.swith.place.model.service.PlaceService;
import kh.team2.swith.place.model.vo.PlaceInfo;

@Controller
@RequestMapping("/place")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
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
