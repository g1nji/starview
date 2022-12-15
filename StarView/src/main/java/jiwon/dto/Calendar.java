package jiwon.dto;

import java.util.Date;

public class Calendar {

	private int sNo;
	private Date recomDate;
	private String uId;
	private int sDate;
	private String todoList;
	
	public Calendar() {	}

	public Calendar(int sNo, Date recomDate, String uId, int sDate, String todoList) {
		super();
		this.sNo = sNo;
		this.recomDate = recomDate;
		this.uId = uId;
		this.sDate = sDate;
		this.todoList = todoList;
	}

	@Override
	public String toString() {
		return "Calendar [sNo=" + sNo + ", recomDate=" + recomDate + ", uId=" + uId + ", sDate=" + sDate + ", todoList="
				+ todoList + "]";
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
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

	public int getsDate() {
		return sDate;
	}

	public void setsDate(int sDate) {
		this.sDate = sDate;
	}

	public String getTodoList() {
		return todoList;
	}

	public void setTodoList(String todoList) {
		this.todoList = todoList;
	}


	
	
}
