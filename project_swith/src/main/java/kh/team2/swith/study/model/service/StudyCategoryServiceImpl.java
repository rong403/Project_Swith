package kh.team2.swith.study.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.study.model.dao.StudyCategoryDao;
import kh.team2.swith.study.model.vo.StudyCategory;

@Service
public class StudyCategoryServiceImpl implements StudyCategoryService{
	@Autowired
	private StudyCategoryDao dao;
	
	@Override
	public List<StudyCategory> selectCategoryList() throws Exception{
		return dao.selectCategoryList();
	}
}
