package kh.team2.swith.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.member.model.dao.MemberAuthDao;
import kh.team2.swith.member.model.dao.MemberDao;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.member.model.vo.Profile;

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
	public int updateMember() {
		// TODO Auto-generated method stub
		return 0;
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

	@Override
	public Profile selectProfile(String member_id) {
		return mdao.selectProfile(member_id);
	}

	

}
