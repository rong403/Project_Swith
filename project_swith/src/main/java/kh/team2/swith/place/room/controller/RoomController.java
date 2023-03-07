package kh.team2.swith.place.room.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.team2.swith.api.model.service.CloudinaryService;
import kh.team2.swith.place.model.vo.Place;
import kh.team2.swith.place.room.model.service.RoomServcie;
import kh.team2.swith.place.room.model.vo.StudyRoom;
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
	private CloudinaryService cloudinaryService;
	
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
		
		try {
			//파일서버 삭제를 위한 기존 정보 가져오기
			StudyRoom checkVo = roomService.selectRoom(room_no);
			
			result = roomService.deleteRoomImg(room_no);
			if(result > 0) {
				//파일서버 사진 삭제
				cloudinaryService.delete(checkVo.getRoom_img_save());
				
				//룸 정보 삭제
				result = roomService.deleteRoom(room_no);
			}
			
		} catch(Exception e) {
			result = 99;
		}
		
		return new Gson().toJson(result);
	}
	
	
	
	//TODO hhjng
	public String insertRoom(StudyRoom vo) {
		return "redirect:/";
	}
	public String updateRoom(StudyRoom vo) {
		return "redirect:/";
	}
	public String selectRoom(int room_no) {
		return "redirect:/";
	}
	public String selectListRoom() {
		return "redirect:/";
	}
	public String selectRoomCount() {
		return "redirect:/";
	}
}
