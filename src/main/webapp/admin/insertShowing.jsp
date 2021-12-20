<%@page import="java.text.SimpleDateFormat"%>
<%@page import="showing.ShowingDao"%>
<%@page import="showing.ShowingDto"%>
<%@page import="theater.TheaterDao"%>
<%@page import="movies.MoviesDto"%>
<%@page import="java.util.ArrayList"%>
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
    <link rel="stylesheet" href="tmplt/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/style.css" type="text/css">
</head>

<body>
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddHH:mm");
	
	ArrayList<MoviesDto> movies = new MoviesDao().getAllDatas();
	ArrayList<String> theaters = new TheaterDao().getTheaterNum();
	ArrayList<ShowingDto> showing = new ShowingDao().getAllDatas();
	%>
	<div class="container" style="margin: 10px 50px;">
		<h2 style="color: white; margin: 0;">상영 정보 추가</h2>
		<div style="margin: 20px;">
			<select id="titles" class="form-select sel">
				<%for (MoviesDto i : movies) {%>
					<option value="<%= i.getMovie_num() %>"><%= i.getKr_title() %></option>
				<%} %>
			</select>
			
			<b style="font-size: 14pt; color: white; margin-left: 10%;">상영 날짜</b>
			<input type="date" id="show_date" style="margin-right: 20px;">
			<input type="time" id="show_time" style="margin-right: 20px;">
			
			<b style="font-size: 14pt; color: white; margin-left: 10%;">상영관</b>
			<select id="theaters" class="form-select sel">
				<%for (String i : theaters) {%>
					<option value="<%= i %>"><%= i %>번 상영관</option>
				<%} %>
			</select>
			<button class="btn btn-info btn-lg" id="insert" style="margin-right: 10px;">추가</button>
			<button class="btn btn-warning btn-lg" onclick="location.href='index.jsp?main=admin/setShowing.jsp'">취소</button>
		</div>
	</div>
	
	<script type="text/javascript">
		$("#insert").on("click", function(){
			var title = $("#titles option:selected").val();
			var date = $("#show_date").val();
			var time = $("#show_time").val();
			var theater = $("#theaters option:selected").val();
			if (check_theater(theater, date, time)) {
				if (date != null && date != "" && time != null && time != "") {
					location.href = "index.jsp?main=admin/insertShowingAction.jsp?movie_num=" + title + "&showing_date=" + date + " " + time + "&theater_num=" + theater;
				} else {
					alert("잘못된 날짜입니다.");
				}
			} else {
				alert("해당 시간 상영관의 다른 영화가 상영합니다.");
			}
		});
		
		function check_theater(theater, date, time) {
			<% for (ShowingDto i : showing) {%>
				if ("<%= i.getTheater_num() %>" == theater) {
					if ("<%= sdf.format(i.getShowing_date()) %>" == date + time) {
						return false
					}
				}
			<%}%>
			return true;
		}
	</script>
	
	<!-- Js Plugins -->
	<script src="tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="tmplt/js/bootstrap.min.js"></script>
	<script src="tmplt/js/player.js"></script>
	<script src="tmplt/js/mixitup.min.js"></script>
	<script src="tmplt/js/jquery.slicknav.js"></script>
	<script src="tmplt/js/owl.carousel.min.js"></script>
	<script src="tmplt/js/main.js"></script>
</body>

</html>