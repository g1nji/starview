package jiwon.dto;

import java.util.Date;

public class Sunset {
	
	private Date locdate;	//날짜
	private String location;	//지역
	private int longitudeNum;	//경도
	private int latitudeNum;	//위도
	private int sunsetNum;		//일몰
	
	public Sunset() { }

	public Sunset(Date locdate, String location, int longitudeNum, int latitudeNum, int sunsetNum) {
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

	public Date getLocdate() {
		return locdate;
	}

	public void setLocdate(Date locdate) {
		this.locdate = locdate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getLongitudeNum() {
		return longitudeNum;
	}

	public void setLongitudeNum(int longitudeNum) {
		this.longitudeNum = longitudeNum;
	}

	public int getLatitudeNum() {
		return latitudeNum;
	}

	public void setLatitudeNum(int latitudeNum) {
		this.latitudeNum = latitudeNum;
	}

	public int getSunsetNum() {
		return sunsetNum;
	}

	public void setSunsetNum(int sunsetNum) {
		this.sunsetNum = sunsetNum;
	}
	
	



}
