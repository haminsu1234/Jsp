package kr.co.jboard1.dto;

public class ArticleDTO {
	
	private int no;
	private int parent;
	private int comment;
	private String cate;
	private int file;
	private int countTotal;
	private String useyn;
	
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	
	public int getCountTotal() {
		return countTotal;
	}
	
	public void setCountTotal(int countTotal) {
		this.countTotal = countTotal;
	}
	//추가필드
	//private String nick;
	//public String getNick() {
	//	return nick;
	//}
	//public void setNick(String nick) {
	//	this.nick = nick;
	//}
	// 게시판에서 글쓴이를 nick로 끌고오기위함인데 나중을생각하면 이게맞긴함
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public int getFile() {
		return file;
	}
	public void setFile(int file) {
		this.file = file;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	private int hit;
	private String title;
	private String content;
	private String writer;
	private String regip;
	private String rdate;
	

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}
	public String getRdate() {
		return rdate.substring(2,10);
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	

}
