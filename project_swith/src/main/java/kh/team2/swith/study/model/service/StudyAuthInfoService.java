package kh.team2.swith.study.model.service;

import java.util.List;

import kh.team2.swith.study.model.vo.StudyAuthInfo;

public interface StudyAuthInfoService {
	public StudyAuthInfo selectOne(int auth_code) throws Exception;
	public List<StudyAuthInfo> selectList() throws Exception;
}
