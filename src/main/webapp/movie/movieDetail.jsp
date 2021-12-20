<%@page import="java.text.SimpleDateFormat"%>
<%@page import="movies.MoviesDto"%>
<%@page import="movies.MoviesDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" name='viewport' content='width=device-width, initial-scale=1.0'>
	<title>Document</title>
	<!-- jQuery -->
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="tmplt/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/style.css" type="text/css">
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	String movie_num = request.getParameter("movie_num");
	
	MoviesDao dao = new MoviesDao();
	MoviesDto dto = dao.getData(movie_num);
	%>

	<div class="container" align="center">
		<table class="table table-bordered" style="color: white; font-size: 16pt; width: 650px;">
			<caption style="caption-side: top;"><%= dto.getKr_title() %> (<%= dto.getEn_title() %>)</caption>
			<tr>
				<td colspan="2" width="400px" height="600px" align="center">
					<img alt="" src="./tmplt/img/<%= dto.getMovie_num() %>.jpeg" width="400px" height="600px">
				</td>
			</tr>
			<tr>
				<th>영화 제목</th>
				<td><%= dto.getKr_title() %> (<%= dto.getEn_title() %>)</td>
			</tr>
			<tr>
				<th>감독</th>
				<td><%= dto.getDirector() %></td>
			</tr>
			<tr>
				<th>장르</th>
				<td><%= dto.getGenre() %></td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td><%= sdf.format(dto.getOpenDate()) %></td>
			</tr>
		</table>
		<button onclick="location.href='index.jsp?main=reserve/reservation.jsp?movie_num=<%= dto.getMovie_num() %>'" class="btn btn-info btn-lg">예매하기</button>
		<button onclick="location.href='index.jsp?main=movie/movieList.jsp'" class="btn btn-info btn-lg">목록으로</button>
	</div>
	
	<!-- Js Plugins -->
	<script src="tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="tmplt/js/bootstrap.min.js"></script>
	<script src="tmplt/js/player.js"></script>
	<script src="tmplt/js/jquery.nice-select.min.js"></script>
	<script src="tmplt/js/mixitup.min.js"></script>
	<script src="tmplt/js/jquery.slicknav.js"></script>
	<script src="tmplt/js/owl.carousel.min.js"></script>
	<script src="tmplt/js/main.js"></script>
</body>

</html>