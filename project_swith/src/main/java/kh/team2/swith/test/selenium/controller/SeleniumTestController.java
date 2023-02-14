package kh.team2.swith.test.selenium.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.team2.swith.api.model.service.CloudinaryService;
import kh.team2.swith.api.model.service.KakaoMapService;
import kh.team2.swith.area.model.service.AreaService;
import kh.team2.swith.area.model.vo.Area;
import kh.team2.swith.common.WebDriverTemplate;
import kh.team2.swith.place.model.service.PlaceService;
import kh.team2.swith.place.model.vo.PlaceImg;
import kh.team2.swith.place.model.vo.PlaceInfo;
import kh.team2.swith.place.room.model.vo.RoomImg;
import kh.team2.swith.place.room.model.vo.StudyRoom;
import kh.team2.swith.test.selenium.model.service.SeleniumTestService;

@Controller
public class SeleniumTestController {

	@Autowired
	private SeleniumTestService SeleniumService;
	@Autowired
	private KakaoMapService kakaoMapService;
	@Autowired
	private CloudinaryService cloudinaryService;
	
	@Autowired
	private AreaService areaService;
	@Autowired
	private PlaceService placeService;
	
	
	@GetMapping("/seleniumTest")
	public String dsfsdf(@RequestParam("pwd") String pwd) {
		if(!pwd.equals("ghals317")) { //비밀번호 확인
			return "redirect:/main";
		}
		//드라이버 템플릿 생성
	    WebDriverTemplate webDriverTemp= new WebDriverTemplate();
	    //크롬 드라이버 생성
		WebDriver driver = webDriverTemp.driverCreate(); //드라이버 생성
		
		try {
			//지역 정보 가져오기
		    List<Area> areaList = areaService.selectList();
		    System.out.println(areaList.size());
		    //지역 명칭별으로 크롤링
		    for(int i = 0; i < areaList.size(); i++) {
		    	//페이지 이동
		    	driver.get("https://www.google.co.kr/maps/?hl=ko") ;
				driver.manage().timeouts().implicitlyWait(500, TimeUnit.MILLISECONDS);  // 페이지 불러오는 여유시간.
				
				//검색 키워드 입력
				WebElement serachInput = driver.findElement(By.cssSelector("#searchboxinput"));
				String areaStr = areaList.get(i).getSido_name()+" "+areaList.get(i).getSigungu_name();
				serachInput.sendKeys(areaStr+" 스터디카페");
				//검색
				WebElement serachButton = driver.findElement(By.cssSelector("#searchbox-searchbutton"));
				serachButton.sendKeys(Keys.ENTER);
				//로딩 대기
				Thread.sleep(3000);
				
				//리스트 스크롤 내리기
				WebElement serachlistEle = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div:nth-child(2) > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd"));
				serachlistEle.sendKeys(Keys.PAGE_DOWN);
				serachlistEle.sendKeys(Keys.PAGE_DOWN);
				//로딩 대기
				Thread.sleep(3000);
				 
				//각 목록을 클릭 해 상세 정보를 보기 위한 요소 조회
				List<WebElement> listEleList = driver.findElements(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div > div.Nv2PK.THOPZb > a"));
				System.out.println(listEleList.size());
				
				String listNameCheck = ""; //같은 장소 중복 저장 방지
				for(int j = 1; j < listEleList.size(); j++) { //광고가 있을경우를 배제하기 위해 1부터 시작
					//스터디카페 정보 담을 vo 생성
					PlaceInfo placeInfo = new PlaceInfo();
					
					//상세 정보를 보기위해 클릭
					listEleList.get(j).sendKeys(Keys.ENTER);
					//상세 정보 로딩 대기
					Thread.sleep(2000);
					
					//상세 정보 창의 img 요소 가져오기
					WebElement listImg = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div.ZKCDEc > div.RZ66Rb.FgCUCc > button > img"));
					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium src : " + listImg.getAttribute("src"));
					
					//파일 서버에 해당 이미지 업로드
	//						Map<String, String> resultMap = service.upload(listImg.getAttribute("src"), "testUrl/");
	//						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium upload result : " + resultMap.toString());
					
					//장소 명
					WebElement listName = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div.TIHn2 > div.tAiQdd > div.lMbq3e > div:nth-child(1) > h1 > span:nth-child(2)"));
					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium listName : " + listName.getText());
					if(listNameCheck.equals(listName.getText())) {
						continue;
					} else {
						listNameCheck = listName.getText();
					}
					placeInfo.setP_name(listName.getText());
					//장소 주소
					WebElement listAddress = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div > div:nth-child(3) > button > div.AeaXub > div.rogA2c > div.Io6YTe.fontBodyMedium"));
					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium listAddress : " + listAddress.getText());
					placeInfo.setP_address(listAddress.getText());
					
					//장소 전화번호
					try {
						WebElement listPhone = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div > div:nth-child(6) > button > div.AeaXub > div.rogA2c > div.Io6YTe.fontBodyMedium"));
						//전화 번호가 아닌 요소가 선택될경우 임시 전화번호 값 대입
						if(listPhone.getText().charAt(0) != '0') {
							System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium Phone : " + "010-1234-5678");
							placeInfo.setP_phone("010-1234-5678");
						} else {
							System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium Phone : " + listPhone.getText());
							placeInfo.setP_phone(listPhone.getText());
						}
					} catch(NoSuchElementException e) {
						//Element 발견 못할경우 임시 값 대입
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium Phone : " + "010-4321-8765");
						placeInfo.setP_phone("010-4321-8765");
					}
					
					//장소 소개 
					placeInfo.setP_info(areaStr + "에 위치한 " + listName.getText() + "입니다.");
					//지역 코드
					placeInfo.setArea_code(areaList.get(i).getArea_code());
					
					//주소로 좌표 가져오기
					Map<String, String> addressResult = kakaoMapService.getAddressCoordinate(listAddress.getText());
					
					if(addressResult != null) {
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium address x : " + addressResult.get("x"));
						placeInfo.setP_x(Double.parseDouble(addressResult.get("x")));
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium address y : " + addressResult.get("y"));
						placeInfo.setP_y(Double.parseDouble(addressResult.get("y")));
						
						placeService.insertPlace(placeInfo);
					} else {
						continue;
					}
				}
		    }
		} catch(NumberFormatException e) {
			e.printStackTrace();
		} catch(InterruptedException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
		    //크롬드라이버 닫기
		    webDriverTemp.quitDriver(driver);
		}
		return "redirect:/main";
	}
}
