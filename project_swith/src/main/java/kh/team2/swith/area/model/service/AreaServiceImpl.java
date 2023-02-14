package kh.team2.swith.area.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.area.model.dao.AreaDao;
import kh.team2.swith.area.model.vo.Area;

@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	private AreaDao dao;
	
	@Override
	public Area selectOne(String area_code) throws Exception {
		return dao.selectOne(area_code);
	}

	@Override
	public List<Area> selectList() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

}
