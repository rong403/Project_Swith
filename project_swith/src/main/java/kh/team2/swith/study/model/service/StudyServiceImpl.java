package kh.team2.swith.study.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.study.model.dao.StudyDao;
import kh.team2.swith.study.model.vo.Study;

@Service
public class StudyServiceImpl implements StudyService{
	@Autowired
	private StudyDao dao;
	
	@Override
	public int insertStudy(Study vo) throws Exception{
		return dao.insertStudy(vo);
		
	}

	@Override
	public List<Study> selectListStudy() throws Exception {
		
		return dao.selectListStudy();
	}

	@Override
	public Study selectStudy(String study_no) throws Exception {
		return dao.selectStudy(study_no);
	}


}
