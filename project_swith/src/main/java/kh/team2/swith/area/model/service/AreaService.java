package kh.team2.swith.area.model.service;

import java.util.List;

import kh.team2.swith.area.model.vo.Area;

public interface AreaService {
	public Area selectOne(String area_code) throws Exception;
	public String selectAreaCode(String sido_name, String sigungu_name) throws Exception;
	public List<Area> selectList() throws Exception;
	public List<String> selectSidoList() throws Exception;
	public List<Area> selectSigunguList(String sido_name) throws Exception;
}
