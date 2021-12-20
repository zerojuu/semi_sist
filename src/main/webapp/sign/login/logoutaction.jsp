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
//프로젝트 경로구하기
String root=request.getContextPath();
//loginok라는 세션을 제거한다
session.removeAttribute("loginok");
//myid 세선 제거
session.removeAttribute("myid");
//loginmain으로 이동
response.sendRedirect(root+"/index.jsp?main=sign/login/loginform.jsp");
%>
</body>
</html>