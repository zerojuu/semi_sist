<%@page import="Sign.SignDto"%>
<%@page import="Sign.SignDao"%>
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
String root=request.getContextPath();

request.setCharacterEncoding("utf-8");
SignDao dao=new SignDao();

SignDto dto=new SignDto();

String num=request.getParameter("num");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String hp=request.getParameter("hp");
String email=request.getParameter("email1")+"@"+request.getParameter("email2");

dto.setId(id);
dto.setPass(pass);
dto.setHp(hp);
dto.setEmail(email);
dto.setNum(num);

dao.updateMember(dto);
response.sendRedirect(root+"/index.jsp");
%>
</body>
</html>