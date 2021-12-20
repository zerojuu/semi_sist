<%@page import="Sign.SignDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title> 
    
    <%
	//id를 읽는다
	String id=request.getParameter("id");
	System.out.print(id);
	//dao선언
	SignDao dao=new SignDao();
	//아이디에 대한 이름
	String name=dao.getName(id);
	//프로젝트 경로구하기
	String root=request.getContextPath();
	
	%>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=root %>/tmplt/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/style.css" type="text/css">
</head>

</head>

<body>
    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2><%=name %>님 회원가입을 축하합니다</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Js Plugins -->
    <script src="<%=root %>/tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="<%=root %>/tmplt/js/bootstrap.min.js"></script>
	<script src="<%=root %>/tmplt/js/player.js"></script>
	<script src="<%=root %>/tmplt/js/jquery.nice-select.min.js"></script>
	<script src="<%=root %>/tmplt/js/mixitup.min.js"></script>
	<script src="<%=root %>/tmplt/js/jquery.slicknav.js"></script>
	<script src="<%=root %>/tmplt/js/owl.carousel.min.js"></script>
	<script src="<%=root %>/tmplt/js/main.js"></script>

</body>
</html>
