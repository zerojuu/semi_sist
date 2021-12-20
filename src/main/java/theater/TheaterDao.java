package theater;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class TheaterDao {
	DbConnect db = new DbConnect();
	
	public ArrayList<String> getTheaterNum() {
		ArrayList<String> list = new ArrayList<String>();
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT theater_num FROM theater");
			while (rs.next()) {
				list.add(rs.getString("theater_num"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return list;
	}
	
}
