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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.team2.swith.api.model.service.CloudinaryService;
import kh.team2.swith.api.model.service.KakaoMapService;
import kh.team2.swith.area.model.service.AreaService;
import kh.team2.swith.place.model.service.PlaceService;
import kh.team2.swith.place.model.vo.PlaceImg;
import kh.team2.swith.place.model.vo.PlaceInfo;
import kh.team2.swith.place.room.model.service.RoomServcie;
import kh.team2.swith.place.room.model.vo.StudyRoom;

@Controller
@RequestMapping("/place")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	@Autowired
	private RoomServcie roomService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private KakaoMapService kakaoMapService;
	@Autowired
	private CloudinaryService cloudinaryService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView map(ModelAndView mv) throws Exception {
		
		List<String> sidoList = areaService.selectSidoList();
		
		mv.addObject("sidoList", sidoList);
		mv.setViewName("map/map_home");
		return mv;
	}
	
	@PostMapping("/list.lo")
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
	@PostMapping("/detail.lo")
	@ResponseBody
	public String ajaxPlaceDetail(
			@RequestParam(name="p_no", defaultValue = "1") int p_no
			) throws Exception {

		PlaceInfo placeInfo = placeService.selectOne(p_no);
		List<StudyRoom> roomList = roomService.selectListRoom(p_no);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("placeInfo", placeInfo);
		resultMap.put("roomList", roomList);
		
		return new Gson().toJson(resultMap);
	}
	
	@GetMapping("/write")
	public String write()  throws Exception {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@write get");
		
		return "redirect:/admin";
	}
	
	@PostMapping("/write")
	public String write(
			PlaceInfo vo
			,RedirectAttributes redirec
			,@RequestParam("file") MultipartFile file
			,@RequestParam("address_first") String address_first
			,@RequestParam("address_second") String address_second
			) throws Exception {
		
		//총 주소 저장
		vo.setP_address(address_first+", "+address_second);
		
		//주소로 좌표 가져오기
		Map<String,String> coordinateResult = kakaoMapService.getAddressCoordinate(address_first);
		//좌표 저장
		vo.setP_x(Double.parseDouble(coordinateResult.get("x")));
		vo.setP_y(Double.parseDouble(coordinateResult.get("y")));
		
		//지역 코드 가져오기
		String area_code = areaService.selectAreaCode(address_first.split(" ")[0], address_first.split(" ")[1]);
		vo.setArea_code(area_code);
		
		//파일 업로드
		Map<String,String> uploadResult = cloudinaryService.upload(file.getBytes(), "placeImg");
		vo.setP_img_route(uploadResult.get("url")); 
		vo.setP_img_save(uploadResult.get("publicId"));
		vo.setP_img_origin(file.getOriginalFilename());
		
		int result = placeService.insertPlace(vo);
		if(result > 0) {
			redirec.addFlashAttribute("msg", "스터디 카페 등록에 성공했습니다.");
		} else {
			cloudinaryService.delete(vo.getP_img_save());
			redirec.addFlashAttribute("msg", "스터디 카페 등록을 시도하였지만 실패 했습니다.");
		}
		
		return "redirect:/admin";
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
	
	@PostMapping("/update.lo")
	@ResponseBody
	public String update(@RequestParam("p_no") int p_no) throws Exception {
		PlaceInfo result = placeService.selectOne(p_no);
		return new Gson().toJson(result);
	}
	
}
