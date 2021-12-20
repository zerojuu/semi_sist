<%@page import="Sign.SignDao"%>
<%@page import="Sign.SignDto"%>
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
request.setCharacterEncoding("utf-8");

SignDto dto=new SignDto();
String name=request.getParameter("name");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String birth=request.getParameter("birth");
String hp=request.getParameter("hp");
String email=request.getParameter("email1")+"@"+request.getParameter("email2");


dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setBirth(birth);
dto.setHp(hp);
dto.setEmail(email);

SignDao dao=new SignDao();
dao.insertMember(dto);

//gaipsuccess로 이동
response.sendRedirect("../../index.jsp?main=sign/signup/gaipsuccess.jsp?id="+id);
%>
</body>
</html>