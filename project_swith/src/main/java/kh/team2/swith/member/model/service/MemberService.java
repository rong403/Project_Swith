package kh.team2.swith.member.model.service;

import kh.team2.swith.member.model.vo.Member;

public interface MemberService {
	public int insertMember(Member vo);
	public int updateMember();
	public int deleteMember();
	public Member selectMember(String member_id);
	
	// 회원가입 기능
	public int checkId(String member_id);
	public int checkEmail(String email);
	
	// security
	void countFailure(String username);
    int checkFailureCount(String username);
    void disabledUsername(String username);
    void resetFailureCnt(String username);
}
