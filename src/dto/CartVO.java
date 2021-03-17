package dto;

public class CartVO {
	private int cseq;
	private int no;
	private int iseq;
	private String img;
	private String uname;
	private String iname;
	private int quantity;
	private int price;
	private String result;
	private String indate;
	private String buydate;
	private String coupon;
	
	public String getCoupon() {
		return coupon;
	}
	public CartVO setCoupon(String coupon) {
		this.coupon = coupon;
		return this;
	}
	public String getImg() {
		return img;
	}
	public CartVO setImg(String img) {
		this.img = img;
		return this;
	}
	public String getBuydate() {
		return buydate;
	}
	public CartVO setBuydate(String buydate) {
		this.buydate = buydate;
		return this;
	}
	public String getUname() {
		return uname;
	}
	public CartVO setUname(String uname) {
		this.uname = uname;
		return this;
	}
	public String getIname() {
		return iname;
	}
	public CartVO setIname(String iname) {
		this.iname = iname;
		return this;
	}
	public int getPrice() {
		return price;
	}
	public CartVO setPrice(int price) {
		this.price = price;
		return this;
	}	
	public int getCseq() {
		return cseq;
	}
	public CartVO setCseq(int cseq) {
		this.cseq = cseq;
		return this;
	}
	public int getNo() {
		return no;
	}
	public CartVO setNo(int no) {
		this.no = no;
		return this;
	}
	public int getIseq() {
		return iseq;
	}
	public CartVO setIseq(int iseq) {
		this.iseq = iseq;
		return this;
	}
	public int getQuantity() {
		return quantity;
	}
	public CartVO setQuantity(int quantity) {
		this.quantity = quantity;
		return this;
	}
	public String getResult() {
		return result;
	}
	public CartVO setResult(String result) {
		this.result = result;
		return this;
	}
	public String getIndate() {
		return indate;
	}
	public CartVO setIndate(String indate) {
		this.indate = indate;
		return this;
	}
}
