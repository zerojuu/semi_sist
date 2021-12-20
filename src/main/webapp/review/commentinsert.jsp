<%@page import="review.commentDao"%>
<%@page import="review.commentDto"%>
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

//데이터 읽어서 dto 넣기
commentDto dto=new commentDto();
dto.setNum(request.getParameter("num"));
dto.setMyid(request.getParameter("myid"));
dto.setContent(request.getParameter("content"));

//페이지 번호도 읽어오기
String currentPage=request.getParameter("currentPage");

//db에 저장
commentDao dao=new commentDao();
dao.insertComment(dto);

//목록으로 이동
response.sendRedirect("../index.jsp?main=review/reviewlist.jsp?currentPage="+currentPage);
%>
</body>
</html>