package kh.team2.swith.place.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.place.model.dao.PlaceDao;
import kh.team2.swith.place.model.vo.PlaceImg;
import kh.team2.swith.place.model.vo.PlaceInfo;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDao placeDao;
	
	@Override
	public int insertPlace(PlaceInfo placeInfo) throws Exception {
		// TODO Auto-generated method stub
		return placeDao.insertPlace(placeInfo);
	}

	@Override
	public int updatePlace(PlaceInfo vo) throws Exception {
		// TODO Auto-generated method stub
		return placeDao.updatePlace(vo);
	}

	@Override
	public int deletePlace(int p_no) throws Exception {
		// TODO Auto-generated method stub
		return placeDao.deletePlace(p_no);
	}

	@Override
	public List<PlaceInfo> selectListPlace(int area_code, int currentPage, int limit) throws Exception {
		// TODO Auto-generated method stub
		return placeDao.selectListPlace(area_code, currentPage, limit);
	}

	@Override
	public int selectPlaceCount(int area_code) throws Exception {
		// TODO Auto-generated method stub
		return placeDao.selectPlaceCount(area_code);
	}

	@Override
	public int selectPlaceCode(String sigungu, String sido) throws Exception {
		// TODO Auto-generated method stub
		return placeDao.selectPlaceCode(sigungu, sido);
	}

	@Override
	public int selectLastNo() throws Exception {
		return placeDao.selectLastNo();
	}
	
}
