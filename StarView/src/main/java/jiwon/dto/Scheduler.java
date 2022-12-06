package jiwon.dto;

import java.util.Date;

public class Scheduler {

	private int sDate;
	private Date recomDate;
	private String uId;
	private int sMonth;
	private String todoList;
	
	public Scheduler() {	}

	public Scheduler(int sDate, Date recomDate, String uId, int sMonth, String todoList) {
		super();
		this.sDate = sDate;
		this.recomDate = recomDate;
		this.uId = uId;
		this.sMonth = sMonth;
		this.todoList = todoList;
	}

	@Override
	public String toString() {
		return "Scheduler [sDate=" + sDate + ", recomDate=" + recomDate + ", uId=" + uId + ", sMonth=" + sMonth
				+ ", todoList=" + todoList + "]";
	}

	public int getsDate() {
		return sDate;
	}

	public void setsDate(int sDate) {
		this.sDate = sDate;
	}

	public Date getRecomDate() {
		return recomDate;
	}

	public void setRecomDate(Date recomDate) {
		this.recomDate = recomDate;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public int getsMonth() {
		return sMonth;
	}

	public void setsMonth(int sMonth) {
		this.sMonth = sMonth;
	}

	public String getTodoList() {
		return todoList;
	}

	public void setTodoList(String todoList) {
		this.todoList = todoList;
	}
	
	
}
