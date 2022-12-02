package jiwon.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jiwon.service.face.SunsetService;

@Controller
public class SunsetController {
	
	//로그
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private SunsetService sunsetService;

	@RequestMapping("/sunset/time")
	public void sunsetview() throws IOException {
		
		//서비스키
		String serviceKey = "uej3x%2FSsIAytAndt4BMIKuPLeCRuvBJL1aMC%2BiIe3gzxsas6kdk0hv7SLipcQPprTnEOdxDKToBjNSPqXw2nrQ%3D%3D";
		
		//API URL
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService");
		//서비스키 추가하기
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
		//연도 설정
		urlBuilder.append("&" + URLEncoder.encode("stdrYear", "UTF-8") + "=" + URLEncoder.encode("2022", "UTF-8"));
	
		//요청 자료 데이터타입 XML로 설정하기
		urlBuilder.append("&" + URLEncoder.encode("format", "UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8"));
		//페이지 출력 수
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("5", "UTF-8"));
		//페이지 번호
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
   
//		urlBuilder.append("&" + URLEncoder.encode("pnu", "UTF-8") + "=" + URLEncoder.encode(pnu_code, "UTF-8")); //pnu_code
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		//get방식으로 전송해서 파라미터 받아오기
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
		
	}
}
