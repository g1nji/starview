package jiwon.dto;

import java.util.Date;

public class Sunset {
	
	private String locdate;	//날짜
	private String location;	//지역
	private Double longitudeNum;	//경도
	private Double latitudeNum;	//위도
	private int sunsetNum;		//일몰
	
	public Sunset() { }

	public Sunset(String locdate, String location, Double longitudeNum, Double latitudeNum, int sunsetNum) {
		super();
		this.locdate = locdate;
		this.location = location;
		this.longitudeNum = longitudeNum;
		this.latitudeNum = latitudeNum;
		this.sunsetNum = sunsetNum;
	}

	@Override
	public String toString() {
		return "Sunset [locdate=" + locdate + ", location=" + location + ", longitudeNum=" + longitudeNum
				+ ", latitudeNum=" + latitudeNum + ", sunsetNum=" + sunsetNum + "]";
	}

	public String getLocdate() {
		return locdate;
	}

	public void setLocdate(String locdate) {
		this.locdate = locdate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Double getLongitudeNum() {
		return longitudeNum;
	}

	public void setLongitudeNum(Double longitudeNum) {
		this.longitudeNum = longitudeNum;
	}

	public Double getLatitudeNum() {
		return latitudeNum;
	}

	public void setLatitudeNum(Double latitudeNum) {
		this.latitudeNum = latitudeNum;
	}

	public int getSunsetNum() {
		return sunsetNum;
	}

	public void setSunsetNum(int sunsetNum) {
		this.sunsetNum = sunsetNum;
	}




}
