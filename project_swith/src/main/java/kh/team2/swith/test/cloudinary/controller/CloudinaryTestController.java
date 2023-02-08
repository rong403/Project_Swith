package kh.team2.swith.test.cloudinary.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import kh.team2.swith.cloudinary.service.CloudinaryService;

@Controller
public class CloudinaryTestController {

	@Autowired
	private CloudinaryService cloudinaryService;
	
	@PostMapping("/cloudinaryTest")
	public String cloudinaryTest(
			MultipartHttpServletRequest files
			) throws Exception {
        
		
        List<MultipartFile> fileList = files.getFiles("file"); // 전달받은 파일 정보들 가져오기
        System.out.println(fileList.size()); 
        for (MultipartFile mf : fileList) {
        	Map<String,String> result = cloudinaryService.upload(mf.getBytes(), "test/");
        	System.out.println("#@@@@@@@@@@?////@@@@@ - "+result.toString());
        }
		return "redirect:/index_temp";
	}
}
