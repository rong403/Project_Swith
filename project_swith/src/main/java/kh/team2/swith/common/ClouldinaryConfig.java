package kh.team2.swith.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.cloudinary.Cloudinary;
import com.cloudinary.SingletonManager;
import com.cloudinary.utils.ObjectUtils;

@Configuration
@PropertySource("classpath:api.properties")
public class ClouldinaryConfig {

	//properties 파일의 값을 가져오기 위해 Environment 객체 가져오기
	@Autowired
	Environment env;
	
	@Bean("cloudinary") //SpringFramework에 Bean으로 생성하기
	public Cloudinary Cloudinarysetting() {
		//Properties내의 설정해놓은 값을 통해서 내  Cloudinary 서버로 설정한 객체를 생성
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", env.getProperty("clould.name"), // 내 cloud name
                "api_key", env.getProperty("clould.key"), // 내 api code
                "api_secret", env.getProperty("clould.secret"), // 내 api secret
                " secure " , true)); 
		
		//싱글톤으로 설정
        SingletonManager manager = new SingletonManager();
        manager.setCloudinary(cloudinary);
        manager.init();
        
        //생성한 Cloudinary 객체를 반환
		return cloudinary;
	}
}
