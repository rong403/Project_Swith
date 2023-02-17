package kh.team2.swith.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.member.model.vo.CustomMemberDetails;
import kh.team2.swith.member.model.vo.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	public int insertMember(Member vo) {
		return sqlSession.insert("member.insertMember", vo);
	}
	public Member selectMember(String member_id) {
		return sqlSession.selectOne("member.selectMember", member_id);
	}
	public int checkId(String member_id) {
		return sqlSession.selectOne("member.checkId", member_id);
	}
	public int checkEmail(String email) {
		return sqlSession.selectOne("member.checkEmail", email);
	}
}
