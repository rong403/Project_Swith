package kh.team2.swith.api.model.service;

import java.util.Map;

public interface KakaoMapService {
	public Map<String,String> getAddressCoordinate(String roadFullAddr);
}
