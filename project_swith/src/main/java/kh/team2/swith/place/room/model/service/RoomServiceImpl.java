package kh.team2.swith.place.room.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.place.room.model.dao.RoomDao;
import kh.team2.swith.place.room.model.vo.StudyRoom;

@Service
public class RoomServiceImpl implements RoomServcie{
	
	@Autowired
	private RoomDao dao;

	@Override
	public int insertRoom(StudyRoom vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertRoom(vo);
	}
	
	@Override
	public int insertRoomList(List<StudyRoom> voList) throws Exception {
		return dao.insertRoomList(voList);
	}

	@Override
	public int updateRoom(StudyRoom vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateRoom(vo);
	}

	@Override
	public int deleteRoom(int room_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteRoom(room_no);
	}

	@Override
	public StudyRoom selectRoom(int room_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectRoom(room_no);
	}

	@Override
	public List<StudyRoom> selectListRoom(int p_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListRoom(p_no);
	}

	@Override
	public int selectRoomCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectRoomCount();
	}
	
}
