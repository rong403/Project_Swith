package kh.team2.swith.study.model.service;

import java.util.List;

import kh.team2.swith.study.model.vo.Study;

public interface StudyService {
	public int insertStudy(Study vo) throws Exception;
	public List<Study> studylist() throws Exception;
}
