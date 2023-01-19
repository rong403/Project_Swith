package kh.exam.test1.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.*;
import com.cloudinary.utils.ObjectUtils;

@Controller
public class cloudinaryController {
	
	@Autowired
	private Cloudinary cloudinary;
	
	@GetMapping("/cloudinary")
	public String cloudinarysdg() {
		return "/cloudinaryTest";
	}
	@PostMapping("/cloudinary")
	public String sdg() {
		System.out.println("post cloudinary 진입");
		return "redirect:/";
	}
	
	@PostMapping("/cloudinaryd")
	public String cloudinaryd(
//			@RequestParam("file") MultipartFile file,
			MultipartHttpServletRequest files
			) {
		
		// 내 Cloudinary Java 애플리케이션에서 전역적으로 구성 매개변수 설정
//		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
//                "cloud_name", env.getProperty("clould_name"), // 내 cloud name
//                "api_key", env.getProperty("api_key"), // 내 api code
//                "api_secret", env.getProperty("api_secret"), // 내 api secret
//                " secure " , true)); 
//		
//        SingletonManager manager = new SingletonManager();
//        manager.setCloudinary(cloudinary);
//        manager.init();
        
        System.out.println(
            cloudinary.config.cloudName);
        
        
        
        List<MultipartFile> fileList = files.getFiles("file");
        
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
            	cloudinary.uploader().destroy("test/e0eecf34-2e7f-4c17-9f6a-21d78d135361", ObjectUtils.emptyMap()); // 삭제하는 메소드
            	
                Map uploadoption = ObjectUtils.asMap(
                	  "folder", folderpath,
                      "use_filename", true,
                      "unique_filename", false,
                      "overwrite", true
                );
                Map uploadresult = cloudinary.uploader().upload(mf.getBytes(), uploadoption); //파일 업로드
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
		return "redirect:/cloudinary";
	}
	
//	초기 작성 메소드
	@PostMapping("/cloudinaryf")
	public String cloudinaryf(
//			@RequestParam("file") MultipartFile file,
			MultipartHttpServletRequest files
			) {
		
		// Set your Cloudinary credentials
		Cloudinary cloudinary = new Cloudinary("cloudinary://192911268954712:ZvZplcFXxaYRt9_I_GTqd2ZjjWc@dnik5jlzd");
        cloudinary.config.secure = true;
        System.out.println(
            cloudinary.config.cloudName);
        
        List<MultipartFile> fileList = files.getFiles("file");
        System.out.println(fileList.size());
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);
            
            //이름 중복을 방지하기 위한 처리
			UUID uuid = UUID.randomUUID();
			String filename = uuid + originFileName;
			System.out.println(filename); //저장되는 이름 확인
            
            String path = "C:\\image\\";
            String safeFile = path + filename;
            File uploadFile = new File(safeFile);
            try {
                mf.transferTo(uploadFile);
                Map params1 = ObjectUtils.asMap(
                      "use_filename", true,
                      "unique_filename", false,
                      "overwrite", true
                );
                
                
                System.out.println(cloudinary.uploader().upload(uploadFile, params1));
//              cloudinary.api().createFolder("test22", ObjectUtils.emptyMap()); // cloudinary에 폴더 만들기
               	Map result = cloudinary.api().resource(filename.split(".p")[0], ObjectUtils.asMap( " resource_type " , " raw " ));
           		System.out.println(result.get("url"));
           		System.out.println(result.get("public_id"));
           		
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
		return "/cloudinaryTest";
	}
	 
	@PostMapping("/wisupload")
	public ModelAndView wef(MultipartHttpServletRequest files)  {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("eiwinfin여기진입");
		List<MultipartFile> fileList = files.getFiles("upload");
		String uploadPath = null;
		
        
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            String folderpath = "test2/";
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
                System.out.println(uploadresult.get("public_id").toString());
                System.out.println(cloudinary.uploader().rename(uploadresult.get("public_id").toString(), uploadName, ObjectUtils.emptyMap())); // 업로드 된 파일 명칭 수정
               	Map result = cloudinary.api().resource(uploadName, ObjectUtils.asMap( " resource_type " , " raw " )); //파일 정보 가져오기
               	uploadPath = result.get("url").toString();
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
		
		mv.addObject("uploaded", true); // 업로드 완료
		mv.addObject("url", uploadPath); // 업로드 파일의 경로

		return mv;
	}
}
