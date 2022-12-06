package jiwon.dto;

public class StarPlace {
	
	private int arrivalNum;	//도착지(번호로 구분)
	private int eLttd;	//도착지 위도
	private int eLngtd;	//도착지 경도
	private int sLttd;	//출발지 위도
	private int sLngtd;	//출발지 경도
	private String departure;	//출발지 이름
	private String arrival;	//도착지 이름
	
	public StarPlace() {	}

	public StarPlace(int arrivalNum, int eLttd, int eLngtd, int sLttd, int sLngtd, String departure, String arrival) {
		super();
		this.arrivalNum = arrivalNum;
		this.eLttd = eLttd;
		this.eLngtd = eLngtd;
		this.sLttd = sLttd;
		this.sLngtd = sLngtd;
		this.departure = departure;
		this.arrival = arrival;
	}

	@Override
	public String toString() {
		return "StarPlace [arrivalNum=" + arrivalNum + ", eLttd=" + eLttd + ", eLngtd=" + eLngtd + ", sLttd=" + sLttd
				+ ", sLngtd=" + sLngtd + ", departure=" + departure + ", arrival=" + arrival + "]";
	}

	public int getArrivalNum() {
		return arrivalNum;
	}

	public void setArrivalNum(int arrivalNum) {
		this.arrivalNum = arrivalNum;
	}

	public int geteLttd() {
		return eLttd;
	}

	public void seteLttd(int eLttd) {
		this.eLttd = eLttd;
	}

	public int geteLngtd() {
		return eLngtd;
	}

	public void seteLngtd(int eLngtd) {
		this.eLngtd = eLngtd;
	}

	public int getsLttd() {
		return sLttd;
	}

	public void setsLttd(int sLttd) {
		this.sLttd = sLttd;
	}

	public int getsLngtd() {
		return sLngtd;
	}

	public void setsLngtd(int sLngtd) {
		this.sLngtd = sLngtd;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getArrival() {
		return arrival;
	}

	public void setArrival(String arrival) {
		this.arrival = arrival;
	}
	
	

}
