package kh.team2.swith.api.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
@PropertySource("classpath:api.properties")
public class KakaoMapServiceImpl implements KakaoMapService {
	
	@Autowired
	Environment env;
	
	public Map<String,String> getAddressCoordinate(String roadFullAddr) { //해당 주소의 x,y좌표 값 조회
		
		//api 설정
		String apiKey = env.getProperty("kakaoMap.admin");
	    String apiUrl = "https://dapi.kakao.com/v2/local/search/address.json";
	    
	    //x,y좌표 값을 반환하기 위해 반환값 map으로 처리
	    Map<String,String> result = new HashMap<String, String>();

	    try {
	    	//인코딩 처리
	        roadFullAddr = URLEncoder.encode(roadFullAddr, "UTF-8");

	        //해당 apiURL에 좌표를 검색할 주소값 추가
	        String addr = apiUrl + "?query=" + roadFullAddr;

	        //api를 통해 주소에 따른 정보 가져오기
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
	        
	        //json타입으로 받환받은 정보 에서 해당 주소의 x,y좌표 정보까지 접근하기 위한 처리
	        JsonParser jsonParser = new JsonParser();
	        JsonObject jsonObject = (JsonObject)jsonParser.parse(jsonString);
	        JsonArray jsonArray = (JsonArray)jsonObject.get("documents");
	        JsonObject jsonArrayFirst = (JsonObject)jsonArray.get(0);
	        JsonObject jsonAddress = (JsonObject)jsonArrayFirst.get("address");
	        
	        //x,y좌표 값 반환값에 추가
	        result.put("check", "ok");
	        result.put("x", jsonAddress.get("x").toString().replaceAll("\"", ""));
	        result.put("y", jsonAddress.get("y").toString().replaceAll("\"", ""));

	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    } catch (MalformedURLException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    } catch (IndexOutOfBoundsException e) {
	    	System.out.println("++++++++++++++++++++++=================== json address error : 주소 이상해서 좌표조회 안됨");
	    	result.put("check", "no");
	    } catch (ClassCastException e) {
	    	System.out.println("++++++++++++++++++++++=================== json address error : 주소정보 결과값이 다름");
	    	result.put("check", "no");
	    }
	    return result;
	}
}
