package kh.team2.swith.member.model.service;

import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.member.model.vo.Profile;
import kh.team2.swith.member.model.vo.ProfileImg;

public interface MemberService {
	public int insertMember(Member vo);
	public int updateMember(Member vo);
	public int deleteMember();
	public Member selectMember(String member_id);
	
	// 계정 찾기
	public String selectId(Member vo);
	public String selectFullId(Member vo);
	public int selectPwd(Member vo);
	
	// 비밀번호 변경
	public int updatePwd(Member vo);
	
	// 회원가입 기능
	public int checkId(String member_id);
	public int checkEmail(String email);
	
	// security
	void countFailure(String username);
    int checkFailureCount(String username);
    void disabledUsername(String username);
    void resetFailureCnt(String username);
    
    // 프로필
    public int insertProfile(Profile vo);
    public int updateProfile(Profile vo);
    public Profile selectProfile(String member_id);
    
    // 프로필 이미지
    public int insertProfileImg(ProfileImg pvo);
    public int updateProfileImg(ProfileImg pvo);
    public ProfileImg selectProfileImg(String member_id);
}
