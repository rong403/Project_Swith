package kh.team2.swith.crawling;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.team2.swith.cloudinary.service.CloudinaryServiceImpl;

public class Crawling {
	public static void main(String[] args) {
		WebDriver driver = null;
    	
    	//크롬 브라우저랑 driver 버전 동일, driver 위치는 c드라이브
        System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
 
        //webDriver 옵션 설정.
        ChromeOptions options = new ChromeOptions();
//        options.setHeadless(true); // 크롬 창을 띄우지 않고 진행
//        options.addArguments("--disable-gpu"); //gpu를 사용 안하도록 설정
//        options.addArguments("--lang=ko"); // 한국어로 실행되도록 설정
//        options.addArguments("--no-sandbox");
//        options.addArguments("--disable-dev-shm-usage"); // 공유 메모리를 담당하는 /deb/shm 디렉토리를 사용하지 않음
//        options.addArguments("--disable-popup-blocking"); // 팝업 차단 해제
//        options.setCapability("ignoreProtectedModeSettings", true);
 
        // weDriver 생성.
        driver = new ChromeDriver(options);
        driver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);
        
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
			Thread.sleep(1500);
			
			//리스트 스크롤 내리기
			WebElement serachlistEle = driver.findElement(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div:nth-child(2) > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd"));
			serachlistEle.sendKeys(Keys.PAGE_DOWN);
			//로딩 대기
			Thread.sleep(1500);
			 
			//각 목록을 클릭 해 상세 정보를 보기 위한 요소 조회
			List<WebElement> listEleList = driver.findElements(By.cssSelector("#QA0Szd > div > div > div.w6VYqd > div.bJzME.tTVLSc > div > div.e07Vkf.kA9KIf > div > div > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div.m6QErb.DxyBCb.kA9KIf.dS8AEf.ecceSd > div > div.Nv2PK.THOPZb > a"));
			System.out.println(listEleList.size());
			for(int i = 0; i < listEleList.size(); i++) {
				//상세 정보를 보기위해 클릭
				listEleList.get(i).sendKeys(Keys.ENTER);
				//상세 정보 로딩 대기
				Thread.sleep(1500);
				
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
				Map<String, String> addressResult = getkakaoAddress(listAddress.getText());
				if(addressResult != null) {
					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium address x : " + addressResult.get("xCoordinate"));
					System.out.println("++++++++++++++++++++++===================+++++++++++++ selenium address y : " + addressResult.get("yCoordinate"));
				}
			}
		} catch(InterruptedException e) {
			e.printStackTrace();
		} 
//		catch(IOException e) {
//			e.printStackTrace();
//		}
		
	}
	
	public static Map<String,String> getkakaoAddress(String roadFullAddr) {
		String apiKey = "apikey입력";
	    String apiUrl = "https://dapi.kakao.com/v2/local/search/address.json";
	    Map<String,String> result = null;

	    try {
	        roadFullAddr = URLEncoder.encode(roadFullAddr, "UTF-8");

	        String addr = apiUrl + "?query=" + roadFullAddr;

	        URL url = new URL(addr);
	        URLConnection conn = url.openConnection();
	        conn.setRequestProperty("Authorization", "KakaoAK " + apiKey);

	        BufferedReader rd = null;
	        rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        StringBuffer docJson = new StringBuffer();

	        String line;

	        while ((line=rd.readLine()) != null) {
	            docJson.append(line);
	        }

	        String jsonString = docJson.toString();
	        rd.close();
	        
	        JsonParser jsonParser = new JsonParser();
	        JsonObject jsonObject = (JsonObject)jsonParser.parse(jsonString);
//	        System.out.println("++++++++++++++++++++++===================+++++++++++++ json jsonObject : "+ jsonObject.toString());
	        JsonArray jsonArray = (JsonArray)jsonObject.get("documents");
//	        System.out.println("++++++++++++++++++++++===================+++++++++++++ json jsonArray : "+ jsonArray.toString());
	        JsonObject jsonArrayFirst = (JsonObject)jsonArray.get(0);
//	        System.out.println("++++++++++++++++++++++===================+++++++++++++ json jsonAddress : "+ jsonArrayFirst.toString());
	        JsonObject jsonAddress = (JsonObject)jsonArrayFirst.get("address");
	        result = new HashMap<String, String>();
	        result.put("xCoordinate", jsonAddress.get("x").toString());
	        result.put("yCoordinate", jsonAddress.get("y").toString());
//	        result = (JsonObject)jsonArrayFirst.get("address");
//	        String xPath = result.get("x").toString();
//	        System.out.println("++++++++++++++++++++++===================+++++++++++++ json xPath : "+ xPath);
	        
	        

	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    } catch (MalformedURLException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    } catch (IndexOutOfBoundsException e) {
	    	e.printStackTrace();
	    }
	    return result;
	}
}
