package kh.team2.swith.test.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.test.model.dao.TestDao;
import kh.team2.swith.test.model.vo.TestVo;

@Service
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDao dao;
	
	public int insertTest(TestVo vo){
		return dao.insertTest(vo);
	}
	@Override
	public int updateTest(TestVo vo){
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteTest(int testNum){
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public TestVo selectTest(TestVo vo){
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<TestVo> selectListTest(){
		// TODO Auto-generated method stub
		return null;
	}
}
