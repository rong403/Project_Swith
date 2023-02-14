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
		String apiKey = env.getProperty("kakaoMap.admin");
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
	    } catch (ClassCastException e) {
	    	System.out.println("++++++++++++++++++++++=================== json address error : 주소정보 결과값이 다름");
	    }
	    return result;
	}
}
