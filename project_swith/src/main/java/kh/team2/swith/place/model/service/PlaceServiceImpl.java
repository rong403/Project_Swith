package kh.team2.swith.place.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.place.model.dao.PlaceDao;
import kh.team2.swith.place.model.vo.Place;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDao placeDao;
	
	@Override
	public int insertPlace(Place vo) throws Exception {
		return placeDao.insertPlace(vo);
	}

	@Override
	public List<Place> selectListPlace(int area_code, int currentPage, int limit) throws Exception {
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
	public Place selectOne(int p_no) throws Exception {
		return placeDao.selectOne(p_no);
	}

	@Override
	public int selectPlaceNo(String sigungu, String pl_name) throws Exception {
		return placeDao.selectPlaceNo(sigungu, pl_name);
	}

	
	//관리자 페이지
	@Override
	public List<Place> selectListPlaceAdmin(String studyCafe_keyword, String sido_name, int area_code, int currentPage, int limit)
			throws Exception {
		return placeDao.selectListPlaceAdmin(studyCafe_keyword, sido_name, area_code, currentPage, limit);
	}

	@Override
	public int selectPlaceCountAdmin(String studyCafe_keyword, String sido_name, int area_code) throws Exception {
		return placeDao.selectPlaceCountAdmin(studyCafe_keyword, sido_name, area_code);
	}

	@Override
	public int updateInfo(Place vo) throws Exception {
		return placeDao.updateInfo(vo);
	}

	@Override
	public int updateImg(Place vo) throws Exception {
		return placeDao.updateImg(vo);
	}

	@Override
	public int deleteInfo(int p_no) throws Exception {
		return placeDao.deleteInfo(p_no);
	}

	@Override
	public int deleteImg(int p_img_no) throws Exception {
		return placeDao.deleteImg(p_img_no);
	}
	
}
