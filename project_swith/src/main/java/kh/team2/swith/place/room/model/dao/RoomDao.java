package kh.team2.swith.place.room.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.place.room.model.vo.StudyRoom;

@Repository
public class RoomDao {
	
	@Autowired
	private SqlSession session;
	
	public int insertRoom(StudyRoom vo) throws Exception {
		return session.insert("studyRoom.insertRoom", vo);
	}
	
	public int insertRoomList(List<StudyRoom> voList) throws Exception {
		return session.insert("studyRoom.insertList", voList);
	}
	
	public int updateRoom(StudyRoom vo) throws Exception {
		return session.update("", vo);
	}
	public int deleteRoom(int room_no) throws Exception {
		return session.delete("", room_no);
	}
	
	//TODO hhjng
	public StudyRoom selectRoom(int room_no) throws Exception {
		return session.selectOne("studyRoom/selectRoom", room_no);
	}
	public List<StudyRoom> selectListRoom(int p_no) throws Exception {
		return session.selectList("studyRoom.selectListRoom", p_no);
	}
	
	//TODO hhjng
	public int selectRoomCount() throws Exception {
		return 0;
	}
}
