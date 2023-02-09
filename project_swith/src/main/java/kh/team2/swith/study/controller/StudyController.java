package kh.team2.swith.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import kh.team2.swith.study.model.service.StudyService;
import kh.team2.swith.study.model.vo.Study;

@Controller
@RequestMapping("/stdEnroll")
public class StudyController {
	
	@Autowired
	private StudyService service;
	
	@GetMapping
	public ModelAndView study(ModelAndView mv
			) throws Exception{
//		service.insertStudy(); mapper sql 미작성 TODO
		//mv.addObject("TODO", service.insertStudy());
		mv.setViewName("/mainsection");
		return mv;
	}
	
	
	@PostMapping("/stdEnroll")
	public String insertStudy(Study vo
			, @RequestParam(name="name", required = false) String study_name //모임명
			, @RequestParam(name="category",required = false) String study_category//카테고리
			, @RequestParam(name="description",required = false) String study_info//간단소개
			, @RequestParam(name="info",required = false) String study_placeInfo//모임정보
			, @RequestParam(name="sido",required = false) String study_sido// 시/도
			, @RequestParam(name="sigungu",required = false) String study_sigungu// 시/군/구 
			, @RequestParam(name="uploadFile",required = false) String study_image// 대표사진
			, @RequestParam(name="tags",required = false) String study_tag// 태그
			, HttpServletRequest request
			)  throws Exception {
		
		int result = service.insertStudy(vo);
		return "redirect:/mainsection";
	}
	
	@ResponseBody
	@RequestMapping(value = "fileupload.do")
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
}
