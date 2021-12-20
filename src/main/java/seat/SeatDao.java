package seat;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class SeatDao {
	DbConnect db = new DbConnect();
	
	public void insertSeat(SeatDto dto) {
		String sql = "INSERT INTO seat (show_num, theater_num, seat_id) ";
		sql += "VALUES ";
		ArrayList<String> id = this.getSeatId();
		for (String i : id) {
			sql += "('" + dto.getShow_num() + "', '" + dto.getTheater_num() + "', '" + i + "'),";
		}
		sql = sql.substring(0, sql.length() - 1);
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void deleteSeat(String show_num) {
		Connection conn = db.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.execute("DELETE FROM seat WHERE show_num='" + show_num + "'");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public ArrayList<SeatDto> getSeats(String show_num) {
		ArrayList<SeatDto> list = new ArrayList<SeatDto>();
		SeatDto dto;
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM seat WHERE show_num='" + show_num + "'");
			while (rs.next()) {
				dto = new SeatDto();
				dto.setChk_seat(rs.getBoolean("chk_seat"));
				dto.setSeat_id(rs.getString("seat_id"));
				dto.setShow_num(show_num);
				dto.setTheater_num(rs.getString("theater_num"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return list;
	}
	
	private ArrayList<String> getSeatId() {
		ArrayList<String> id = new ArrayList<String>();
		for (char i = 'A'; i <= 'D'; i++) {
			for (int j = 1; j <= 10; j++) {
				id.add(i + Integer.toString(j));
			}
		}
		
		return id;
	}
}
