package kh.team2.swith.common;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

public class WebDriverTemplate {

    public WebDriver driverCreate() {
    	WebDriver webDriver = null;
    	
    	//크롬 브라우저랑 driver 버전 동일, driver 위치는 c드라이브
        System.setProperty("webdriver.chrome.driver", "C:/chromedriver.exe");
      
 
        //webDriver 옵션 설정.
//        ChromeOptions options = new ChromeOptions();
//        options.setHeadless(true); // 크롬 창을 띄우지 않고 진행
//        options.addArguments("--disable-gpu"); //gpu를 사용 안하도록 설정
//        options.addArguments("--lang=ko"); // 한국어로 실행되도록 설정
//        options.addArguments("--no-sandbox");
//        options.addArguments("--disable-dev-shm-usage"); // 공유 메모리를 담당하는 /deb/shm 디렉토리를 사용하지 않음
//        options.addArguments("--disable-popup-blocking"); // 팝업 차단 해제
//        options.setCapability("ignoreProtectedModeSettings", true);
 
        // weDriver 생성.
//        webDriver = new ChromeDriver(options);
        webDriver = new ChromeDriver(); //옵션 미 적용 시 selenium 크롤링용 새창이 서버 실행 시 시작됨.
        webDriver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);
        
        return webDriver;
    }
    
    public void quitDriver(WebDriver driver) {
    	driver.quit(); // webDriver 종료
    }
}
