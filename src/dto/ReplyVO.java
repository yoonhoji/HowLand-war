package dto;

public class ReplyVO {
	private int rseq;
	private int tseq;
	private String writer;
	private int no;
	private int mastery;
	private String content;
	private String indate;
	
	
	public int getRseq() {
		return rseq;
	}
	public ReplyVO setRseq(int rseq) {
		this.rseq = rseq;
		return this;
	}
	public int getTseq() {
		return tseq;
	}
	public ReplyVO setTseq(int tseq) {
		this.tseq = tseq;
		return this;
	}
	public String getWriter() {
		return writer;
	}
	public ReplyVO setWriter(String writer) {
		this.writer = writer;
		return this;
	}
	public int getNo() {
		return no;
	}
	public ReplyVO setNo(int no) {
		this.no = no;
		return this;
	}
	public int getMastery() {
		return mastery;
	}
	public ReplyVO setMastery(int mastery) {
		this.mastery = mastery;
		return this;
	}
	public String getContent() {
		return content;
	}
	public ReplyVO setContent(String content) {
		this.content = content;
		return this;
	}
	public String getIndate() {
		return indate;
	}
	public ReplyVO setIndate(String indate) {
		this.indate = indate;
		return this;
	}
}
