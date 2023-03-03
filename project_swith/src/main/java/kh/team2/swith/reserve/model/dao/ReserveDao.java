package kh.team2.swith.reserve.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.reserve.model.vo.CancelReserveInfo;
import kh.team2.swith.reserve.model.vo.ReserveChart;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@Repository
public class ReserveDao {
	@Autowired
	private SqlSession session;
	
	public int insertReserve(ReserveInfo vo) {
		return session.insert("reserve.insertReserve", vo);
	}
	public int updateReserve(ReserveInfo vo) {
		return session.update("reserve.updateReserve", vo);
	}
	public int deleteReserve(String member_id, String reserve_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("reserve_no", reserve_no);
		return session.delete("reserve.deleteReserve", map);
	}
	//TODO hhjng
	public ReserveInfo selectReserve(String member_id, String reserve_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("reserve_no", reserve_no);
		return session.selectOne("reserve.selectReserve", map);
	}
	public List<ReserveInfo> selectListReserve(){
		return session.selectList("reserve.selectListReserve");
	}
	public List<ReserveInfo> selectListMyReserve(String member_id){
		return session.selectList("reserve.selectListMyReserve", member_id);
	}
	//TODO hhjng
	public int selectReserveCount() {
		return 0;
	}
	
	public int insertCancelReserve(ReserveInfo vo) {
		return session.insert("reserve.cancelInsert", vo);
	}
	
	public CancelReserveInfo selectCancelReserve(String member_id, String reserve_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("reserve_no", reserve_no);
		return session.selectOne("reserve.cancelSelectReserve", map);
	}
	
	public List<ReserveInfo> selectListRoomReserve(int room_no) {
		return session.selectList("reserve.selectListRoomReserve", room_no);
	}
	
	//adminpage - homin
	public List<ReserveChart> selectAreaMonthPrice(String sido_name, int area_code) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sido_name", sido_name);
		map.put("area_code", area_code);
		return session.selectList("reserve.selectAreaMonthPrice", map);
	}

	public List<ReserveChart> selectAreaMonthCnt(String sido_name, int area_code) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sido_name", sido_name);
		map.put("area_code", area_code);
		return session.selectList("reserve.selectAreaMonthCnt", map);
	}
	
}
