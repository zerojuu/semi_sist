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
String num=request.getParameter("num");
String currentPage=request.getParameter("currentPage");

reviewDao dao=new reviewDao();
dao.deleteReview(num);
   
 
response.sendRedirect("../index.jsp?main=review/reviewlist.jsp?currentPage="+currentPage);
%>
</body>
</html>