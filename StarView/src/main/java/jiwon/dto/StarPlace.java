package jiwon.dto;

public class StarPlace {
	
	private int arrivalNum;	//도착지(번호로 구분)
	private double eLttd;	//도착지 위도
	private double eLngtd;	//도착지 경도
	private double sLttd;	//출발지 위도
	private double sLngtd;	//출발지 경도
	private String departure;	//출발지 이름
	private String arrival;	//도착지 이름
	private String pAdr;	//명소 상세조회 시 출력할 주소
	private String pExpln;	//명소 상세조회 시 출력할 설명
	
	public StarPlace() {	}

	public StarPlace(int arrivalNum, double eLttd, double eLngtd, double sLttd, double sLngtd, String departure,
			String arrival, String pAdr, String pExpln) {
		super();
		this.arrivalNum = arrivalNum;
		this.eLttd = eLttd;
		this.eLngtd = eLngtd;
		this.sLttd = sLttd;
		this.sLngtd = sLngtd;
		this.departure = departure;
		this.arrival = arrival;
		this.pAdr = pAdr;
		this.pExpln = pExpln;
	}

	@Override
	public String toString() {
		return "StarPlace [arrivalNum=" + arrivalNum + ", eLttd=" + eLttd + ", eLngtd=" + eLngtd + ", sLttd=" + sLttd
				+ ", sLngtd=" + sLngtd + ", departure=" + departure + ", arrival=" + arrival + ", pAdr=" + pAdr
				+ ", pExpln=" + pExpln + "]";
	}

	public int getArrivalNum() {
		return arrivalNum;
	}

	public void setArrivalNum(int arrivalNum) {
		this.arrivalNum = arrivalNum;
	}

	public double geteLttd() {
		return eLttd;
	}

	public void seteLttd(double eLttd) {
		this.eLttd = eLttd;
	}

	public double geteLngtd() {
		return eLngtd;
	}

	public void seteLngtd(double eLngtd) {
		this.eLngtd = eLngtd;
	}

	public double getsLttd() {
		return sLttd;
	}

	public void setsLttd(double sLttd) {
		this.sLttd = sLttd;
	}

	public double getsLngtd() {
		return sLngtd;
	}

	public void setsLngtd(double sLngtd) {
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

	public String getpAdr() {
		return pAdr;
	}

	public void setpAdr(String pAdr) {
		this.pAdr = pAdr;
	}

	public String getpExpln() {
		return pExpln;
	}

	public void setpExpln(String pExpln) {
		this.pExpln = pExpln;
	}



}
