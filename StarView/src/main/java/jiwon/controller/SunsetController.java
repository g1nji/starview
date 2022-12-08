package jiwon.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jiwon.dto.Sunset;
import jiwon.service.face.SunsetService;

@Controller
public class SunsetController {
	
	//로그
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private SunsetService sunsetService;
	
	@RequestMapping("/sunset/time")
	public void sunsettime() {
		logger.info("/sunset/time - [GET]");
	}

	
	
	
	
	
	
	
	
	//controller에서 api 가져오는 방법
	@RequestMapping(value="/sunset/test", method=RequestMethod.GET)
	public void sunsetview(@RequestParam String loc) throws IOException {
		
		logger.info("/sunset/test - [GET]");
		
		// 현재 날짜를 원하는 문자열 포맷으로 변환
		Date date = Calendar.getInstance().getTime();  
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");  
		String strDate = dateFormat.format(date); 
		
		//서비스키
		String serviceKey = "uej3x%2FSsIAytAndt4BMIKuPLeCRuvBJL1aMC%2BiIe3gzxsas6kdk0hv7SLipcQPprTnEOdxDKToBjNSPqXw2nrQ%3D%3D";
		
		//API URL
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getAreaRiseSetInfo");
		//서비스키 추가하기
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
		
		// 날짜 (yyyyMMdd)
		urlBuilder.append("&" + URLEncoder.encode("locdate", "UTF-8") + "=" + URLEncoder.encode(strDate, "UTF-8"));
		// 조회 위치
		urlBuilder.append("&" + URLEncoder.encode("location", "UTF-8") + "=" + URLEncoder.encode(loc, "UTF-8"));
		

		logger.info(urlBuilder.toString());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		//POST방식으로 전송해서 파라미터 받아오기
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		logger.info("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		 
		//getResponseCode가 200이상 300이하일때 실행
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		 
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
		    sb.append(line);
		}
		rd.close();
		conn.disconnect();
		//URL = null;
		
		//StringBuilder로 위에 파라미터 더한 값을 toString으로 불러오기
		//log객체 이용해서 XML 형식 출력하기
		logger.info(sb.toString());
		
		// XML을 JSON으로 변환
		JSONObject xmlObject = XML.toJSONObject(sb.toString());
		String xmlJsonString = xmlObject.toString();
		
		ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> resultMap = new HashMap<>();
        
        //typereference이용해서 map객체로 변환
        resultMap = objectMapper.readValue(xmlJsonString, new TypeReference<Map<String, Object>>(){});
        Map<String, Object> dataResponse = (Map<String, Object>) resultMap.get("response");
        Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
        LinkedHashMap<String, Object> items  = (LinkedHashMap<String, Object>) body.get("items");
        Map<String, Object> item = (Map<String, Object>) items.get("item");
        
        logger.info(" item : {} ", item);
        
        Sunset sunset = new Sunset();
        sunset.setSunsetNum(Integer.parseInt(item.get("sunset").toString()));
        sunset.setLatitudeNum(Double.parseDouble(item.get("latitudeNum").toString()));
        sunset.setLongitudeNum(Double.parseDouble(item.get("longitudeNum").toString()));
        sunset.setLocdate(strDate);
        sunset.setLocation(loc);
      
        logger.info(" sunset : {} ", sunset);
		
	}
}
