package kh.team2.swith.test.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.test.model.dao.TestDao;
import kh.team2.swith.test.model.vo.TestVo;

@Service
public class TestService {

	@Autowired
	private TestDao dao;
	
	public int insertTest(TestVo vo) {
		return dao.insertTest(vo);
	}
}
