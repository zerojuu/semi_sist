package event;

import java.sql.Timestamp;

public class eventDto {
	
	
	private String event_num;
	private String subject;
	private String content;
	private String img;
	private String term;
	private Timestamp expirydate;

	public Timestamp getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(Timestamp expirydate) {
		this.expirydate = expirydate;
	}
	public String getEvent_num() {
		return event_num;
	}
	public void setEvent_num(String event_num) {
		this.event_num = event_num;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
}
