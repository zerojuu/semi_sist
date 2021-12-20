package reserve;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class ReserveDao {
	DbConnect db = new DbConnect();
	
	public void insertReserve(ReserveDto dto) {
		String sql = "INSERT INTO reserve(user_num, show_num, theater_num, seat_id) ";
		sql += "VALUES('" + dto.getUser_num() + "', '" + dto.getShow_num() + "', '" + dto.getTheater_num() + "', '" + dto.getSeat_id() + "')";
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
			String seat_id = dto.getSeat_id();
			String theater_num = dto.getTheater_num();
			setSeatCheck(seat_id, theater_num);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void setSeatCheck(String seat_id, String theater_num) {
		String sql = "UPDATE seat SET chk_seat=false WHERE (theater_num='" + theater_num + "') AND (";
		if (seat_id.contains(":")) {
			String[] seat_ids = seat_id.split(":");
			for (String i : seat_ids) {
				sql += "seat_id='" + i + "' OR ";
			}
			sql = sql.substring(0, sql.length() - 4) + ")";
		} else {
			sql += "seat_id='" + seat_id + "')";
		}
		
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
	
	public ArrayList<ReserveDto> getUserReserve(String user_num) {
		ArrayList<ReserveDto> list = new ArrayList<ReserveDto>();
		ReserveDto dto;
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM reserve WHERE user_num='" + user_num + "'");
			while (rs.next()) {
				dto = new ReserveDto();
				dto.setReserve_num(rs.getString("reserve_num"));
				dto.setSeat_id(rs.getString("seat_id"));
				dto.setShow_num(rs.getString("show_num"));
				dto.setTheater_num(rs.getString("theater_num"));
				dto.setUser_num(user_num);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return list;
	}
	
	public ReserveDto getData(String reserve_num) {
		ReserveDto dto = new ReserveDto();
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM reserve WHERE reserve_num='" + reserve_num + "'");
			if(rs.next()) {
				dto.setReserve_num(reserve_num);
				dto.setSeat_id(rs.getString("seat_id"));
				dto.setShow_num(rs.getString("show_num"));
				dto.setTheater_num(rs.getString("theater_num"));
				dto.setUser_num(rs.getString("user_num"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return dto;
	}
	
	public void deleteReserve(String reserve_num) {
		ReserveDto dto = new ReserveDto();
		Connection conn = db.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			dto = this.getData(reserve_num);
			stmt.execute("DELETE FROM reserve WHERE reserve_num='" + reserve_num + "'");
			falseSeatCheck(dto.getSeat_id(), dto.getTheater_num());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void falseSeatCheck(String seat_id, String theater_num) {
		String sql = "UPDATE seat SET chk_seat=true WHERE (theater_num='" + theater_num + "') AND (";
		if (seat_id.contains(":")) {
			String[] seat_ids = seat_id.split(":");
			for (String i : seat_ids) {
				sql += "seat_id='" + i + "' OR ";
			}
			sql = sql.substring(0, sql.length() - 4) + ")";
		} else {
			sql += "seat_id='" + seat_id + "')";
		}
		
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
}
