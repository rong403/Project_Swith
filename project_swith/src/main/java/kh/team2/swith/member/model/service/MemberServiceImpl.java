package kh.team2.swith.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.member.model.dao.MemberAuthDao;
import kh.team2.swith.member.model.dao.MemberDao;
import kh.team2.swith.member.model.vo.Inform;
import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.member.model.vo.MemberProfile;
import kh.team2.swith.member.model.vo.Profile;
import kh.team2.swith.member.model.vo.ProfileImg;
import kh.team2.swith.member.model.vo.Report;

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
	public int deleteMember(String member_id) {
		return mdao.deleteMember(member_id);
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
		return mdao.insertProfile(vo);
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
	public int insertProfileImg(ProfileImg pvo) {
		return mdao.insertProfileImg(pvo);
	}

	@Override
	public int updateProfileImg(ProfileImg pvo) {
		return mdao.updateProfileImg(pvo);
	}
	
	@Override
	public ProfileImg selectProfileImg(String member_id) {
		return mdao.selectProfileImg(member_id);
	}

	//관리자페이지
	@Override
	public int countCheckAdmin(String member_id) {
		return mdao.countCheckAdmin(member_id);
	}

	@Override
	public List<MemberProfile> selectListMemberAdmin(String member_keyword, String member_serch_type, int currentPage,
			int limit) throws Exception {
		return mdao.selectListMemberAdmin(member_keyword, member_serch_type, currentPage, limit);
	}

	@Override
	public int selectMemberCountAdmin(String member_keyword, String member_serch_type) throws Exception {
		return mdao.selectMemberCountAdmin(member_keyword, member_serch_type);
	}

	//알람
	@Override
	public int insertInformDeletePlace(int p_no) throws Exception {
		return mdao.insertInformDeletePlace(p_no);
	}

	@Override
	public int insertInformDeleteRoom(int room_no) throws Exception {
		return mdao.insertInformDeleteRoom(room_no);
	}

	@Override
	public int insertInform(Inform vo) throws Exception {
		return mdao.insertInform(vo);
	}

	@Override
	public List<Inform> selectListInfrom(String member_id) throws Exception {
		return mdao.selectListInfrom(member_id);
	}

	@Override
	public int updateInformCheck(int inform_no) throws Exception {
		return mdao.updateInformCheck(inform_no);
	}

	//신고 내역
	@Override
	public int insertReport(String member_id, int report_category_number, String report_content, int report_category) throws Exception {
		return mdao.insertReport(member_id, report_category_number, report_content, report_category);
	}

	@Override
	public List<Report> selectListReport(String member_id) throws Exception {
		return mdao.selectListReport(member_id);
	}

	@Override
	public int updateMemberStop(String member_id) throws Exception {
		return mdao.updateMemberStop(member_id);
	}

}
