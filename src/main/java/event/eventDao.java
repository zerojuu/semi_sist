package event;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mysql.db.DbConnect;



public class eventDao{
	DbConnect db = new DbConnect();
	
//	public void insertBoard(eventDto dto) {
//		Connection conn = db.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "INSERT INTO event VALUES(null,?,?,?,?,?)";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,dto.getImg());
//			pstmt.setString(2, dto.getSubject());
//			pstmt.setString(3, dto.getContent());
//			pstmt.setString(4, dto.getContent());
//			
//			pstmt.execute();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			db.dbClose(pstmt, conn);
//		}
//	}
	
	public ArrayList<eventDto> getAllDatas(){
		
		ArrayList<eventDto> list = new ArrayList<eventDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM event ORDER BY event_num";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				eventDto dto = new eventDto();
				
				dto.setEvent_num(rs.getString("event_num"));
				dto.setImg(rs.getString("img"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setTerm(rs.getString("term"));
				dto.setExpirydate(rs.getTimestamp("expirydate"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return list;
	}
	public eventDto selectData(String num) {
		eventDto dto = new eventDto();
		
		Connection conn = db.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM event WHERE event_num="+num;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setEvent_num(rs.getString("event_num"));
				dto.setContent(rs.getString("content"));	
				dto.setSubject(rs.getString("subject"));
				dto.setTerm(rs.getString("term"));}
				dto.setExpirydate(rs.getTimestamp("expirydate"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return dto;
	}
	
	public ArrayList<eventDto> searchData(String srch) {
		ArrayList<eventDto> list = new ArrayList<eventDto>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		String sql = "SELECT * FROM event WHERE subject LIKE '%"+srch+"%' order by event_num desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				eventDto dto = new eventDto();
				
				dto.setEvent_num(rs.getString("event_num"));
				dto.setImg(rs.getString("img"));
				dto.setSubject(rs.getString("subject"));
				dto.setTerm(rs.getString("term"));
				dto.setContent(rs.getString("content"));
				dto.setExpirydate(rs.getTimestamp("expirydate"));
				
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public ArrayList<eventDto> getexpiredDatas(){
		
		ArrayList<eventDto> list = new ArrayList<eventDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM event WHERE expirydate < now()";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				eventDto dto = new eventDto();
				
				dto.setEvent_num(rs.getString("event_num"));
				dto.setImg(rs.getString("img"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setTerm(rs.getString("term"));
				dto.setExpirydate(rs.getTimestamp("expirydate"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return list;
	}
}
