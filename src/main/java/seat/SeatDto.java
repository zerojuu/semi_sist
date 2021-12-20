package seat;

public class SeatDto {
	private String seat_id, theater_num, show_num;
	private boolean chk_seat;
	public String getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(String seat_id) {
		this.seat_id = seat_id;
	}
	public String getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(String theater_num) {
		this.theater_num = theater_num;
	}
	public String getShow_num() {
		return show_num;
	}
	public void setShow_num(String show_num) {
		this.show_num = show_num;
	}
	public boolean isChk_seat() {
		return chk_seat;
	}
	public void setChk_seat(boolean chk_seat) {
		this.chk_seat = chk_seat;
	}
	
	
}
