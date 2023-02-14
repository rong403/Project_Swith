package kh.team2.swith.test.selenium.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.api.model.service.CloudinaryService;
import kh.team2.swith.common.WebDriverTemplate;

@Service
public class SeleniumTestService {
	
	@Autowired
	private CloudinaryService service;
	
	public void googleMapCrawling(WebDriver driver, String area) {
		driver.get("https://www.google.co.kr/maps/?hl=ko") ;
		driver.manage().timeouts().implicitlyWait(500, TimeUnit.MILLISECONDS);  // 페이지 불러오는 여유시간.
		System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium : " + driver.getTitle());
		
		try {
			//검색 키워드 입력
			WebElement serachInput = driver.findElement(By.cssSelector("#searchboxinput"));
			serachInput.sendKeys("서울 강동구 스터디 카페");
			
			//검색
			WebElement serachButton = driver.findElement(By.cssSelector("#searchbox-searchbutton"));
			serachButton.sendKeys(Keys.ENTER);
			//로딩 대기
			Thread.sleep(2000);
			
			//리스트 스크롤 내리기
			WebElement serachlistEle = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div:nth-child(2) > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd"));
			serachlistEle.sendKeys(Keys.PAGE_DOWN);
			serachlistEle.sendKeys(Keys.PAGE_DOWN);
			//로딩 대기
			Thread.sleep(3000);
			 
			//각 목록을 클릭 해 상세 정보를 보기 위한 요소 조회
			List<WebElement> listEleList = driver.findElements(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div > div.Nv2PK.THOPZb > a"));
			System.out.println(listEleList.size());
			for(int i = 0; i < listEleList.size(); i++) {
				//상세 정보를 보기위해 클릭
				listEleList.get(i).sendKeys(Keys.ENTER);
				//상세 정보 로딩 대기
				Thread.sleep(2000);
				
				//상세 정보 창의 img 요소 가져오기
				WebElement listImg = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div.ZKCDEc > div.RZ66Rb.FgCUCc > button > img"));
				System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium src : " + listImg.getAttribute("src"));
				
				//파일 서버에 해당 이미지 업로드
//				Map<String, String> resultMap = service.upload(listImg.getAttribute("src"), "testUrl/");
//				System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium upload result : " + resultMap.toString());
				
				//장소 명
				WebElement listName = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div.TIHn2 > div.tAiQdd > div.lMbq3e > div:nth-child(1) > h1 > span:nth-child(2)"));
				System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium name : " + listName.getText());
				
				//장소 주소
				WebElement listAddress = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div > div:nth-child(3) > button > div.AeaXub > div.rogA2c > div.Io6YTe.fontBodyMedium"));
				System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium address : " + listAddress.getText());
//				Map<String, String> addressResult = getkakaoAddress(listAddress.getText());
//				if(addressResult != null) {
//					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium address x : " + addressResult.get("xCoordinate"));
//					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium address y : " + addressResult.get("yCoordinate"));
//				}
				
				try {
					//장소 전화번호
					WebElement listPhone = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div > div:nth-child(6) > button > div.AeaXub > div.rogA2c > div.Io6YTe.fontBodyMedium"));
					//전화 번호가 아닌 요소가 선택될경우 임시 전화번호 값 대입
					if(listPhone.getText().charAt(0) != '0') {
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium Phone : " + "010-1234-5678");
					} else {
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium Phone : " + listPhone.getText());
					}
				} catch(NoSuchElementException e) {
					//Element 발견 못할경우 임시 값 대입
					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium Phone : " + "010-4321-8765");
				}
				
				
			}
		} catch(InterruptedException e) {
			e.printStackTrace();
		}
	}
}
