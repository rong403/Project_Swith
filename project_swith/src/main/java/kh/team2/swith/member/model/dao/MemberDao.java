package kh.team2.swith.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.member.model.vo.CustomMemberDetails;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
}
