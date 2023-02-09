package kh.team2.swith.place.room.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.team2.swith.place.room.model.dao.RoomDao;
import kh.team2.swith.place.room.model.vo.StudyRoom;

@Service
public class RoomServiceImpl implements RoomServcie{
	private RoomDao dao;

	@Override
	public int insertRoom(StudyRoom vo) {
		// TODO Auto-generated method stub
		return dao.insertRoom(vo);
	}

	@Override
	public int updateRoom(StudyRoom vo) {
		// TODO Auto-generated method stub
		return dao.updateRoom(vo);
	}

	@Override
	public int deleteRoom(int room_no) {
		// TODO Auto-generated method stub
		return dao.deleteRoom(room_no);
	}

	@Override
	public StudyRoom selectRoom(int room_no) {
		// TODO Auto-generated method stub
		return dao.selectRoom(room_no);
	}

	@Override
	public List<StudyRoom> selectListRoom() {
		// TODO Auto-generated method stub
		return dao.selectListRoom();
	}

	@Override
	public int selectRoomCount() {
		// TODO Auto-generated method stub
		return dao.selectRoomCount();
	}
	
}
