package review;

import java.sql.Timestamp;

public class commentDto {

	private String cnum;
	private String num;
	private String myid;
	private String content;
	private Timestamp writeday;
	
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMyid() {
		return myid;
	}
	public void setMyid(String myid) {
		this.myid = myid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}	
}
