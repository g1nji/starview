package ydg.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ydg.dao.face.UsersDao;
import ydg.dto.Users;
import ydg.service.face.UsersService;

@Service
public class UsersServiceImpl implements UsersService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UsersDao usersDao;
	
	@Override
	public boolean insert(Users users) {
		
		if( usersDao.selectCntById(users) > 0) {
			return false;
		}
		
		usersDao.insertUser(users);
		
		if(usersDao.selectCntById(users) > 0 ) {
			
			return true;
		}
		return false;
		
	}
	
	@Override
	public int idcheck(String uId) {
		
		return usersDao.selectByuId(uId);
	}
	
	@Override
	public boolean login(Users users) {
		int loginChk = usersDao.selectCntUsers(users);
		logger.info("loginChk : {}", loginChk);
		
		if( loginChk > 0 ) return true;
		return false;
	}
	
	
	@Override
	public String getAccessToken(String code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=97cf4084041ad45dbcd326d4447775e1"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8088/users/kakao"); // 본인이 설정한 주소
            
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
//			JsonParser parser = null;
			JsonElement element = JsonParser.parseString(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

//			JsonParser parser = new JsonParser();
			JsonElement element = JsonParser.parseString(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
					
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("gender", gender);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	@Override
	public List<Users> findId(String find, String phoneName, String mailName, Users users) {
		
		if(find.equals("phone")) {
			users.setuName(phoneName);
			List<Users> userId = usersDao.selectByphone(users);
			
			return userId;
		} else if (find.equals("email")) {
			users.setuName(mailName);
			List<Users> userId = usersDao.selectByEmail(users);
			
			return userId;
		} else {
			return null;
		}
	}

	@Override
	public String finduNick(Users users) {
		return usersDao.finduNick(users);
	}
	
	@Override
	public String findName(Users users) {
		return usersDao.findName(users);
	}
	
}
