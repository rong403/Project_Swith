package kh.team2.swith.study.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.study.model.dao.StudyDao;
import kh.team2.swith.study.model.vo.Study;

@Service
public class StudyServiceImpl implements StudyService{
	@Autowired
	private StudyDao dao;
	
	@Override
	public int insertStudy(Study vo) {
		return dao.insertStudy(vo);
		
	}
}
