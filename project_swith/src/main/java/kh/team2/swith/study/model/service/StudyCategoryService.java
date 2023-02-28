package kh.team2.swith.study.model.service;

import java.util.List;

import kh.team2.swith.study.model.vo.StudyCategory;

public interface StudyCategoryService {
	public List<StudyCategory> selectCategoryList() throws Exception;
}
