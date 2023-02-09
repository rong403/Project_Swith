package kh.team2.swith.place.room.model.service;

import java.util.List;

import kh.team2.swith.place.room.model.vo.StudyRoom;

public interface RoomServcie {
	public int insertRoom(StudyRoom vo);
	public int updateRoom(StudyRoom vo);
	public int deleteRoom(int room_no);
	public StudyRoom selectRoom(int room_no);
	public List<StudyRoom> selectListRoom();
	public int selectRoomCount();
}
