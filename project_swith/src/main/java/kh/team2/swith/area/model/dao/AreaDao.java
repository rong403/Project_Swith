package kh.team2.swith.area.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.area.model.vo.Area;

@Repository
public class AreaDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public Area selectOne(String area_code) throws Exception {
		return sqlSession.selectOne("area.selectOne", area_code);
	}

	public String selectAreaCode(String sido_name, String sigungu_name) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("sido_name", sido_name);
		resultMap.put("sigungu_name", sigungu_name);
		return sqlSession.selectOne("area.selectAreaCode", resultMap);
	}
	
	public List<Area> selectList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("area.selectList");
	}
	
	public List<Area> selectSigunguList(String sido_name) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("area.selectSigunguList", sido_name);
	}
}
