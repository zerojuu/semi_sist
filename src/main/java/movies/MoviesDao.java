package movies;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class MoviesDao {
	DbConnect db = new DbConnect();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public void insertMovies(MoviesDto dto) {
		String sql = "INSERT INTO movies VALUES(" + dto.getMovie_num() + ", '";
		sql += dto.getKr_title() + "', '" + dto.getEn_title() + "', '" + sdf.format(dto.getOpenDate()) + "', '";
		sql += dto.getGenre() + "', '" + dto.getDirector() + "')";
		
		Connection conn = db.getConnection();
		Statement st = null;
		try {
			st = conn.createStatement();
			st.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(st, conn);
		}
	}
	
	public String getTitle(String movie_code) {
		String title = "";
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT kr_title FROM movies WHERE movie_num = '" + movie_code + "'");
			if(rs.next()) {
				title = rs.getString("kr_title");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return title;
	}
	
	public ArrayList<MoviesDto> getAllDatas() {
		ArrayList<MoviesDto> list = new ArrayList<MoviesDto>();
		MoviesDto dto;
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM movies");
			while (rs.next()) {
				dto = new MoviesDto();
				dto.setDirector(rs.getString("director"));
				dto.setEn_title(rs.getString("en_title"));
				dto.setGenre(rs.getString("genre"));
				dto.setKr_title(rs.getString("kr_title"));
				dto.setMovie_num(rs.getString("movie_num"));
				dto.setOpenDate(rs.getDate("opendate"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return list;
	}
	
	public int getTotalRows() {
		int count = 0;
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT COUNT(movie_num) FROM movies");
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
	
	public ArrayList<MoviesDto> getList(int startRow, int endRow) {
		String sql = "SELECT * FROM movies ORDER BY movie_num desc LIMIT " + startRow + ", " + endRow;
		ArrayList<MoviesDto> dtos = new ArrayList<MoviesDto>();
		MoviesDto dto;
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				dto = new MoviesDto();
				dto.setMovie_num(rs.getString("movie_num"));
				dto.setDirector(rs.getString("director"));
				dto.setEn_title(rs.getString("en_title"));
				dto.setGenre(rs.getString("genre"));
				dto.setKr_title(rs.getString("kr_title"));
				dto.setOpenDate(rs.getDate("opendate"));
				dtos.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return dtos;
	}
	
	public MoviesDto getData(String movie_num) {
		MoviesDto dto = new MoviesDto();
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM movies WHERE movie_num='" + movie_num + "'");
			if (rs.next()) {
				dto.setDirector(rs.getString("director"));
				dto.setEn_title(rs.getString("en_title"));
				dto.setGenre(rs.getString("genre"));
				dto.setKr_title(rs.getString("kr_title"));
				dto.setMovie_num(movie_num);
				dto.setOpenDate(rs.getDate("opendate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return dto;
	}
}

