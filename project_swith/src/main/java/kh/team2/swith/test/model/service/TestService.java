package kh.team2.swith.test.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.test.model.dao.TestDao;
import kh.team2.swith.test.model.vo.TestVo;

public interface TestService {

	public int insertTest(TestVo vo);
	public int updateTest(TestVo vo);
	public int deleteTest(int testNum);
	public TestVo selectTest(TestVo vo);
	public List<TestVo> selectListTest();
}
