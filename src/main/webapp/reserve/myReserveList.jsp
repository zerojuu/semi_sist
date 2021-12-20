<%@page import="movies.MoviesDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="showing.ShowingDao"%>
<%@page import="reserve.ReserveDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reserve.ReserveDao"%>
<%@page import="Sign.SignDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" name='viewport' content='width=device-width, initial-scale=1.0'>

	<!-- TITLE -->
	<title>INDEX</title>

	<!-- jQuery -->
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
   
    <!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- JS -->
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
	
	String logInOk = (String)session.getAttribute("loginok");
	String user_num = "";
	if (logInOk != null) {
		user_num = new SignDao().getNum((String)session.getAttribute("myid"));
	} else {
		user_num = "";
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일 HH시 mm분");
	ReserveDao reserve_dao = new ReserveDao();
	ArrayList<ReserveDto> list = reserve_dao.getUserReserve(user_num);
	
	ShowingDao show_dao = new ShowingDao();
	MoviesDao movie_dao = new MoviesDao();
	
	
	String movie_name = "";
	String show_date = "";
	String seat_id = "";
	%>
	
	<div class="container" align="center">
		<table class="table table-bordered" style="margin-top: 30px;">
			<caption style="caption-side: top;"><b style="color: white; font-size: 20pt;">예약 내역</b></caption>
			<thead style="font-size: 16pt; color: white;">
				<tr>
					<th>예약 번호</th><th>영화</th><th>상영관</th><th>날짜 / 시간</th><th>좌석</th>
				</tr>
			</thead>
			
			<tbody style="font-size: 14pt; color: white;">
				<% for (ReserveDto i : list) { 
					movie_name = movie_dao.getTitle(
								show_dao.getData(i.getShow_num()).getMovie_num()
							); 
					show_date = sdf.format(show_dao.getData(i.getShow_num()).getShowing_date());
					seat_id = i.getSeat_id().replace(":", ", "); %>
					<tr>
						<td><%= i.getReserve_num() %></td>
						<td><%= movie_name %></td>
						<td><%= i.getTheater_num() %>번 상영관</td>
						<td><%= show_date %></td>
						<td><%= seat_id %></td>
						<td>
							<button onclick="location.href='index.jsp?main=reserve/deleteReserve.jsp?reserve_num=<%= i.getReserve_num() %>'" class="btn btn-info">취소</button>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
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