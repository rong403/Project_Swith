package kh.team2.swith.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.member.model.dao.MemberAuthDao;
import kh.team2.swith.member.model.dao.MemberDao;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.member.model.vo.Profile;
import kh.team2.swith.member.model.vo.ProfileImg;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberAuthDao memberAuthDao;
	@Autowired
	private MemberDao mdao;
	
	@Override
	public int insertMember(Member vo) {
		return mdao.insertMember(vo);
	}

	@Override
	public int updateMember(Member vo) {
		return mdao.updateMember(vo);
	}

	@Override
	public int deleteMember() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member selectMember(String member_id) {
		return mdao.selectMember(member_id);
	}
	// 계정 찾기
	@Override
	public String selectId(Member vo) {
		return mdao.selectId(vo);
	}
	
	@Override
	public String selectFullId(Member vo) {
		return mdao.selectFullId(vo);
	}
	
	@Override
	public int selectPwd(Member vo) {
		return mdao.selectPwd(vo);
	}
	// 비밀번호 변경
	@Override
	public int updatePwd(Member vo) {
		return mdao.updatePwd(vo);
	}
	
	@Override
	public int checkId(String member_id) {
		return mdao.checkId(member_id);
	}

	@Override
	public int checkEmail(String email) {
		return mdao.checkEmail(email);
	}
	
	// security
	@Override
	public void countFailure(String username) {
		memberAuthDao.updateFailureCount(username);
	}

	@Override
	public int checkFailureCount(String username) {
		System.out.println("#######################");
		System.out.println(username);
		return memberAuthDao.checkFailureCount(username);
	}

	@Override
	public void disabledUsername(String username) {
		memberAuthDao.updateDisabled(username);
	}

	@Override
	public void resetFailureCnt(String username) {
		memberAuthDao.updateFailureCountReset(username);
	}

	// 프로필
	@Override
	public int insertProfile(Profile vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int updateProfile(Profile vo) {
		return mdao.updateProfile(vo);
	}
	
	@Override
	public Profile selectProfile(String member_id) {
		return mdao.selectProfile(member_id);
	}

	// 프로필 이미지
	@Override
	public int insertProfileImg(ProfileImg vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProfileImg(ProfileImg pvo) {
		return mdao.updateProfileImg(pvo);
	}
	
	@Override
	public ProfileImg selectProfileImg(String member_id) {
		return mdao.selectProfileImg(member_id);
	}

}
