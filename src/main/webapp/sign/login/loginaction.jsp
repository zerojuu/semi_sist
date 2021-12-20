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
String id=request.getParameter("id");
String pass=request.getParameter("pass");

//프로젝트 경로구하기
String root=request.getContextPath();

SignDao dao=new SignDao();

boolean b=dao.isIdPass(id, pass);

if(b)
{
	session.setMaxInactiveInterval(120);
	session.setAttribute("loginok", "yes");
	session.setAttribute("myid", id);
	//로그인메인으로 이동
	response.sendRedirect(root+"/index.jsp?main=sign/login/loginmain.jsp");
}else{%>
	<script type="text/javascript">
	  alert("아이디 또는 비밀번호가 맞지 않습니다");
	  history.back();
	</script>
<%}
%>
</body>
</html>