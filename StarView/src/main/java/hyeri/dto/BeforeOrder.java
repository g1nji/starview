package hyeri.dto;

public class BeforeOrder {
	
	private int orderNo;
	private String buyProname;
	private int buyProamount;
	private int totalamount;
	private String u_id;

	public BeforeOrder() {}

	public BeforeOrder(int orderNo, String buyProname, int buyProamount, int totalamount, String u_id) {
		super();
		this.orderNo = orderNo;
		this.buyProname = buyProname;
		this.buyProamount = buyProamount;
		this.totalamount = totalamount;
		this.u_id = u_id;
	}

	@Override
	public String toString() {
		return "BeforeOrder [orderNo=" + orderNo + ", buyProname=" + buyProname + ", buyProamount=" + buyProamount
				+ ", totalamount=" + totalamount + ", u_id=" + u_id + "]";
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getBuyProname() {
		return buyProname;
	}

	public void setBuyProname(String buyProname) {
		this.buyProname = buyProname;
	}

	public int getBuyProamount() {
		return buyProamount;
	}

	public void setBuyProamount(int buyProamount) {
		this.buyProamount = buyProamount;
	}

	public int getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(int totalamount) {
		this.totalamount = totalamount;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
}
