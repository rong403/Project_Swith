package kh.team2.swith.api.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Service
public class CloudinaryServiceImpl implements CloudinaryService {

	@Autowired
	private Cloudinary cloudinary;

	@Override
	public Map<String, String> upload(byte[] fileBytes, String folderPath) throws IOException { //이미지 파일의 byte정보로 업로드 메소드
		//업로드 후 저장된 아이디(경로/파일명)와 URL 정보를 반환하기 위해 Map으로 반환값 처리
		Map<String, String> result = new HashMap<String, String>();
		
		//이름 중복을 방지하기 위한 처리
		UUID uuid = UUID.randomUUID();
		String uploadName = folderPath+"/"+uuid;
		System.out.println(uploadName); //수정할 이름 확인
		
		Map uploadoption = ObjectUtils.asMap( // 업로드 설정
      	  	"folder", folderPath,
            "use_filename", true,
            "unique_filename", false,
            "overwrite", true
        );
		//파일 업로드
		Map uploadResult = cloudinary.uploader().upload(fileBytes, uploadoption); 
		// 업로드 된 파일을 중복 방지처리한 명칭으로 수정
		Map renameResult = cloudinary.uploader().rename(uploadResult.get("public_id").toString(), uploadName, ObjectUtils.emptyMap()); 
		
		//중복 방지처리한 파일의 url과 publicId 값 반환 값에 추가
		result.put("url", renameResult.get("url").toString());
		result.put("publicId", renameResult.get("public_id").toString());
		
		return result;
	}
	
	@Override
	public Map<String, String> upload(String url, String folderPath) throws IOException { //이미지 파일의 url정보로 업로드 메소드 - 크롤링 용
		//업로드 후 저장된 아이디(경로/파일명)와 URL 정보를 반환하기 위해 Map으로 반환값 처리
		Map<String, String> result = new HashMap<String, String>();
		
		//이름 중복을 방지하기 위한 처리
		UUID uuid = UUID.randomUUID();
		String uploadName = folderPath+"/"+uuid;
		System.out.println(uploadName); //수정할 이름 확인
		
		Map uploadoption = ObjectUtils.asMap( // 업로드 설정
      	  	"folder", folderPath,
            "use_filename", true,
            "unique_filename", false,
            "overwrite", true
        );
		//파일 업로드
		Map uploadResult = cloudinary.uploader().upload(url, uploadoption); 
		// 업로드 된 파일을 중복 방지처리한 명칭으로 수정
		Map renameResult = cloudinary.uploader().rename(uploadResult.get("public_id").toString(), uploadName, ObjectUtils.emptyMap()); 
		
		//중복 방지처리한 파일의 url과 publicId 값 반환 값에 추가
		result.put("url", renameResult.get("url").toString());
		result.put("publicId", renameResult.get("public_id").toString());
		
		return result;
	}

	@Override
	public String delete(String publicId) throws IOException {
		String result = null;
		//공용 이미지 삭제 시도 막기
		switch(publicId) {
		case "placeImg/230447_85380_338_aqsgxb": 
		case "placeImg/166748_321915_401622_vkh9wg": 
		case "placeImg/52612_45402_4358_inzkcs": 
		case "room/images_ewoqsr_wcb78y": 
		case "room/images_mjlmae_uiwzri": 
		case "room/images_sjalw0":
		case "room/images_of2jcz_h9d1t0": 
		case "room/mosaK4vAt8_yjbogp_vniiis": result = "공용 이미지로 삭제 실패"; break;
		default : 
			//전달 받은 publicId 값을 통해서 파일서버의 해당 파일 삭제 
			Map destroyResult = cloudinary.uploader().destroy(publicId, ObjectUtils.emptyMap()); 
			result = destroyResult.get("result").toString();
			break;
		}
		
		return result;
	}

}
