package dto;

public class ItemVO {
	private int iseq;
	private String ctg;
	private String name;
	private String img;
	private int price;
	private String description;
	private int buy;
	
	
	public int getBuy() {
		return buy;
	}
	public ItemVO setBuy(int buy) {
		this.buy = buy;
		return this;
	}
	public int getIseq() {
		return iseq;
	}
	public ItemVO setIseq(int iseq) {
		this.iseq = iseq;
		
		return this;
	}
	public String getCtg() {
		return ctg;
	}
	public ItemVO setCtg(String ctg) {
		this.ctg = ctg;
		return this;
	}
	public String getName() {
		return name;
	}
	public ItemVO setName(String name) {
		this.name = name;
		return this;
	}
	public String getImg() {
		return img;
	}
	public ItemVO setImg(String img) {
		this.img = img;
		return this;
	}
	public int getPrice() {
		return price;
	}
	public ItemVO setPrice(int price) {
		this.price = price;
		return this;
	}
	public String getDescription() {
		return description;
	}
	public ItemVO setDescription(String description) {
		this.description = description;
		return this;
	}
}
