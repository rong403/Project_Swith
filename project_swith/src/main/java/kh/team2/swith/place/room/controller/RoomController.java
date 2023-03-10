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
			//?????? ?????????
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
		
		//??????????????? ???????????? ???????????? ?????? ??????
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		DataSourceTransactionManager txManager = new DataSourceTransactionManager(dataSource);

		TransactionStatus sts = txManager.getTransaction(def);
		
		try {
			//?????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????
			List<ReserveInfo> reserveList = reserveService.selectListReserveRoomDelete(room_no);
			
			if(reserveList.size() > 0) {
				//?????? ???????????? ??????
				if(reserveService.cancelInsertRoomDelete(room_no) > 0) {
					//?????? ?????? ??????
					if(reserveService.deleteReserveRoomDelete(room_no) > 0) {
						//?????? ?????? ??????
						if(cardInfoService.deleteCardInfoPlaceRoomDelete(reserveList) > 0) {
							//?????? ?????? - ?????? ?????? ????????? ???????????? ??????
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
			
			//???????????? ?????? ????????? ?????? ?????? ?????? ????????????
			StudyRoom checkVo = roomService.selectRoom(room_no);
			
			//??? ?????? ?????? ??????
			if(roomService.deleteRoomImg(room_no) > 0) {
				//??? ?????? ??????
				result = roomService.deleteRoom(room_no);
				if(result > 0) {
					txManager.commit(sts);
					//??? ?????? ?????? ??????
					cloudinaryService.delete(checkVo.getRoom_img_save());
					//?????? ?????? ??????
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
			//??? ?????? ????????????
			result = roomService.updateRoom(vo);
			
			if(result > 0) {
				if(!file.isEmpty()) {
					//???????????? ????????? ?????? ?????? ?????? ????????????
					StudyRoom checkVo = roomService.selectRoom(vo.getRoom_no());
					
					//?????? ?????? ?????????
					Map<String,String> uploadResult = cloudinaryService.upload(file.getBytes(), "roomImg");
					vo.setRoom_img_route(uploadResult.get("url")); 
					vo.setRoom_img_save(uploadResult.get("publicId"));
					vo.setRoom_img_origin(file.getOriginalFilename());
					
					try {
						//??? ????????? DB?????? ??????
						result = roomService.updateRoomImg(vo);
						//??? ????????? db?????? ?????? ?????? ??? ???????????? ?????? ????????? ??????
						if(result > 0) {
							cloudinaryService.delete(checkVo.getRoom_img_save());
						} else {
							//db ?????? ?????? ?????? ?????? ?????? ?????? ?????? ????????? ????????? ??????
							cloudinaryService.delete(vo.getRoom_img_save());
						}
					} catch(Exception e1) {
						//db ?????? ?????? ??? ?????? ??? ?????? ?????? ????????? ????????? ??????
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
