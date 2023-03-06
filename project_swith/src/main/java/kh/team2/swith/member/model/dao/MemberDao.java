package kh.team2.swith.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.member.model.vo.CustomMemberDetails;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.member.model.vo.Profile;
import kh.team2.swith.member.model.vo.ProfileImg;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	public int insertMember(Member vo) {
		return sqlSession.insert("member.insertMember", vo);
	}
	public int updateMember(Member vo) {
		return sqlSession.update("member.updateMember", vo);
	}
	public Member selectMember(String member_id) {
		return sqlSession.selectOne("member.selectMember", member_id);
	}
	public String selectId(Member vo) {
		return sqlSession.selectOne("member.selectId", vo);
	}
	public String selectFullId(Member vo) {
		return sqlSession.selectOne("member.selectFullId", vo);
	}
	public int selectPwd(Member vo) {
		return sqlSession.selectOne("member.selectPwd", vo);
	}
	public int updatePwd(Member vo) {
		return sqlSession.update("member.updatePwd", vo);
	}
	public int checkId(String member_id) {
		return sqlSession.selectOne("member.checkId", member_id);
	}
	public int checkEmail(String email) {
		return sqlSession.selectOne("member.checkEmail", email);
	}
	public Profile selectProfile(String member_id) {
		return sqlSession.selectOne("profile.selectProfile", member_id);
	}
	public int updateProfile(Profile vo) {
		return sqlSession.update("profile.updateProfile", vo);
	}
	public int updateProfileImg(ProfileImg pvo) {
		return sqlSession.update("profile.updateProfileImg", pvo);
	}
	public ProfileImg selectProfileImg(String member_id) {
		return sqlSession.selectOne("profile.selectProfileImg", member_id);
	}
}
