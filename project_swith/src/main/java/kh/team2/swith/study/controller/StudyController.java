package kh.team2.swith.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.team2.swith.board.model.service.BoardWriteService;
import kh.team2.swith.board.model.vo.BoardWrite;
import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.schedule.model.vo.Schedule;
import kh.team2.swith.study.model.service.StudyCategoryService;
import kh.team2.swith.study.model.service.StudyParticipantService;
import kh.team2.swith.study.model.service.StudyReserverService;
import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.Study;
import kh.team2.swith.study.model.vo.StudyCategory;
import kh.team2.swith.study.model.vo.StudyComment;
import kh.team2.swith.study.model.vo.StudyParticipant;
import kh.team2.swith.study.model.vo.StudyReserver;

@Controller
@SessionAttributes({ "admin", "stAdmin", "loginMember"})
public class StudyController {
	
	@Autowired
	private StudyService service;
	@Autowired
	private StudyCategoryService scService;
	@Autowired
	private StudyReserverService srService;
	@Autowired
	private StudyParticipantService spService;
	@Autowired
	private MemberService mService;
	@Autowired
	private BoardWriteService boradService;
	
	@RequestMapping(value="/study", method = RequestMethod.GET)
	public ModelAndView viewStudy(
			String study_no, Principal principal, ModelAndView mv,@RequestParam(value="page",required =false, defaultValue ="info") String page){
		
		// 해당 스터디 정보 가져오기
		Study result = null;
		try {
			result = service.selectStudy(study_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 해당 스터디 정보의 코멘트 가져오기
		List<StudyComment> comment = null;
		try {
			comment = service.selectListStudyComment(study_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 현재 로그인 정보 가져오기
		String loginMember = principal.getName();
		// 관리자, 스터디 관리자 여부 확인
		int admin = 0;
		int stAdmin = 0;
		int stdAuth = 0;
		int stdReserverCondition = 0;
		int stdPNum = 1;
		try {
			admin = mService.countCheckAdmin(loginMember);
			stAdmin = service.countCheckStudyAdmin(loginMember, study_no);
			stdAuth = service.countCheckStudyPartidipant(loginMember, study_no);
			try {
				stdReserverCondition = srService.selectStudyReserverCondition(study_no, loginMember);
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
			stdPNum += spService.selectStudyListCnt(Integer.parseInt(study_no));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//게시글 목록 가져오기
		List<BoardWrite> boardlist = null;
		try {
			boardlist = boradService.selectListBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("boardlist", boardlist);
		mv.addObject("study", result);
		mv.addObject("comment", comment);
		mv.addObject("loginMember", loginMember);
		mv.addObject("admin", admin);
		mv.addObject("stAdmin", stAdmin);
		mv.addObject("stdAuth", stdAuth);
		mv.addObject("stdReserverCondition", stdReserverCondition);
		mv.addObject("stdPNum", stdPNum);
		 
		//페이지 처리
		switch(page) {
		case "schedule" : if(stAdmin == 1 || stdAuth == 1) {mv.setViewName("study/studySchedule"); break;}
		case "board" : if(stAdmin == 1 || stdAuth == 1) {mv.setViewName("study/studyBoard"); break;}
		case "admin" : if(stAdmin == 1) {mv.setViewName("study/studyAdmin"); break;}
		case "info" : 
		default : mv.setViewName("study/study"); break;
		}
		return mv;
	}
	
	@RequestMapping(value = "/CreateStudy", method = RequestMethod.GET)
	public ModelAndView main22(ModelAndView mv) throws Exception {
		List<StudyCategory> list = scService.selectCategoryList();
		
		mv.setViewName("study/stdEnroll");
		mv.addObject("category", list);
		return mv; 
	}
	
	@PostMapping("/CreateStudy")
	public String insertStudy( Study vo , @RequestParam("study_category[]") String[] study_category,
			Principal principal
			//, StudyCategory cvo
			)  throws Exception {
		String member_id = principal.getName();
		int sum=0;
		for(int i = 0; i < study_category.length; i++) {
		    System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ study_category "+i+" : "+study_category[i]);
		    int category = Integer.parseInt(study_category[i]);
		    sum += category;
		}
		vo.setStudy_category(sum);
//		String binaryString = Integer.toBinaryString(sum);
//	    for (int i = 0; i < binaryString.length(); i++) {
//	        if (binaryString.charAt(i) == '1') {
//	            int categoryCode = i + 1;
//	            
//	            String categoryName = cvo.getStudy_category_name();
//	            System.out.println(categoryName);
//	        }
//	    }
//		System.out.println(vo);
		int result = service.insertStudy(vo);
		if(result > 0) {
			result = service.insertStudyCreateParticipant(member_id);
		}
		return "redirect:/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/fileupload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/noticeimg");
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdirs();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            String fileUrl = req.getContextPath() + "/resources/images/noticeimg/" +fileName2 +fileName; 
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}
			}
		}
	}
	
	@PostMapping("/participantCheck.lo")
	@ResponseBody
	public String StudyParticipantCheck(@RequestParam("study_no") int study_no) throws Exception {
		
		return new Gson().toJson("");
	}
	
	
	//writeStudyComment
	@PostMapping("/writeStdCmt")
	@ResponseBody
	public String writeStudyComment(
			StudyComment comm
			, Principal principal
			, @RequestParam(name="study_no") String study_no
			, @RequestParam(name="study_comment") String study_comment
			, @ModelAttribute("admin") int admin
			, @ModelAttribute("stAdmin") int stAdmin
			, @ModelAttribute("loginMember") String loginMember
			){
		int study_no_int = Integer.parseInt(study_no);
		
		String member_id = principal.getName();
		comm.setMember_id(member_id);
		comm.setStudy_no(study_no_int);
		comm.setStudy_comment(study_comment);
		int result = 0;
		try {
			result = service.insertStudyComment(comm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<StudyComment> commentList = null;
		try {
			commentList = service.selectListStudyComment(study_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentList", commentList);
		map.put("admin", admin);
		map.put("stAdmin", stAdmin);
		map.put("loginMember", loginMember);

		return new Gson().toJson(map);
	}
	//answerStudyComment
	@PostMapping("/answerStdCmt")
	@ResponseBody
	public String answerStudyComment(
			StudyComment comm
			, Principal principal
			, @RequestParam(name="study_no") String study_no
			, @RequestParam(name="study_comment") String study_comment
			, @RequestParam(name="study_comment_origin") String comment_origin
			, @RequestParam(name="study_comment_level") String comment_level
			, @RequestParam(name="study_comment_seq") String comment_seq
			, @ModelAttribute("admin") int admin
			, @ModelAttribute("stAdmin") int stAdmin
			, @ModelAttribute("loginMember") String loginMember
			){
		String member_id = principal.getName();
		comm.setMember_id(member_id);
		comm.setStudy_no(Integer.parseInt(study_no));
		comm.setStudy_comment(study_comment);
		comm.setStudy_comment_origin( Integer.parseInt(comment_origin));
		comm.setStudy_comment_level(Integer.parseInt(comment_level));
		comm.setStudy_comment_seq(Integer.parseInt(comment_seq));
		int result = 0;
		try {
			result = service.insertRelyComment(comm);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<StudyComment> commentList = null;
		try {
			commentList = service.selectListStudyComment(study_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentList", commentList);
		map.put("admin", admin);
		map.put("stAdmin", stAdmin);
		map.put("loginMember", loginMember);

		return new Gson().toJson(map);
	}
	@RequestMapping(value = "/insertStudyReserver", method = RequestMethod.POST)
    public void insertSchedule(StudyReserver vo
    		, Principal principal
    		, HttpServletResponse response
    		) throws IOException {
    	String member_id = principal.getName();
    	vo.setMember_id(member_id);
    	int result = 0;
		try {
			result = srService.insert(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	PrintWriter out = response.getWriter();
		if(result == 1) {
			out.print("success");
		} else {
			out.print("fail");
		}
    }
}
