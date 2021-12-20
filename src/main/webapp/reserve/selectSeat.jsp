<%@page import="java.sql.Timestamp"%>
<%@page import="seat.SeatDao"%>
<%@page import="seat.SeatDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="showing.ShowingDao"%>
<%@page import="showing.ShowingDto"%>
<%@page import="theater.TheaterDao"%>
<%@page import="theater.TheaterDto"%>
<%@page import="java.util.ArrayList"%>
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
    <style type="text/css">
    	div.screen {
    		background-color: #ccc;
    		text-align: center;
    		width: 50%;
    		height: 20px;
    		margin-bottom: 100px;
    	}
    	
    	input[type="checkbox"] {
    		width: 30px;
    		height: 30px;
    		cursor: pointer;
    		margin: 10px 10px;
    	}
    </style>
    
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일 HH시 mm분");
	
	String movie_num = request.getParameter("movie_num");
	String theater_num = request.getParameter("theater_num");
	String show_date = request.getParameter("show_date");
	String user_num = request.getParameter("user_num");
	
	String show_num = "";
	ArrayList<ShowingDto> showing = new ShowingDao().getAllDatas();
	for (ShowingDto i : showing) {
		if (sdf.format(i.getShowing_date()).equals(show_date.substring(1, show_date.length() - 1)) && i.getTheater_num().equals(request.getParameter("theater_num"))) {
			show_num = i.getShow_num();
			break;
		}
	}
	
	ArrayList<SeatDto> list = new SeatDao().getSeats(show_num);
	int cnt = 0;
	%>
	
	<script type="text/javascript">
    	$(function() {
    		$("input[name='seat_id']").on("click", function() {
				let count = $("input:checked[name='seat_id']").length;
				let people_num = $("input[name=people_num]").val();
				if (count > people_num) {
					$(this).prop("checked", false);
					alert("인원 수 만큼만 선택 가능합니다.");
				}
			});
    		
    		$("input[name='people_num']").change(function() {
    			let count = $("input:checked[name='seat_id']").length;
				let people_num = $("input[name=people_num]").val();
				if (count > people_num) {
					alert("인원 수 만큼만 선택 가능합니다.");
					$("input[name='seat_id']").prop("checked", false);
				}
			})
    		
    		$("#reservation").submit(
    			function() {
    				var user_num = "<%= user_num %>";
    				var show_num = "<%= show_num %>";
    				var theater_num = "<%= theater_num %>";
    				var seat_id = "";
    				if ($("input[name='seat_id']:checked").length < $("input[name=people_num]").val()) {
    					alert("좌석을 선택해 주세요.");
    				} else {
    					if ($("input[name='seat_id']:checked").length > 1) {
    						$("input[name='seat_id']:checked").each(function (e) {
    							seat_id += $(this).val() + ":";
    						});
    						seat_id = seat_id.substring(0, seat_id.length - 1);
    					} else {
    						seat_id = $("input[name='seat_id']:checked").val();
    					}
    					location.href = "index.jsp?main=reserve/insertReserve.jsp?user_num=" + user_num + "&show_num=" + show_num + "&theater_num=" + theater_num + "&seat_id=" + seat_id;
    				}
				}		
    		);
    	});
    </script>
    
	<div class="container" align="center">
		<h2 style="color: white;">좌석 선택</h2>
		<form id="reservation" onsubmit="return false">
			<b style="color: white;">인원 수</b><input value="1" name='people_num' type="number" min="1" max="40"><br>
			<div class="screen">SCREEN</div>
			
			<% for (SeatDto i : list) { 
				if (i.isChk_seat()) {%>
					<% if (cnt >= 10) {%><br><% cnt = 0;} %>
					<input type="checkbox" name="seat_id" width="50px" height="50px" value="<%=i.getSeat_id()%>">
					<% cnt++; %>
				<%} else { %>
					<% if (cnt >= 10) {%><br><% cnt = 0;} %>
					<input type="checkbox" width="50px" height="50px" checked disabled>
					<% cnt++; %>
				<%}
			}%>
			<br>
			<input type="submit" value="예매하기">
		</form>
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