package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql.db.DbConnect;

public class commentDao {

	DbConnect db=new DbConnect();
	
	    //추가
		public void insertComment(commentDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="insert into comment (num,myid,content,writeday) values (?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getNum());
				pstmt.setString(2, dto.getMyid());
				pstmt.setString(3, dto.getContent());
				
				pstmt.execute();
				
			} catch (SQLException e) {
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		
		//전체 출력
		public List<commentDto> getAllComment(String num){
			
			List<commentDto>list=new Vector<commentDto>();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from comment where num=? order by cnum";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, num);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					commentDto dto=new commentDto();
					dto.setCnum(rs.getString("cnum"));
					dto.setNum(rs.getString("num"));
					dto.setMyid(rs.getString("myid"));
					dto.setContent(rs.getString("content"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
					list.add(dto);
				}			
			} catch (SQLException e) {
			} finally {
				db.dbClose(rs, pstmt, conn);
			}		
			return list;
		}
		
		
		//삭제
		public void deleteComment(String cnum) {
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			
			String sql="delete from comment where cnum=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, cnum);
				
				pstmt.execute();
				
			} catch (SQLException e) {
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
}
