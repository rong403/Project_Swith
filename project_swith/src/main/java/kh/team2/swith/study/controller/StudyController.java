package kh.team2.swith.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

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
public class StudyController {
	
	@Autowired
	private StudyService service;
	@Autowired
	private StudyCategoryService scService;
	@Autowired
	private StudyParticipantService spService;
	
	@Autowired
	private StudyReserverService srService;
	
	@GetMapping("/study")
	public ModelAndView viewStudy(String study_no, ModelAndView mv
			)  throws Exception {
		Study result = service.selectStudy(study_no);
		mv.addObject("study", result);
		mv.setViewName("study/stdInfo");
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
	public String insertStudy( Study vo, @RequestParam("study_category[]") String[] study_category
			)  throws Exception {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		for(int i = 0; i < study_category.length; i++) {
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ study_category "+i+" : "+study_category[i]);
		}
		System.out.println(vo);
		int result = service.insertStudy(vo);
		return "redirect:/main";
	}
	
	@PostMapping("/studyParticipant.lo")
	@ResponseBody
	public String studyParticipantAjax(@RequestParam("study_no") int study_no) throws Exception {
		List<StudyParticipant> voList = spService.selectStudyList(study_no);
		int cnt = spService.selectStudyListCnt(study_no);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("voList", voList);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	@PostMapping("/studyReserver.lo")
	@ResponseBody
	public String studyReserverAjax(@RequestParam("study_no") int study_no) throws Exception {
		List<StudyReserver> voList = srService.selectStudyList(study_no);
		return new Gson().toJson(voList);
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
	
	//tempViewStudyComment
	@GetMapping("/studycomment")
	public ModelAndView tempViewStudyComment(ModelAndView mv) throws Exception {
		int study_no = 1;
		List<StudyComment> comment = service.selectListStudyComment(study_no);
		mv.addObject("comment", comment);
		mv.setViewName("/tempStdInfo");
		return mv;
	}
	
	//writeStudyComment
	@PostMapping("/writeStdCmt")
	@ResponseBody
	public void writeStudyComment(
			StudyComment comm
			, @RequestParam(name="member_id") String member_id
			, @RequestParam(name="study_no") String study_no
			, @RequestParam(name="study_comment") String study_comment) throws Exception {
		int study_no_int = Integer.parseInt(study_no);
		comm.setMember_id(member_id);
		comm.setStudy_no(study_no_int);
		comm.setStudy_comment(study_comment);
		int result = service.insertStudyComment(comm);
	}
	//answerStudyComment
	@PostMapping("/answerStdCmt")
	public void answerStudyComment(
			StudyComment comm
			, @RequestParam(name="member_id") String member_id
			, @RequestParam(name="study_no") String study_no
			, @RequestParam(name="study_comment") String study_comment
			, @RequestParam(name="study_comment_origin") String comment_origin
			, @RequestParam(name="study_comment_level") String comment_level
			, @RequestParam(name="study_comment_seq") String comment_seq) throws Exception {
		comm.setMember_id(member_id);
		comm.setStudy_no(Integer.parseInt(study_no));
		comm.setStudy_comment(study_comment);
		comm.setStudy_comment_origin( Integer.parseInt(comment_origin));
		comm.setStudy_comment_level(Integer.parseInt(comment_level));
		comm.setStudy_comment_seq(Integer.parseInt(comment_seq));
		
		int result = service.insertRelyComment(comm);
	}
}
