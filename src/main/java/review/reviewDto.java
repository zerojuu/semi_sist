package review;

import java.sql.Timestamp;

public class reviewDto {

	
	
	private String num;
	private String movie_num;
	private String subject;
	private String content;
	private int likes;
	private Timestamp writeday;
	private String myid;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}

	public String getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(String movie_num) {
		this.movie_num = movie_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public String getMyid() {
		return myid;
	}
	public void setMyid(String myid) {
		this.myid = myid;
	}	
}
