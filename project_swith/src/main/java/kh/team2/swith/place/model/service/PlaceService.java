package kh.team2.swith.place.model.service;

import java.util.List;

import kh.team2.swith.place.model.vo.PlaceImg;
import kh.team2.swith.place.model.vo.Place;

public interface PlaceService {
	public int insertPlace(Place vo) throws Exception;
	public int updatePlace(Place vo) throws Exception;
	public int deletePlace(int p_no) throws Exception;
	public List<Place> selectListPlace(int area_code, int currentPage, int limit) throws Exception;
	public int selectPlaceCount(int area_code) throws Exception;
	public int selectPlaceCode(String sigungu, String sido) throws Exception;;
	public int selectLastNo() throws Exception;
	public Place selectOne(int p_no) throws Exception;
	public int selectPlaceNo(String sigungu, String pl_name) throws Exception;
	
	//관리자 페이지
	public List<Place> selectListPlaceAdmin(String studyCafe_keyword, String sido_name, int area_code, int currentPage, int limit) throws Exception;
	public int selectPlaceCountAdmin(String studyCafe_keyword, String sido_name, int area_code) throws Exception;
}
