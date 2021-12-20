package showing;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class ShowingDao {
	DbConnect db = new DbConnect();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public void insertShowing(ShowingDto dto) {
		String sql = "INSERT INTO showing(movie_num, showing_date, theater_num) VALUES('" + dto.getMovie_num() + "', '" +  sdf.format(dto.getShowing_date()) + "', '" + dto.getTheater_num() + "')";
	
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
	
	public ArrayList<ShowingDto> getList(int startRow, int endRow) {
		String sql = "SELECT * FROM showing ORDER BY show_num desc LIMIT " + startRow + ", " + endRow;
		ArrayList<ShowingDto> dtos = new ArrayList<ShowingDto>();
		ShowingDto dto;
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				dto = new ShowingDto();
				dto.setMovie_num(rs.getString("movie_num"));
				dto.setShow_num(rs.getString("show_num"));
				dto.setShowing_date(rs.getTimestamp("showing_date"));
				dto.setTheater_num(rs.getString("theater_num"));
				dtos.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return dtos;
	}
	
	public int getTotalRows() {
		int count = 0;
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT COUNT(show_num) FROM showing");
			int index = 0;
			if (rs.next()) {
				count = rs.getInt(++index);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return count;
	}
	
	public void deleteShowing(String show_num) {
		Connection conn = db.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.execute("DELETE FROM showing WHERE show_num='" + show_num + "'");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public ShowingDto getData(String show_num) {
		ShowingDto dto = new ShowingDto();
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM showing WHERE show_num='" + show_num + "'");
			if(rs.next()) {
				dto.setMovie_num(rs.getString("movie_num"));
				dto.setShow_num(rs.getString("show_num"));
				dto.setShowing_date(rs.getTimestamp("showing_date"));
				dto.setTheater_num(rs.getString("theater_num"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return dto;
	}
	
	public void updateShowing(ShowingDto dto) {
		String sql = "UPDATE showing SET movie_num='" + dto.getMovie_num() + "', showing_date='" + sdf.format(dto.getShowing_date()) + "', theater_num='" + dto.getTheater_num() + "' WHERE show_num = '" + dto.getShow_num() + "'";
		
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
	
	public ArrayList<ShowingDto> getAllDatas() {
		ArrayList<ShowingDto> list = new ArrayList<ShowingDto>();
		ShowingDto dto;
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM showing ORDER BY showing_date");
			while (rs.next()) {
				dto = new ShowingDto();
				dto.setMovie_num(rs.getString("movie_num"));
				dto.setShow_num(rs.getString("show_num"));
				dto.setShowing_date(rs.getTimestamp("showing_date"));
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
}
