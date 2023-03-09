package kh.team2.swith.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.StudyComment;

//import kh.team2.swith.board.model.service.BoardWriteService;

@Controller
@SessionAttributes({ "seAdmin", "seStAdmin", "seLoginMember"})
public class BoardController {

//	@Autowired
//	private BoardWriteService service;
	@Autowired
	private StudyService stdService;
	
	@GetMapping("/boardwrite")
	public String aaa() {
		String result = null;
		
		return "/board/boardwrite";
	}
	
	@PostMapping("/boardwrite")
	public ModelAndView wef(MultipartHttpServletRequest files, ModelAndView mv) {
		System.out.println("eiwinfin여기진입");
		
		return mv;
	}
	
	
//	@ResponseBody
//	@RequestMapping(value = "fileupload.do")
//    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
//		JsonObject jsonObject = new JsonObject();
//		PrintWriter printWriter = null;
//		OutputStream out = null;
//		MultipartFile file = multiFile.getFile("upload");
//		
//		if(file != null) {
//			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
//				if(file.getContentType().toLowerCase().startsWith("image/")) {
//				    try{
//				    	 
//			            String fileName = file.getOriginalFilename();
//			            byte[] bytes = file.getBytes();
//			           
//			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/noticeimg");
//			            System.out.println("uploadPath:"+uploadPath);
//
//			            File uploadFile = new File(uploadPath);
//			            if(!uploadFile.exists()) {
//			            	uploadFile.mkdirs();
//			            }
//			            String fileName2 = UUID.randomUUID().toString();
//			            uploadPath = uploadPath + "/" + fileName2 +fileName;
//			            
//			            out = new FileOutputStream(new File(uploadPath));
//			            out.write(bytes);
//			            
//			            printWriter = resp.getWriter();
//			            String fileUrl = req.getContextPath() + "/resources/images/noticeimg/" +fileName2 +fileName; 
//			            System.out.println("fileUrl :" + fileUrl);
//			            JsonObject json = new JsonObject();
//			            json.addProperty("uploaded", 1);
//			            json.addProperty("fileName", fileName);
//			            json.addProperty("url", fileUrl);
//			            printWriter.print(json);
//			            System.out.println(json);
//			 
//			        }catch(IOException e){
//			            e.printStackTrace();
//			        } finally {
//			            if (out != null) {
//		                    out.close();
//		                }
//		                if (printWriter != null) {
//		                    printWriter.close();
//		                }
//			        }
//				}
//		}
//		
//	}
//	}
	
	@PostMapping("/deleteComment")
	@ResponseBody
	public String deleteComment(
			StudyComment comm
			, @RequestParam(name="comment_id") String comment_id
			, @RequestParam(name="study_no") String param_study_no
			, @RequestParam(name="study_comment_no") String param_study_comment_no
			, @ModelAttribute("seAdmin") int admin
			, @ModelAttribute("seStAdmin") int stAdmin
			, @ModelAttribute("seLoginMember") String loginMember
			) {
		String study_comment = "관리자가 삭제한 댓글입니다.";
		int study_no = Integer.parseInt(param_study_no);
		int study_comment_no = Integer.parseInt(param_study_comment_no);
		
		StudyComment stdComm = null;
		//해당 댓글 정보 채워오기
		try {
			stdComm = stdService.selectStudyComment(study_no, comment_id, study_comment_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//댓글 업데이트
		stdComm.setStudy_comment(study_comment);
		int result = 0;
		try {
			result = stdService.updateStudyComment(stdComm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//새 댓글 리스트 가져오기
		List<StudyComment> commentList = null;
		try {
			commentList = stdService.selectListStudyComment(param_study_no);
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
	
	@PostMapping("/updateComment")
	@ResponseBody
	public String updateComment(
			StudyComment comm
			, @RequestParam(name="comment_id") String comment_id
			, @RequestParam(name="comment") String comment
			, @RequestParam(name="study_no") String param_study_no
			, @RequestParam(name="study_comment_no") String param_study_comment_no
			, @ModelAttribute("seAdmin") int admin
			, @ModelAttribute("seStAdmin") int stAdmin
			, @ModelAttribute("seLoginMember") String loginMember
			) {
		int study_no = Integer.parseInt(param_study_no);
		int study_comment_no = Integer.parseInt(param_study_comment_no);
		StudyComment stdComm = null;
		//해당 댓글 정보 채워오기
		try {
			stdComm = stdService.selectStudyComment(study_no, comment_id, study_comment_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//댓글 업데이트
		stdComm.setStudy_comment(comment);
		int result = 0;
		try {
			result = stdService.updateMyStudyComment(stdComm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//새 댓글 리스트 가져오기
		List<StudyComment> commentList = null;
		try {
			commentList = stdService.selectListStudyComment(param_study_no);
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
}