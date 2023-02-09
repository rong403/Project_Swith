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
	
	public int insertRoom(StudyRoom vo) {
		return session.insert("", vo);
	}
	public int updateRoom(StudyRoom vo) {
		return session.update("", vo);
	}
	public int deleteRoom(int room_no) {
		return session.delete("", room_no);
	}
	
	//TODO hhjng
	public StudyRoom selectRoom(int room_no) {
		return session.selectOne("studyRoom/selectRoom", room_no);
	}
	public List<StudyRoom> selectListRoom(){
		return session.selectList("");
	}
	
	//TODO hhjng
	public int selectRoomCount() {
		return 0;
	}
}
