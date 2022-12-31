package hyeri.dto;

/**
 * @author my
 *
 */
public class AfterOrder {
	private int orderAfterNo;		//주문내역번호
	private String orderProcess;	//주문처리상태
	private String paymentMethod;	//결제수단
	private String perchantUid;		//API주문번호
	private String productName;		//상품이름
	private int productAmount;		//상품갯수
	private int paymentAmount;		//결제금액
	private String buyerEmail;		//구매자이메일
	private String buyerName;		//구매자이름
	private String buyerPhone;			//구매자전화번호
	private String buyerAddress;	//구매자 주소
	private String uId;				//회원아이디(FK)
	
	public AfterOrder() {}

	public AfterOrder(int orderAfterNo, String orderProcess, String paymentMethod, String perchantUid,
			String productName, int productAmount, int paymentAmount, String buyerEmail, String buyerName,
			String buyerPhone, String buyerAddress, String uId) {
		super();
		this.orderAfterNo = orderAfterNo;
		this.orderProcess = orderProcess;
		this.paymentMethod = paymentMethod;
		this.perchantUid = perchantUid;
		this.productName = productName;
		this.productAmount = productAmount;
		this.paymentAmount = paymentAmount;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerPhone = buyerPhone;
		this.buyerAddress = buyerAddress;
		this.uId = uId;
	}

	@Override
	public String toString() {
		return "AfterOrder [orderAfterNo=" + orderAfterNo + ", orderProcess=" + orderProcess + ", paymentMethod="
				+ paymentMethod + ", perchantUid=" + perchantUid + ", productName=" + productName + ", productAmount="
				+ productAmount + ", paymentAmount=" + paymentAmount + ", buyerEmail=" + buyerEmail + ", buyerName="
				+ buyerName + ", buyerPhone=" + buyerPhone + ", buyerAddress=" + buyerAddress + ", uId=" + uId + "]";
	}

	public int getOrderAfterNo() {
		return orderAfterNo;
	}

	public void setOrderAfterNo(int orderAfterNo) {
		this.orderAfterNo = orderAfterNo;
	}

	public String getOrderProcess() {
		return orderProcess;
	}

	public void setOrderProcess(String orderProcess) {
		this.orderProcess = orderProcess;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getPerchantUid() {
		return perchantUid;
	}

	public void setPerchantUid(String perchantUid) {
		this.perchantUid = perchantUid;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public String getBuyerAddress() {
		return buyerAddress;
	}

	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

}
