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
import kh.team2.swith.place.model.vo.Place;
import kh.team2.swith.place.room.model.service.RoomServcie;
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
	@Autowired
	private RoomServcie roomService;
	
	
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
		    System.out.println(areaList.size()); // 245개
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
				
				try {
					//리스트 스크롤 내리기
					WebElement serachlistEle = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div:nth-child(2) > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd"));
					serachlistEle.sendKeys(Keys.PAGE_DOWN);
					serachlistEle.sendKeys(Keys.PAGE_DOWN);
					serachlistEle.sendKeys(Keys.PAGE_DOWN);
					//로딩 대기
					Thread.sleep(3000);
				} catch(NoSuchElementException e) {
					continue;
				}
				 
				//각 목록을 클릭 해 상세 정보를 보기 위한 요소 조회
				List<WebElement> listEleList = driver.findElements(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div > div.Nv2PK.THOPZb > a"));
				System.out.println(listEleList.size());
				
				String listNameCheck = ""; //같은 장소 중복 저장 방지
				for(int j = 1; j < listEleList.size(); j++) { //광고가 있을경우를 배제하기 위해 1부터 시작
					//스터디카페 정보 담을 vo 생성
					Place placeInfo = new Place();
					
					//상세 정보를 보기위해 클릭
					listEleList.get(j).sendKeys(Keys.ENTER);
					//상세 정보 로딩 대기
					Thread.sleep(2000);
					
					//장소 명
					WebElement listName = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div.TIHn2 > div.tAiQdd > div.lMbq3e > div:nth-child(1) > h1 > span:nth-child(2)"));
					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium listName : " + listName.getText());
					if(listNameCheck.equals(listName.getText()) ||  !listName.getText().contains("스터디")) {
						continue;
					}
					placeInfo.setP_name(listName.getText());
					listNameCheck = listName.getText();
					
					//장소 주소
					WebElement listAddress = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div > div:nth-child(3) > button > div.AeaXub > div.rogA2c > div.Io6YTe.fontBodyMedium"));
					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium listAddress : " + listAddress.getText());
					placeInfo.setP_address(listAddress.getText());
					//주소로 좌표 가져오기
					Map<String, String> addressResult = kakaoMapService.getAddressCoordinate(listAddress.getText());
					if(addressResult == null) {
						continue; //좌표정보가 제대로 조회가 안될경우 제외시키기
					} else { 
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium address x : " + addressResult.get("x"));
						placeInfo.setP_x(Double.parseDouble(addressResult.get("x")));
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium address y : " + addressResult.get("y"));
						placeInfo.setP_y(Double.parseDouble(addressResult.get("y")));
					}
					
					
					String ImgUrl = null;
					try {
						//상세 정보 창의 img 요소 가져오기
						WebElement listImg = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div.ZKCDEc > div.RZ66Rb.FgCUCc > button > img"));
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium src : " + listImg.getAttribute("src"));
						ImgUrl = listImg.getAttribute("src");
						
						//파일서버 업로드
						Map<String,String> uploadResultMap = cloudinaryService.upload(ImgUrl, "placeImg/");
						
						//장소 이미지 정보 저장
						placeInfo.setP_img_origin(placeInfo.getP_name()+".jpg");
						placeInfo.setP_img_save(uploadResultMap.get("publicId")); 
						placeInfo.setP_img_route(uploadResultMap.get("url")); 
						
					} catch(NoSuchElementException e) {
						//대표 이미지가 없어서 요소가 안찾아질 경우 대체 이미지 사용
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium src error : 해당 장소 대표이미지 없음 다른 이미지 대체");
						placeInfo.setP_img_origin(placeInfo.getP_name()+".jpg");
						
						int imgRanNum = (int)(Math.random()*3) + 1; //1~3랜덤
						switch(imgRanNum) { 
							case 1 : 
								placeInfo.setP_img_save("placeImg/52612_45402_4358_inzkcs"); 
								placeInfo.setP_img_route("https://res.cloudinary.com/dnik5jlzd/image/upload/v1676527774/placeImg/52612_45402_4358_inzkcs.jpg"); 
								break;
							case 2 : 
								placeInfo.setP_img_save("placeImg/230447_85380_338_aqsgxb"); 
								placeInfo.setP_img_route("https://res.cloudinary.com/dnik5jlzd/image/upload/v1676527769/placeImg/230447_85380_338_aqsgxb.png"); 
								break;
							case 3 :
							default : 
								placeInfo.setP_img_save("placeImg/166748_321915_401622_vkh9wg"); 
								placeInfo.setP_img_route("https://res.cloudinary.com/dnik5jlzd/image/upload/v1676527764/placeImg/166748_321915_401622_vkh9wg.jpg"); 
								break;
						}	
					}
					
					//랜덤 전화 번호 생성
					int authNo1 = (int)(Math.random() * (9999 - 1000 + 1)) + 1000;
					int authNo2 = (int)(Math.random() * (9999 - 1000 + 1)) + 1000;
					String authPhone = "010-"+authNo1+"-"+authNo2;
					try {
						WebElement listPhone = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.Hu9e2e.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf > div > div:nth-child(6) > button > div.AeaXub > div.rogA2c > div.Io6YTe.fontBodyMedium"));
						//전화 번호가 아닌 요소가 선택될경우 랜덤 전화번호 값 대입
						if(listPhone.getText().charAt(0) != '0') {
							System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium Phone : " + "010-1234-5678");
							placeInfo.setP_phone(authPhone);
						} else {
							System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium Phone : " + listPhone.getText());
							placeInfo.setP_phone(listPhone.getText());
						}
					} catch(NoSuchElementException e) {
						//Element 발견 못할경우 랜덤 전화번호 값 대입
						System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium Phone : " + "010-4321-8765");
						placeInfo.setP_phone(authPhone);
					}
					
					//장소 소개 
					placeInfo.setP_info(areaStr + "에 위치한 " + listName.getText() + "입니다.");
					//지역 코드
					placeInfo.setArea_code(areaList.get(i).getArea_code());
					
					
					
					//DB저장
					int placeinfoReult = placeService.insertPlace(placeInfo);
					
					if(placeinfoReult == 0) { //저장 실패 시 파일서버에 업로드한 파일 제거
						String result = cloudinaryService.delete(placeInfo.getP_img_save());
						System.out.println("++++++++++++++++++++++=================== cloudinary delete result : " + result);
					} else { // 성공 시 스터디 룸 정보 저장
						for(int k = 0; k < 5; k++) {
							//파일서버 업로드
							String roomName = null;
							int roomPeople = 0;
							int roomPrice = 0;
							int startTime = 0;
							int endTime = 0;
							String roomImgUrl = null;
							String saveName = null;
							
							if(k == 0) { //2인
								roomImgUrl = "https://res.cloudinary.com/dnik5jlzd/image/upload/v1676269460/room/images_mjlmae.jpg";
								saveName = "room/images_mjlmae";
								roomName = "2인 스터디룸A";
								roomPeople = 2;
								roomPrice= 3000;
							} else if(k == 1) { //4인
								roomImgUrl = "https://res.cloudinary.com/dnik5jlzd/image/upload/v1676269445/room/images_sjalw0.jpg"; 
								saveName = "room/images_mjlmae";
								roomName = "4인 스터디룸A";
								roomPeople = 4;
								roomPrice= 5000;
							} else if(k == 2) { //4인
								roomImgUrl = "https://res.cloudinary.com/dnik5jlzd/image/upload/v1676269305/room/mosaK4vAt8_yjbogp.jpg"; 
								saveName = "room/mosaK4vAt8_yjbogp";
								roomName = "4인 스터디룸B";
								roomPeople = 4;
								roomPrice= 5000;
							} else { //6인
								int ranNum = (int)(Math.random()*3) + 1; //1~3랜덤
								switch(ranNum) { 
								case 1 : roomImgUrl = "https://res.cloudinary.com/dnik5jlzd/image/upload/v1676269510/room/images_ewoqsr.jpg"; saveName = "room/images_ewoqsr"; break;
								case 2 : roomImgUrl = "https://res.cloudinary.com/dnik5jlzd/image/upload/v1676269416/room/images_qv6o1n.jpg"; saveName = "room/images_qv6o1n"; break;
								case 3 : 
								default : roomImgUrl = "https://res.cloudinary.com/dnik5jlzd/image/upload/v1676269379/room/images_of2jcz.jpg"; saveName = "room/images_of2jcz"; break;
								}
								roomPeople = 6;
								roomPrice= 8000;
								if(k == 3) {
									roomName = "6인 스터디룸A";
								} else {
									roomName = "6인 스터디룸B";
								}
							}
							int ranNum2 = (int)(Math.random()*3) + 1; //1~3랜덤
							switch(ranNum2) { 
							case 1 : startTime = 9; endTime = 22; break;
							case 2 : startTime = 8; endTime = 21; break;
							case 3 : 
							default : startTime = 8; endTime = 22; break;
							}
							
							//방금 insert한 마지막 place의 p_no 가져오기
							int p_no = placeService.selectLastNo();
							
							StudyRoom studyRoom = new StudyRoom();
							
							studyRoom.setRoom_name(roomName);
							studyRoom.setP_no(p_no);
							studyRoom.setRoom_people(roomPeople);
							studyRoom.setRoom_price(roomPrice);
							studyRoom.setRoom_start_time(startTime);
							studyRoom.setRoom_end_time(endTime);
							studyRoom.setRoom_img_origin(roomName+".jpg");
							studyRoom.setRoom_img_route(roomImgUrl);
							studyRoom.setRoom_img_save(saveName);
							
							roomService.insertRoom(studyRoom);
						}
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
