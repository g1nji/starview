package seulgi.dto;

import java.util.Date;

public class AdminCalendar {
	
	private int recomCode;
	private String recomLoc;
	private String recomDate;
	private String recomTime;
	private Date regDate;
	private int rain;
	private String sky;
	
	public AdminCalendar() {}

	public AdminCalendar(int recomCode, String recomLoc, String recomDate, String recomTime, Date regDate, int rain,
			String sky) {
		super();
		this.recomCode = recomCode;
		this.recomLoc = recomLoc;
		this.recomDate = recomDate;
		this.recomTime = recomTime;
		this.regDate = regDate;
		this.rain = rain;
		this.sky = sky;
	}

	@Override
	public String toString() {
		return "AdminCalendar [recomCode=" + recomCode + ", recomLoc=" + recomLoc + ", recomDate=" + recomDate
				+ ", recomTime=" + recomTime + ", regDate=" + regDate + ", rain=" + rain + ", sky=" + sky + "]";
	}

	public int getRecomCode() {
		return recomCode;
	}

	public void setRecomCode(int recomCode) {
		this.recomCode = recomCode;
	}

	public String getRecomLoc() {
		return recomLoc;
	}

	public void setRecomLoc(String recomLoc) {
		this.recomLoc = recomLoc;
	}

	public String getRecomDate() {
		return recomDate;
	}

	public void setRecomDate(String recomDate) {
		this.recomDate = recomDate;
	}

	public String getRecomTime() {
		return recomTime;
	}

	public void setRecomTime(String recomTime) {
		this.recomTime = recomTime;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getRain() {
		return rain;
	}

	public void setRain(int rain) {
		this.rain = rain;
	}

	public String getSky() {
		return sky;
	}

	public void setSky(String sky) {
		this.sky = sky;
	}

}
