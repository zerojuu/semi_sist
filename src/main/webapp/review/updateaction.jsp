<%@page import="review.reviewDao"%>
<%@page import="review.reviewDto"%>
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

String myid=(String)session.getAttribute("myid");

reviewDto dto=new reviewDto();
  
String subject=request.getParameter("subject");
String content=request.getParameter("content");

String num=request.getParameter("num");

dto.setSubject(subject);
dto.setContent(content);
dto.setNum(num);

reviewDao dao=new reviewDao();
dao.updateReview(dto);

response.sendRedirect("../index.jsp?main=review/reviewlist.jsp");
%>
</body>
</html>