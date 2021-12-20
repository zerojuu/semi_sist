<%@page import="review.reviewDto"%>
<%@page import="review.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%     
request.setCharacterEncoding("utf-8");
//세션으로부터 db에 저장할 아이디
String myid=(String)session.getAttribute("myid");

String content=request.getParameter("content");
String subject=request.getParameter("subject");
String movie_num=request.getParameter("movie_num");
  
reviewDto dto=new reviewDto();
dto.setContent(content);
dto.setSubject(subject);
dto.setMovie_num(movie_num);

dto.setMyid(myid);

reviewDao dao=new reviewDao();
dao.insertReview(dto);

response.sendRedirect("../index.jsp?main=review/reviewlist.jsp");
%>
</body>
</html>