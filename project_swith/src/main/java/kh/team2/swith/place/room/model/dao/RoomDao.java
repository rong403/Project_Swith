package kh.team2.swith.place.room.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.place.room.model.vo.StudyRoom;

@Repository
public class RoomDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertRoom(StudyRoom vo) throws Exception {
		return sqlSession.insert("studyRoom.insertRoom", vo);
	}
	
	public int insertRoomList(List<StudyRoom> voList) throws Exception {
		return sqlSession.insert("studyRoom.insertList", voList);
	}
	
	public int updateRoom(StudyRoom vo) throws Exception {
		return sqlSession.update("", vo);
	}
	public int deleteRoom(int room_no) throws Exception {
		return sqlSession.delete("", room_no);
	}
	
	public StudyRoom selectRoom(int room_no) throws Exception {
		return sqlSession.selectOne("studyRoom.selectRoom", room_no);
	}
	public List<StudyRoom> selectListRoom(int p_no) throws Exception {
		return sqlSession.selectList("studyRoom.selectListRoom", p_no);
	}
	
	//TODO hhjng
	public int selectRoomCount() throws Exception {
		return 0;
	}
	
	public int selectRoomNo(int p_no, String room_name) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_no", p_no);
		map.put("room_name", room_name);
		return sqlSession.selectOne("studyRoom.selectRoomNo", map);
	}
}
