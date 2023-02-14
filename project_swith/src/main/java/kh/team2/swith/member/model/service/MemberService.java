package kh.team2.swith.member.model.service;

public interface MemberService {
	public int insertMember();
	public int updateMember();
	public int deleteMember();
	public int selectMember(String member_id);
	
	// security
	void countFailure(String username);
    int checkFailureCount(String username);
    void disabledUsername(String username);
    void resetFailureCnt(String username);
}
