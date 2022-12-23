package seulgi.dto;

public class AdminCalendar {
	
	private String recomDate;
	private String recomLoc;
	
	public AdminCalendar() {}

	public AdminCalendar(String recomDate, String recomLoc) {
		super();
		this.recomDate = recomDate;
		this.recomLoc = recomLoc;
	}

	@Override
	public String toString() {
		return "AdminCalendar [recomDate=" + recomDate + ", recomLoc=" + recomLoc + "]";
	}

	public String getRecomDate() {
		return recomDate;
	}

	public void setRecomDate(String recomDate) {
		this.recomDate = recomDate;
	}

	public String getRecomLoc() {
		return recomLoc;
	}

	public void setRecomLoc(String recomLoc) {
		this.recomLoc = recomLoc;
	}
	
}
