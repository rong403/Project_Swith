package kh.team2.swith.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.team2.swith.api.model.service.CloudinaryService;
import kh.team2.swith.board.model.service.BoardService;
import kh.team2.swith.board.model.vo.Board;
import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.StudyComment;

//import kh.team2.swith.board.model.service.BoardWriteService;

@Controller
@SessionAttributes({ "admin", "stAdmin", "loginMember"})
public class BoardController {

//	@Autowired
//	private BoardWriteService service;
	@Autowired
	private StudyService stdService;
	@Autowired
	private BoardService boradService;
	@Autowired
	private CloudinaryService cloudinaryService;
	
	@GetMapping("/boardwrite")
	public ModelAndView BoardWrite(ModelAndView mv
			, Principal principal
			, String study_no) throws Exception{
		mv.setViewName("board/boardwrite");
		mv.addObject("study_no", study_no);
		return mv;	
	}
	@GetMapping("/boardContent")
	public ModelAndView boardContents(String board_no, Principal principal, ModelAndView mv) {
		Board result = null;
		try {
			result = boradService.selectBoard(board_no);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("@@@@@@@@@@boardNum" + result);
		
		mv.setViewName("board/boardContent");
		mv.addObject("board", result);
		return mv;
	}

//	@PostMapping("/boardwrite")
//	public String insertBoard(BoardWrite vo, Principal principal) throws Exception{
//		String member_id = principal.getName();
//		int result = boradService.insertBoard(vo);
//		return "redirect:/studyBoard";
//	}
	@PostMapping("/studyBoard")
	public ModelAndView studyBoard(Board vo,ModelAndView mv, Principal principal) throws Exception{
		String member_id = principal.getName();
		if(member_id != null) {
			vo.setMember_id(member_id);
		}
		List<Board> boardlist = null;
		int result = boradService.insertBoard(vo);
		boardlist = boradService.selectListBoard2();
		
		mv.setViewName("redirect:/study?study_no="+vo.getStudy_no()+"&page=board");
		return mv;
	}

	

	
	@PostMapping("/deleteComment")
	@ResponseBody
	public String deleteComment(
			StudyComment comm
			, @RequestParam(name="comment_id") String comment_id
			, @RequestParam(name="study_no") String param_study_no
			, @RequestParam(name="study_comment_no") String param_study_comment_no
			, @ModelAttribute("admin") int admin
			, @ModelAttribute("stAdmin") int stAdmin
			, @ModelAttribute("loginMember") String loginMember
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
			, @ModelAttribute("admin") int admin
			, @ModelAttribute("stAdmin") int stAdmin
			, @ModelAttribute("loginMember") String loginMember
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
	@ResponseBody
	@RequestMapping(value = "/fileuploadBoard.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		
		
		System.out.println("eiwinfin여기진입");
		List<MultipartFile> fileList = multiFile.getFiles("upload");
        
        for (MultipartFile mf : fileList) {
            try {
            	Map<String,String> uploadResult = cloudinaryService.upload(mf.getBytes(), "boardImg");
           		printWriter = resp.getWriter();
           		json.addProperty("uploaded", 1);
	            json.addProperty("fileName", mf.getOriginalFilename());
	            json.addProperty("url", uploadResult.get("url"));
	            printWriter.print(json);
           		
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (printWriter != null) {
                    printWriter.close();
                }
			}
        }
	}
}