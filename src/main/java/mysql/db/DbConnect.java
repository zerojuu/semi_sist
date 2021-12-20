package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	// DB DRIVER
	static final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
	// AWS 주소
	static final String MYSQL_URL = "jdbc:mysql://semi.cvqizixmmtzr.ap-northeast-2.rds.amazonaws.com:3306/semi";
	// USER ID
	static final String USER_ID = "sist";
	// USER PASSWORD
	static final String USER_PASS = "sist1234";

	// 생성자
	public DbConnect() {
		try {
			Class.forName(MYSQL_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// Connection
	public Connection getConnection() {
		Connection conn = null;

		try {
			conn = DriverManager.getConnection(MYSQL_URL, USER_ID, USER_PASS);
		} catch (SQLException e) {
			System.out.println("MYSQL 연결 실패 : " + e.getMessage());
		}
		return conn;
	}

	// Object Close (ResultSet, Statement, Connection)
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Object Close (ResultSet, PreparedStatement, Connection)
	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Object Close (Statement, Connection)
	public void dbClose(Statement stmt, Connection conn) {
		try {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Object Close (PreparedStatement, Connection)
	public void dbClose(PreparedStatement pstmt, Connection conn) {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
