package kh.team2.swith.place.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.place.model.vo.PlaceImg;
import kh.team2.swith.place.model.vo.PlaceInfo;

@Repository("placeDao")
public class PlaceDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertPlace(PlaceInfo vo) throws Exception {
		return sqlSession.insert("place.insertAll", vo);
	}

	public int updatePlace(PlaceInfo vo) throws Exception {
		return sqlSession.update("place.update", vo);
	}

	public int deletePlace(int p_no) throws Exception {
		return sqlSession.delete("place.delete", p_no);
	}

	public List<PlaceInfo> selectListPlace(int area_code, int currentPage, int limit) throws Exception {
		int offset = (currentPage - 1)*limit; //시작 행
		RowBounds row = new RowBounds(offset, limit); // Rowbounds 객체
		
		return sqlSession.selectList("place.selectList", area_code, row);
	}

	public int selectPlaceCount(int area_code) throws Exception {
		return sqlSession.selectOne("place.selectListCnt", area_code);
	}

	public int selectPlaceCode(String sigungu, String sido) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		result.put("sigungu", sigungu);
		result.put("sido", sido);
		return sqlSession.selectOne("", result);
	}
	
	public int selectLastNo() throws Exception {
		return sqlSession.selectOne("place.selectLastNo");
	}
	
	public PlaceInfo selectOne(int p_no) throws Exception {
		return sqlSession.selectOne("place.selectOne", p_no);
	}
	
	public int selectPlaceNo(String sigungu, String pl_name) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sigungu", sigungu);
		map.put("pl_name", pl_name);
		
		return sqlSession.selectOne("place.selectPlaceNo", map);
	}
	
	//관리자 페이지
	public List<PlaceInfo> selectListPlaceAdmin(String studyCafe_keyword, String sido_name, int area_code, int currentPage, int limit)
			throws Exception {
		int offset = (currentPage - 1)*limit; //시작 행
		RowBounds row = new RowBounds(offset, limit); // Rowbounds 객체
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("area_code", area_code);
		map.put("studyCafe_keyword", studyCafe_keyword);
		map.put("sido_name", sido_name);
		
		return sqlSession.selectList("place.selectListAdmin", map, row);
	}

	public int selectPlaceCountAdmin(String studyCafe_keyword, String sido_name, int area_code) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("area_code", area_code);
		map.put("studyCafe_keyword", studyCafe_keyword);
		map.put("sido_name", sido_name);
		
		return sqlSession.selectOne("place.selectListCntAdmin", map);
	}
}
