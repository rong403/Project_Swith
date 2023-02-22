package kh.team2.swith.place.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.team2.swith.place.model.vo.PlaceInfo;
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
	
	@PostMapping("/reserve.lo")
	@ResponseBody
	public String ajaxRoomDetail(
			@RequestParam("room_no") int room_no
			) throws Exception {
		StudyRoom roomVo = roomService.selectRoom(room_no);
		
		return new Gson().toJson(roomVo);
	}
	
	//TODO hhjng
	public String insertRoom(StudyRoom vo) {
		return "redirect:/";
	}
	public String updateRoom(StudyRoom vo) {
		return "redirect:/";
	}
	public String deleteRoom(int room_no) {
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
