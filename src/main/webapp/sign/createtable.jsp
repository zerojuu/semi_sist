<%@page import="mysql.db.DbConnect"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%
DbConnect db=new DbConnect();

Connection conn=db.getConnection();
Statement stmt=null;

// String sql="create table test(user_num SMALLINT REFERENCES member(num) ON DELETE CASCADE)";
String sql="alter table member add name varchar(100)";

try{
	stmt=conn.createStatement();
	
	stmt.executeUpdate(sql);
}catch(SQLException e){
	e.printStackTrace();
}finally{
	db.dbClose(stmt, conn);
}	

%>

</body>
</html>