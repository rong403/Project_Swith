package kh.team2.swith.place.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
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
import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.place.model.service.PlaceService;
import kh.team2.swith.place.model.vo.Place;
import kh.team2.swith.place.room.model.service.RoomServcie;
import kh.team2.swith.place.room.model.vo.StudyRoom;
import kh.team2.swith.reserve.model.service.CardInfoService;
import kh.team2.swith.reserve.model.service.KakaopayService;
import kh.team2.swith.reserve.model.service.ReserveService;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

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
	private ReserveService reserveService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CardInfoService cardInfoService;
	
	@Autowired
	private KakaoMapService kakaoMapService;
	@Autowired
	private KakaopayService kakaoPayService;
	@Autowired
	private CloudinaryService cloudinaryService;
	
	@Autowired
	DataSource dataSource;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView viewPlace(ModelAndView mv) throws Exception {
		
		List<String> sidoList = areaService.selectSidoList();
		
		mv.addObject("sidoList", sidoList);
		mv.setViewName("map/map_home");
		return mv;
	}
	
	@PostMapping("/list.lo")
	@ResponseBody
	public String selectPlaceList(
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
		List<Place> volist = placeService.selectListPlace(area_code, currentPage, limit);
		
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
	public String selectPlaceOne(
			@RequestParam(name="p_no", defaultValue = "1") int p_no
			) throws Exception {

		Place placeInfo = placeService.selectOne(p_no);
		List<StudyRoom> roomList = roomService.selectListRoom(p_no);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("placeInfo", placeInfo);
		resultMap.put("roomList", roomList);
		
		return new Gson().toJson(resultMap);
	}
	
	@PostMapping("/write.do")
	public String writePlace(
			Place vo
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
		if(coordinateResult.get("check").equals("ok")) {
			vo.setP_x(Double.parseDouble(coordinateResult.get("x")));
			vo.setP_y(Double.parseDouble(coordinateResult.get("y")));
			
			//지역 코드 가져오기
			String area_code = areaService.selectAreaCode(address_first.split(" ")[0], address_first.split(" ")[1]);
			vo.setArea_code(area_code);
			if(!file.isEmpty()) { 
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
				
			} else {
				redirec.addFlashAttribute("msg", "스터디 카페 등록을 시도하였지만 실패 했습니다.");
			}
			
		} else {
			redirec.addFlashAttribute("msg", "스터디 카페 등록을 시도하였지만 실패 했습니다.");
		}
		
		return "redirect:/admin";
	}
	
	@PostMapping("/delete.lo")
	@ResponseBody
	public String deletePlace(@RequestParam("p_no") int p_no) throws Exception {
		int result = 0;
		
		//트랙잭션을 수정으로 처리하기 위한 설정
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		DataSourceTransactionManager txManager = new DataSourceTransactionManager(dataSource);

		TransactionStatus sts = txManager.getTransaction(def);
		
		try {
			//결제 취소 요청을 위해 기존 예약 정보 가져오기
			List<ReserveInfo> reserveList = reserveService.selectListReservePlaceDelete(p_no);
			
			if(reserveList.size() > 0) {
				//취소 테이블에 추가
				if(reserveService.cancelInsertPlaceDelete(p_no) > 0) {
					//예약 정보 삭제
					if(reserveService.deleteReservePlaceDelete(p_no) > 0) {
						//결제 정보 삭제
						if(cardInfoService.deleteCardInfoPlaceRoomDelete(reserveList) > 0) {
							//알람 추가 - 취소 예약 정보를 바탕으로 추가
							if(memberService.insertInformDeletePlace(p_no) == 0) {
								txManager.rollback(sts);
								return new Gson().toJson(result);
							}
						} else {
							txManager.rollback(sts);
							return new Gson().toJson(result);
						}
					} else {
						txManager.rollback(sts);
						return new Gson().toJson(result);
					}
				} else {
					txManager.rollback(sts);
					return new Gson().toJson(result);
				}
			}
			
			//삭제 전 기존 정보 가져오기
			Place vo = placeService.selectOne(p_no);
			List<StudyRoom> roomList = roomService.selectListRoom(p_no);
			
			if(roomList.size() > 0) {
				//룸 사진 정보 삭제
				if(roomService.deleteRoomImgPlace(p_no) > 0) {
					//룸 정보 삭제
					if(roomService.deleteRoomPlace(p_no) == 0) {
						txManager.rollback(sts);
						return new Gson().toJson(result);
					} 
				} else {
					txManager.rollback(sts);
					return new Gson().toJson(result);
				}
			}
			
			//대표 사진 정보 삭제
			if(placeService.deleteImg(p_no) > 0) {
				//스터디 카페 정보 삭제
				result = placeService.deleteInfo(p_no);
				if(result > 0) {
					txManager.commit(sts);
					//룸 사진 파일 삭제
					for(int i = 0; i < roomList.size(); i++) {
						cloudinaryService.delete(roomList.get(i).getRoom_img_save());
					}
					//스터디 카페 파일 삭제
					cloudinaryService.delete(vo.getP_img_save());

					//결제 취소 진행
					for(int i = 0; i < reserveList.size(); i++) {
						kakaoPayService.payCancel(reserveList.get(i));
					}
				} else {
					txManager.rollback(sts);
				}
			} else {
				txManager.rollback(sts);
			}
		} catch(Exception e) {
			e.printStackTrace();
			txManager.rollback(sts);
		}

		return new Gson().toJson(result);
	}

	@PostMapping("/updateData.lo")
	@ResponseBody
	public String updateData(@RequestParam("p_no") int p_no) throws Exception {
		Place result = placeService.selectOne(p_no);
		return new Gson().toJson(result);
	}
	
	@PostMapping("/update.lo")
	@ResponseBody
	public int updatePlace(
			Place vo
			,@RequestParam("file") MultipartFile file
			,@RequestParam("address_first") String address_first
			,@RequestParam("address_second") String address_second) throws Exception {
		int result = 0;
		//총 주소 저장
		vo.setP_address(address_first+", "+address_second);
		
		//주소를 수정하는지 체크
		if(address_first != null && !address_first.equals("")) {
			//주소로 좌표 가져오기
			Map<String,String> coordinateResult = kakaoMapService.getAddressCoordinate(address_first);
			//좌표 저장
			vo.setP_x(Double.parseDouble(coordinateResult.get("x")));
			vo.setP_y(Double.parseDouble(coordinateResult.get("y")));
			
			//지역 코드 가져오기
			String area_code = areaService.selectAreaCode(address_first.split(" ")[0], address_first.split(" ")[1]);
			vo.setArea_code(area_code);
		}
		
		//업데이트 전 기존 정보 가져오기
		Place checkVo = placeService.selectOne(vo.getP_no());
		
		//장소 정보 업데이트
		result = placeService.updateInfo(vo);
		
		//장소 정보 업데이트 후 사진 파일 확인 후 정보 업데이트
		if(result > 0) {
			if(!file.isEmpty()) {
				//파일 업로드
				Map<String,String> uploadResult = cloudinaryService.upload(file.getBytes(), "placeImg");
				vo.setP_img_route(uploadResult.get("url")); 
				vo.setP_img_save(uploadResult.get("publicId"));
				vo.setP_img_origin(file.getOriginalFilename());
				
				//장소 사진 정보 업데이트
				result = placeService.updateImg(vo);
				
				//기존 업로드 파일 삭제
				if(result > 0) {
					String deleteResult = cloudinaryService.delete(checkVo.getP_img_save());
				}
			}
		}
		
		return result;
	}
	
}
