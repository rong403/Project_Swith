package kh.team2.swith.study.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.member.model.vo.Inform;
import kh.team2.swith.study.model.service.StudyParticipantService;
import kh.team2.swith.study.model.service.StudyReserverService;
import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.Study;
import kh.team2.swith.study.model.vo.StudyParticipant;
import kh.team2.swith.study.model.vo.StudyReserver;

@Controller
@RequestMapping("/studyManager")
public class StudyManagerController {


	@Autowired
	private StudyParticipantService spService;
	@Autowired
	private StudyReserverService srService;
	@Autowired
	private StudyService studyService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private DataSource dataSource;
	
	@PostMapping("/participantList.lo")
	@ResponseBody
	public String selectListStudyParticipant(@RequestParam("study_no") int study_no) throws Exception {
		List<StudyParticipant> voList = spService.selectStudyList(study_no);
		String studyNoStr = String.valueOf(study_no);
		Study vo = studyService.selectStudy(studyNoStr);
		int cnt = spService.selectStudyListCnt(study_no);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("voList", voList);
		resultMap.put("vo", vo);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	@PostMapping("/reserverList.lo")
	@ResponseBody
	public String selectListStudyReserver(@RequestParam("study_no") int study_no) throws Exception {
		List<StudyReserver> voList = srService.selectStudyList(study_no);
		String studyNoStr = String.valueOf(study_no);
		Study vo = studyService.selectStudy(studyNoStr);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", voList);
		resultMap.put("vo", vo);
		return new Gson().toJson(resultMap);
	}
	
	@PostMapping("/transfer.lo")
	@ResponseBody
	public String updateStudyManagerTransfer(
			@RequestParam("agr_number") int agr_number
			,@RequestParam("study_no") int study_no
			,Principal principal
			) {
		int result = 0;

		//트랙잭션을 수동으로 처리하기 위한 설정
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		DataSourceTransactionManager txManager = new DataSourceTransactionManager(dataSource);
		TransactionStatus sts = txManager.getTransaction(def);
		
		// 현재 로그인 정보 가져오기
		String loginMemberId = principal.getName();
		try {
			// 현재 로그인한 회원의 해당 스터디 참가자 정보 가져오기
			StudyParticipant loginParticipantVo = spService.selectOneStudyParticipantMember(loginMemberId, study_no);
			// 양도 받을 참가자 번호로 아이디,스터디명 가져오기
			Map<String, String> resultMap = spService.selectStudyParticipantAgrNo(agr_number);
			
			// 권한 수정
			//양도 받는 참가자로 스터디장 변경
			if(spService.updateStudyParticipantTransfer(1, agr_number) > 0) {
				 //현재 스터디장 일반스터디원으로 변경
				if(spService.updateStudyParticipantTransfer(2, loginParticipantVo.getAgr_number()) > 0) {
					// 알람 정보 넣기
					Inform informVo = new Inform();
					String infromContent = resultMap.get("STUDY_NAME")+" 모임의 스터디장이 회원님으로 변경되었습니다.";
					informVo.setInform_content(infromContent);
					informVo.setMember_id(resultMap.get("MEMBER_ID"));
					
					//양도 받을 참가자에게 알람 정보 넣기
					result = memberService.insertInform(informVo);
					if(result > 0) {
						txManager.commit(sts);
					} else {
						txManager.rollback(sts);
					}
					
				} else {
					txManager.rollback(sts);
				}
			} else {
				txManager.rollback(sts);
			}
		} catch(Exception e) {
			txManager.rollback(sts);
		}
		
		
		return new Gson().toJson(result);
	}
	
	@PostMapping("/recruitCondition.lo")
	@ResponseBody
	public int updateRecruitCondition(
			@RequestParam("study_no") int study_no
			,@RequestParam("study_recruitment_condition") int study_recruitment_condition
			) {
		int result = 0;
		try {
			result = studyService.updateStudyRecruitmentCondition(study_no, study_recruitment_condition);
		} catch(Exception e) {
			result = 0;
		}
		
		return result;
	}
	
	@PostMapping("/reserverCondition.lo")
	@ResponseBody
	public int updateReserverCondition(
			@RequestParam("study_no") int study_no
			,@RequestParam("req_condition") int req_condition
			,@RequestParam("member_id") String member_id
			) {
		int result = 0;

		//트랙잭션을 수동으로 처리하기 위한 설정
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		DataSourceTransactionManager txManager = new DataSourceTransactionManager(dataSource);
		TransactionStatus sts = txManager.getTransaction(def);
		
		try {
			//해당 스터디 정보 가져오기
			String studyNoStr = String.valueOf(study_no);
			Study vo = studyService.selectStudy(studyNoStr);
			//자신을 제외한 스터디원 수 가져오기
			int cnt = spService.selectStudyListCnt(study_no);
			
			//스터디 정원 초과 방지
			if((vo.getStudy_people()-1) == cnt && req_condition == 2) {
				result=99;
			} else {
				//신청 상태 변경
				if(srService.update(study_no, member_id, req_condition) > 0) {
					// 알람 정보 넣기
					Inform informVo = new Inform();
					String infromContent = "";
					
					//승인, 거절에 따라 뿐류
					if(req_condition == 2) {
						infromContent = vo.getStudy_name()+" 모임의 가입 신청이 승인되었습니다.";
						//스터디 참가자로 넣기
						if(spService.insert(study_no, member_id) == 0) {
							txManager.rollback(sts);
							return result;
						} 
					} else {
						infromContent = vo.getStudy_name()+" 모임의 가입 신청이 거절되었습니다.";
					}
					
					informVo.setInform_content(infromContent);
					informVo.setMember_id(member_id);
					
					//참가 신청한 참가자에게 알람 정보 넣기
					result = memberService.insertInform(informVo);
					if(result > 0) {
						txManager.commit(sts);
					} else {
						txManager.rollback(sts);
					}
				} else {
					txManager.rollback(sts);
				}
			}
		} catch(Exception e) {
			txManager.rollback(sts);
		}
		
		return result;
	}
}
