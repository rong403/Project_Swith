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

@Controller
public class CloudinaryTestController {

	@Autowired
	private Cloudinary cloudinary;
	
	@PostMapping("/cloudinaryTest")
	public String cloudinaryTest(
			MultipartHttpServletRequest files
			) {
        
        List<MultipartFile> fileList = files.getFiles("file"); // 전달받은 파일 정보들 가져오기
        System.out.println(fileList.size()); 
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            
            String folderpath = "test/";
            String FileName = folderpath + mf.getName();
            
            //이름 중복을 방지하기 위한 처리
			UUID uuid = UUID.randomUUID();
			String uploadName = folderpath+uuid;
			System.out.println(uploadName); //수정할 이름 확인
			
            try {
                Map uploadoption = ObjectUtils.asMap(
                	  "folder", folderpath,
                      "use_filename", true,
                      "unique_filename", false,
                      "overwrite", true
                );
                Map uploadresult = cloudinary.uploader().upload(mf.getBytes(), uploadoption); //파일 업로드
//              cloudinary.api().createFolder("test22", ObjectUtils.emptyMap()); // cloudinary에 폴더 만들기
                System.out.println(uploadresult.get("public_id").toString());
                System.out.println(cloudinary.uploader().rename(uploadresult.get("public_id").toString(), uploadName, ObjectUtils.emptyMap())); // 업로드 된 파일 명칭 수정
               	Map result = cloudinary.api().resource(uploadName, ObjectUtils.asMap( " resource_type " , " raw " )); //파일 정보 가져오기
           		System.out.println(result.get("url")); //파일의 url값
           		System.out.println(result.get("public_id")); //저장된 파일의 명칭
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		return "redirect:/";
	}
}
