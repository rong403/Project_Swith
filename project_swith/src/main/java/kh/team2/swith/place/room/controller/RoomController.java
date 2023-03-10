package kh.team2.swith.place.room.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.team2.swith.api.model.service.CloudinaryService;
import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.place.model.vo.Place;
import kh.team2.swith.place.room.model.service.RoomServcie;
import kh.team2.swith.place.room.model.vo.StudyRoom;
import kh.team2.swith.reserve.model.service.CardInfoService;
import kh.team2.swith.reserve.model.service.KakaopayService;
import kh.team2.swith.reserve.model.service.ReserveService;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@Controller
@RequestMapping("/room")
public class RoomController {
	
	@Autowired
	private RoomServcie roomService;
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CardInfoService cardInfoService;
	
	@Autowired
	private CloudinaryService cloudinaryService;
	@Autowired
	private KakaopayService kakaoPayService;
	
	@Autowired
	private DataSource dataSource;
	
	@PostMapping("/detail.lo")
	@ResponseBody
	public String selectRoomOne(
			@RequestParam("room_no") int room_no
			) throws Exception {
		StudyRoom roomVo = roomService.selectRoom(room_no);
		
		return new Gson().toJson(roomVo);
	}
	
	@PostMapping("/write.lo")
	@ResponseBody
	public String writeRoom(
			StudyRoom vo
			,@RequestParam("file") MultipartFile file
			) {
		int result = 0;
		
		try {
			//파일 업로드
			if(!file.isEmpty()) { 
				Map<String,String> uploadResult = cloudinaryService.upload(file.getBytes(), "roomImg");
				vo.setRoom_img_route(uploadResult.get("url")); 
				vo.setRoom_img_save(uploadResult.get("publicId"));
				vo.setRoom_img_origin(file.getOriginalFilename());
			} 
			
			try {
				result = roomService.insertRoom(vo);
			} catch(Exception e) {
				e.printStackTrace();
				try {
					cloudinaryService.delete(vo.getRoom_img_save());
				} catch (IOException e1) {
					e1.printStackTrace();
					result = 99;
				}
				result = 99;
			}
		} catch(IOException e) {
			e.printStackTrace();
			result = 99;
		}
		
		return new Gson().toJson(result);
	}
	
	@PostMapping("/list.lo")
	@ResponseBody
	public String selectRoomList(@RequestParam("p_no") int p_no) throws Exception {
		List<StudyRoom> roomList = roomService.selectListRoom(p_no);
		return new Gson().toJson(roomList);
	}
	
	@PostMapping("/delete.lo")
	@ResponseBody
	public String deleteRoom(@RequestParam("room_no") int room_no) throws Exception {
		int result = 0;
		
		//트랙잭션을 수동으로 처리하기 위한 설정
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		DataSourceTransactionManager txManager = new DataSourceTransactionManager(dataSource);

		TransactionStatus sts = txManager.getTransaction(def);
		
		try {
			//결제 취소 요청을 위해 기존 예약 정보 가져오기
			List<ReserveInfo> reserveList = reserveService.selectListReserveRoomDelete(room_no);
			
			if(reserveList.size() > 0) {
				//취소 테이블에 추가
				if(reserveService.cancelInsertRoomDelete(room_no) > 0) {
					//예약 정보 삭제
					if(reserveService.deleteReserveRoomDelete(room_no) > 0) {
						//결제 정보 삭제
						if(cardInfoService.deleteCardInfoPlaceRoomDelete(reserveList) > 0) {
							//알람 추가 - 취소 예약 정보를 바탕으로 추가
							if(memberService.insertInformDeleteRoom(room_no) == 0) {
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
			
			//파일서버 사진 삭제를 위한 기존 정보 가져오기
			StudyRoom checkVo = roomService.selectRoom(room_no);
			
			//룸 사진 정보 삭제
			if(roomService.deleteRoomImg(room_no) > 0) {
				//룸 정보 삭제
				result = roomService.deleteRoom(room_no);
				if(result > 0) {
					txManager.commit(sts);
					//룸 사진 파일 삭제
					cloudinaryService.delete(checkVo.getRoom_img_save());
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

	@PostMapping("/update.lo")
	@ResponseBody
	public String updateRoom(
			StudyRoom vo
			,@RequestParam("file") MultipartFile file
			) {
		int result = 0;
		try {
			//룸 정보 업데이트
			result = roomService.updateRoom(vo);
			
			if(result > 0) {
				if(!file.isEmpty()) {
					//파일서버 삭제를 위한 기존 정보 가져오기
					StudyRoom checkVo = roomService.selectRoom(vo.getRoom_no());
					
					//파일 서버 업로드
					Map<String,String> uploadResult = cloudinaryService.upload(file.getBytes(), "roomImg");
					vo.setRoom_img_route(uploadResult.get("url")); 
					vo.setRoom_img_save(uploadResult.get("publicId"));
					vo.setRoom_img_origin(file.getOriginalFilename());
					
					try {
						//룸 이미지 DB정보 수정
						result = roomService.updateRoomImg(vo);
						//룸 이미지 db정보 수정 완료 시 파일서버 기존 이미지 삭제
						if(result > 0) {
							cloudinaryService.delete(checkVo.getRoom_img_save());
						} else {
							//db 정보 수정 된게 없을 경우 파일 서버 업로드 이미지 삭제
							cloudinaryService.delete(vo.getRoom_img_save());
						}
					} catch(Exception e1) {
						//db 정보 수정 중 오류 시 파일 서버 업로드 이미지 삭제
						cloudinaryService.delete(vo.getRoom_img_save());
						result = 99;
					}
				}
			} 
		} catch(Exception e) {
			result = 99;
		}

		return new Gson().toJson(result);
	}
	
}
