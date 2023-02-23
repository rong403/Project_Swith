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
		return placeDao.insertPlace(placeInfo);
	}

	@Override
	public int updatePlace(PlaceInfo vo) throws Exception {
		return placeDao.updatePlace(vo);
	}

	@Override
	public int deletePlace(int p_no) throws Exception {
		return placeDao.deletePlace(p_no);
	}

	@Override
	public List<PlaceInfo> selectListPlace(int area_code, int currentPage, int limit) throws Exception {
		return placeDao.selectListPlace(area_code, currentPage, limit);
	}

	@Override
	public int selectPlaceCount(int area_code) throws Exception {
		return placeDao.selectPlaceCount(area_code);
	}

	@Override
	public int selectPlaceCode(String sigungu, String sido) throws Exception {
		return placeDao.selectPlaceCode(sigungu, sido);
	}

	@Override
	public int selectLastNo() throws Exception {
		return placeDao.selectLastNo();
	}

	@Override
	public PlaceInfo selectOne(int p_no) throws Exception {
		return placeDao.selectOne(p_no);
	}

	@Override
	public int selectPlaceNo(String sigungu, String pl_name) throws Exception {
		return placeDao.selectPlaceNo(sigungu, pl_name);
	}
	
}
