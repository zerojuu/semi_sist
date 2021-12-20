package showing;

import java.sql.Timestamp;

public class ShowingDto {
	private String show_num, movie_num, theater_num;
	private Timestamp showing_date;
	
	public String getShow_num() {
		return show_num;
	}
	public void setShow_num(String show_num) {
		this.show_num = show_num;
	}
	public String getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(String movie_num) {
		this.movie_num = movie_num;
	}
	public String getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(String theater_num) {
		this.theater_num = theater_num;
	}
	public Timestamp getShowing_date() {
		return showing_date;
	}
	public void setShowing_date(Timestamp showing_date) {
		this.showing_date = showing_date;
	}
	
	
}
