package ydg.dto;

public class Users {
	
	private String uId;
	private int uNo;
	private String uPw;
	private String uName;
	private String uGender;
	private String uBirth;
	private String uEmail;
	private String uPhone;
	private String uAddress;
	private String uNick;
	
	public Users() {}

	public Users(String uId, int uNo, String uPw, String uName, String uGender, String uBirth, String uEmail,
			String uPhone, String uAddress, String uNick) {
		super();
		this.uId = uId;
		this.uNo = uNo;
		this.uPw = uPw;
		this.uName = uName;
		this.uGender = uGender;
		this.uBirth = uBirth;
		this.uEmail = uEmail;
		this.uPhone = uPhone;
		this.uAddress = uAddress;
		this.uNick = uNick;
	}

	@Override
	public String toString() {
		return "Users [uId=" + uId + ", uNo=" + uNo + ", uPw=" + uPw + ", uName=" + uName + ", uGender=" + uGender
				+ ", uBirth=" + uBirth + ", uEmail=" + uEmail + ", uPhone=" + uPhone + ", uAddress=" + uAddress
				+ ", uNick=" + uNick + "]";
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuGender() {
		return uGender;
	}

	public void setuGender(String uGender) {
		this.uGender = uGender;
	}

	public String getuBirth() {
		return uBirth;
	}

	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public String getuNick() {
		return uNick;
	}

	public void setuNick(String uNick) {
		this.uNick = uNick;
	}

}
