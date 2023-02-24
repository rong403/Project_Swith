package kh.team2.swith.study.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.study.model.dao.StudyAuthInfoDao;
import kh.team2.swith.study.model.vo.StudyAuthInfo;

@Service
public class StudyAuthInfoServiceImpl implements StudyAuthInfoService {

	@Autowired
	private StudyAuthInfoDao dao;
	
	@Override
	public StudyAuthInfo selectOne(int auth_code) throws Exception {
		return dao.selectOne(auth_code);
	}

	@Override
	public List<StudyAuthInfo> selectList() throws Exception {
		return dao.selectList();
	}
}
