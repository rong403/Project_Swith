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

	@Autowired
	Environment env;
	
	@Bean("cloudinary")
	public Cloudinary Cloudinarysetting() {
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", env.getProperty("clould.name"), // 내 cloud name
                "api_key", env.getProperty("clould.key"), // 내 api code
                "api_secret", env.getProperty("clould.secret"), // 내 api secret
                " secure " , true)); 
		
        SingletonManager manager = new SingletonManager();
        manager.setCloudinary(cloudinary);
        manager.init();
		return cloudinary;
	}
}
