package kh.team2.swith.place.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.team2.swith.place.room.model.service.RoomServcie;
import kh.team2.swith.place.room.model.vo.StudyRoom;

@Controller
@RequestMapping("/room")
public class RoomController {
	private RoomServcie service;
	
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
