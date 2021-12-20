package review;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import mysql.db.DbConnect;
 
public class reviewDao {	
	
	DbConnect db=new DbConnect();		
	
	//insert
	public void insertReview(reviewDto dto) {
	
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into review (movie_num,subject,content,writeday,myid) values(?,?,?,now(),?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
						
			pstmt.setString(1, dto.getMovie_num());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getMyid());
			
			pstmt.execute();
			
		} catch (SQLException e) {
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	//totalcount
		public int getTotalCount() {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null; 
			
			int n=0;
			
			String sql="select count(*) from review";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) 
					n=rs.getInt(1);
							
			} catch (SQLException e) {
			} finally {
				db.dbClose(rs, pstmt, conn);
			}				
			return n;
		}
		
		
		//페이징 처리에 필요한 리스트
		public List<reviewDto>getList(int start,int perPage){
			List<reviewDto>list=new Vector<reviewDto>();
					
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
					
			String sql="select * from review order by num desc limit ?,?";
					
			try {
				pstmt=conn.prepareStatement(sql);
						
				pstmt.setInt(1, start);
				pstmt.setInt(2, perPage);
						
				rs=pstmt.executeQuery();
						
				while(rs.next()) {
					reviewDto dto=new reviewDto();
							
					dto.setNum(rs.getString("num"));
					dto.setMovie_num(rs.getString("movie_num"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));						
					dto.setLikes(rs.getInt("likes"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					dto.setMyid(rs.getString("myid"));
							
					list.add(dto);	
				}		
			} catch (SQLException e) {								
			} finally {
				db.dbClose(rs, pstmt, conn);
			}		
			return list;
		}
		
		
		//수정에 필요한 num
		public reviewDto getData(String num) {
					
			reviewDto dto=new reviewDto();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
					
			String sql="select * from review where num=?";
					
			try {
				pstmt=conn.prepareStatement(sql);
						
				pstmt.setString(1, num);
				
				rs=pstmt.executeQuery();
						
				if(rs.next()) {
					dto.setNum(rs.getString("num"));
					dto.setMovie_num(rs.getString("movie_num"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));						
					dto.setLikes(rs.getInt("likes"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					dto.setMyid(rs.getString("myid"));
				}				
			} catch (SQLException e) {
			} finally {
				db.dbClose(rs, pstmt, conn);
			}		
			return dto;
		}
				
				
		//수정
		public void updateReview(reviewDto dto) { 			
		    Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
					
			String sql="update review set subject=?,content=? where num=?";
					
			try {
				pstmt=conn.prepareStatement(sql);

				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getNum());
					
				pstmt.execute();
						
			} catch (SQLException e) {
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
				
				
		//삭제
		public void deleteReview(String num) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
					
			String sql="delete from review where num=?";
					
			try {
				pstmt=conn.prepareStatement(sql);
						
				pstmt.setString(1, num);
						
				pstmt.execute();
						
			} catch (SQLException e) {
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
				
				
		//추천수
		public void updateLikes(String num) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update review set likes=likes+1 where num=?";
					
			try {
				pstmt=conn.prepareStatement(sql);
						
				pstmt.setString(1, num);
						
				pstmt.execute();
						
			} catch (SQLException e) {
			} finally {
				db.dbClose(pstmt, conn);
			}
		}	
}
