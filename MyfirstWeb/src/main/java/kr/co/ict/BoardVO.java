package kr.co.ict;

import java.sql.Date;

public class BoardVO {
	// datetime에 대응하는 것은
	// java.sql.Date 입니다.
	// 변수 선언 및 seter, getter, tostring() 까지 작성해주세요.
	// 생성자도 만들어주세요. (constructor using fields)
	
	private int board_num;
	private String title;
	private String content;
	private String writer;
	private Date bdate;
	private Date mdate;
	private int hit;
	
	
	
	public BoardVO(int board_num, String title, String content, String writer, Date bdate, Date mdate, int hit) {
		super();
		this.board_num = board_num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.bdate = bdate;
		this.mdate = mdate;
		this.hit = hit;
	}
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
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
	public java.sql.Date getBdate() {
		return bdate;
	}
	public void setBdate(java.sql.Date bdate) {
		this.bdate = bdate;
	}
	public java.sql.Date getMdate() {
		return mdate;
	}
	public void setMdate(java.sql.Date mdate) {
		this.mdate = mdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", bdate=" + bdate + ", mdate=" + mdate + ", hit=" + hit + "]";
	}
	
	
}
