package dto;

public class UserVO {
	
	private int no;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String tag1;
	private String tag2;
	private String tag3;
	private String recommend;
	private int subscriber;
	private int post;
	private int point;
	private int mastery;
	private String status;
	
	
	public int getNo() {
		return no;
	}
	public UserVO setNo(int no) {
		this.no = no;
		return this;
	}
	public String getId() {
		return id;
	}
	public UserVO setId(String id) {
		this.id = id;
		return this;
	}
	public String getPw() {
		return pw;
	}
	public UserVO setPw(String pw) {
		this.pw = pw;
		return this;
	}
	public String getName() {
		return name;
	}
	public UserVO setName(String name) {
		this.name = name;
		return this;
	}
	public String getPhone() {
		return phone;
	}
	public UserVO setPhone(String phone) {
		this.phone = phone;
		return this;
	}
	public String getTag1() {
		return tag1;
	}
	public UserVO setTag1(String tag1) {
		this.tag1 = tag1;
		return this;
	}
	public String getTag2() {
		return tag2;
	}
	public UserVO setTag2(String tag2) {
		this.tag2 = tag2;
		return this;
	}
	public String getTag3() {
		return tag3;
	}
	public UserVO setTag3(String tag3) {
		this.tag3 = tag3;
		return this;
	}
	public String getRecommend() {
		return recommend;
	}
	public UserVO setRecommend(String recommend) {
		this.recommend = recommend;
		return this;
	}
	public int getSubscriber() {
		return subscriber;
	}
	public UserVO setSubscriber(int subscriber) {
		this.subscriber = subscriber;
		return this;
	}
	public int getPost() {
		return post;
	}
	public UserVO setPost(int post) {
		this.post = post;
		return this;
	}
	public int getPoint() {
		return point;
	}
	public UserVO setPoint(int point) {
		this.point = point;
		return this;
	}
	public int getMastery() {
		return mastery;
	}
	public UserVO setMastery(int mastery) {
		this.mastery = mastery;
		return this;
	}
	public String getStatus() {
		return status;
	}
	public UserVO setStatus(String status) {
		this.status = status;
		return this;
	}
}
