package kh.team2.swith.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.member.model.vo.CustomMemberDetails;
import kh.team2.swith.member.model.vo.Inform;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.member.model.vo.MemberProfile;
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
	public int insertProfile(Profile vo) {
		return sqlSession.insert("profile.insertProfile", vo);
	}
	public int updateProfile(Profile vo) {
		return sqlSession.update("profile.updateProfile", vo);
	}
	public Profile selectProfile(String member_id) {
		return sqlSession.selectOne("profile.selectProfile", member_id);
	}
	public int insertProfileImg(ProfileImg pvo) {
		return sqlSession.insert("profile.insertProfileImg", pvo);
	}
	public int updateProfileImg(ProfileImg pvo) {
		return sqlSession.update("profile.updateProfileImg", pvo);
	}
	public ProfileImg selectProfileImg(String member_id) {
		return sqlSession.selectOne("profile.selectProfileImg", member_id);
	}
	
	// stdInfo
	public int countCheckAdmin(String member_id) {
		return sqlSession.selectOne("member.countCheckAdmin", member_id);
	}
	
	public List<MemberProfile> selectListMemberAdmin(String member_keyword, String member_serch_type, int currentPage,
			int limit) throws Exception {
		int offset = (currentPage - 1)*limit; //시작 행
		RowBounds row = new RowBounds(offset, limit); // Rowbounds 객체
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_keyword", member_keyword);
		map.put("member_serch_type", member_serch_type);
		
		return sqlSession.selectList("member.selectListMemberAdmin", map, row);
	}

	public int selectMemberCountAdmin(String member_keyword, String member_serch_type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_keyword", member_keyword);
		map.put("member_serch_type", member_serch_type);
		
		return sqlSession.selectOne("member.selectMemberCountAdmin", map);
	}
	
	public int insertInformDeletePlace(int p_no) throws Exception {
		return sqlSession.insert("member.insertInformDeletePlace", p_no);
	}

	public int insertInformDeleteRoom(int room_no) throws Exception {
		return sqlSession.insert("member.insertInformDeleteRoom", room_no);
	}
	
	public int insertInform(Inform vo) throws Exception {
		return sqlSession.insert("member.insertInform", vo);
	}
}
