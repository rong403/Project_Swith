package kh.team2.swith.common;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WebDriverConfig {

	@Bean("driver")
    public WebDriver driver() {
    	WebDriver webDriver = null;
    	
    	//크롬 브라우저랑 driver 버전 동일, driver 위치는 c드라이브
        System.setProperty("webdriver.chrome.driver", "C:/chromedriver.exe");
      
 
        //webDriver 옵션 설정.
        ChromeOptions options = new ChromeOptions();
        options.setHeadless(true);
        options.addArguments("--lang=ko");
        options.addArguments("--no-sandbox");
        options.addArguments("--disable-dev-shm-usage");
        options.addArguments("--disable-popup-blocking"); // 팝업 무시
        options.addArguments("--disable-gpu");
        options.setCapability("ignoreProtectedModeSettings", true);
 
        // weDriver 생성.
        webDriver = new ChromeDriver(options);
//        webDriver = new ChromeDriver(); //옵션 미 적용 시 selenium 크롤링용 새창이 서버 실행 시 시작됨.
        webDriver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);
        
        return webDriver;
    }
}
