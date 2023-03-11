package kh.team2.swith.penalty.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.member.model.vo.Inform;
import kh.team2.swith.penalty.model.service.PenaltyService;
import kh.team2.swith.penalty.model.vo.Penalty;
import kh.team2.swith.study.model.service.StudyParticipantService;
import kh.team2.swith.study.model.service.StudyService;

@Controller
@RequestMapping("/penalty")
public class PenaltyController {

	@Autowired
	private PenaltyService penaltyService;
	@Autowired
	private StudyService studyService;
	@Autowired
	private StudyParticipantService spService;
	@Autowired
	private MemberService memberService;

	@Autowired
	private DataSource dataSource;
	
	@PostMapping("/list.lo")
	@ResponseBody
	public String selectListPenalty(@RequestParam("agr_number") int agr_number) throws Exception {
		
		List<Penalty> list = penaltyService.selectPenaltyList(agr_number);

		return new Gson().toJson(list);
	}
	
	@PostMapping("/delete.lo")
	@ResponseBody
	public int deletePenalty(
				@RequestParam("penalty_no") int penalty_no
				,@RequestParam("penalty_reason") String penalty_reason
				) throws Exception {
		int result = 0;
		
		//트랙잭션을 수동으로 처리하기 위한 설정
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		DataSourceTransactionManager txManager = new DataSourceTransactionManager(dataSource);
		TransactionStatus sts = txManager.getTransaction(def);
		
		try {
			//기존 벌점 정보 가져오기
			Penalty vo = penaltyService.selectPenalty(penalty_no);
			//벌점 정보를 바탕으로 해당 참가자 회원아이디,스터디 명 가져오기
			Map<String, String> resultMap = spService.selectStudyParticipantPenaltyNo(penalty_no);
			//취소 사유 넣기
			vo.setPenalty_cancel_reason(penalty_reason);
			//벌점 취소 정보 넣기
			if(penaltyService.insertPenaltyCancel(vo) > 0) {
				//알람 정보 넣기
				Inform informVo = new Inform();
				String infromContent = resultMap.get("STUDY_NAME")+" 모임에서 "+vo.getPenalty_reason()+" 벌점이 삭제되었습니다.";
				informVo.setInform_content(infromContent);
				informVo.setMember_id(resultMap.get("MEMBER_ID"));
				
				result = memberService.insertInform(informVo);
				if(result > 0) {
					txManager.commit(sts);
				} else {
					txManager.rollback(sts);
				}
			} else {
				txManager.rollback(sts);
			}
		} catch(Exception e) {
			e.printStackTrace();
			txManager.rollback(sts);
		}
		return result;
	}
	
	@PostMapping("/write.lo")
	@ResponseBody
	public int writePenalty(
				@RequestParam(value="checkVal[]") int[] penalty_pointArr
				,@RequestParam(value="checkText[]") String[] penalty_reasonarr
				,@RequestParam(value="agr_number") int agr_number
				) throws Exception {
		int result = 99;
		
		//트랙잭션을 수동으로 처리하기 위한 설정
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		DataSourceTransactionManager txManager = new DataSourceTransactionManager(dataSource);
		TransactionStatus sts = txManager.getTransaction(def);
		
		if(penalty_pointArr.length > 0) {

			//참가자 번호로 아이디,스터디명 가져오기
			Map<String, String> resultMap = spService.selectStudyParticipantAgrNo(agr_number);
			
			for(int i = 0; i < penalty_pointArr.length; i++) {
				//벌점 정보 넣기
				Penalty vo = new Penalty();
				vo.setPenalty_point(penalty_pointArr[i]);
				vo.setPenalty_reason(penalty_reasonarr[i]);
				vo.setAgr_number(agr_number);
				
				//insert된게 0일 경우가 나오면 반복문 종료 처리
				if(result == 0) break;
				
				//벌점 정보 넣기
				if(penaltyService.insertPenalty(vo) > 0) {
					//알람 정보 넣기
					Inform informVo = new Inform();
					String infromContent = resultMap.get("STUDY_NAME")+" 모임에서 "+penalty_reasonarr[i]+" 벌점이 부과되었습니다.";
					informVo.setInform_content(infromContent);
					informVo.setMember_id(resultMap.get("MEMBER_ID"));
					
					result = memberService.insertInform(informVo);
				} else {
					result = 0;
					txManager.rollback(sts);
				}
			}
			
			if(result > 0 && result != 99) {
				txManager.commit(sts);
			} else {
				txManager.rollback(sts);
			}
			
		} 
		
		return result;
	}
}
