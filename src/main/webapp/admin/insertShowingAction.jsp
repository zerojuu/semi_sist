<%@page import="seat.SeatDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="seat.SeatDto"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="showing.ShowingDto"%>
<%@page import="showing.ShowingDao"%>
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
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	Timestamp show_date = Timestamp.valueOf(request.getParameter("showing_date") + ":00");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	ShowingDao dao = new ShowingDao();
	ShowingDto dto = new ShowingDto();
	
	dto.setMovie_num(request.getParameter("movie_num"));
	dto.setShowing_date(show_date);
	dto.setTheater_num(request.getParameter("theater_num"));
	
	dao.insertShowing(dto);
	
	SeatDto seat_dto = new SeatDto();
	String show_num = "";
	ArrayList<ShowingDto> showing = new ShowingDao().getAllDatas();
	for (ShowingDto i : showing) {
		if (sdf.format(i.getShowing_date()).equals(sdf.format(show_date)) && i.getTheater_num().equals(request.getParameter("theater_num"))) {
			show_num = i.getShow_num();
		}
	}
	seat_dto.setShow_num(show_num);
	seat_dto.setTheater_num(request.getParameter("theater_num"));
	new SeatDao().insertSeat(seat_dto);
	%>
</body>
	<script type="text/javascript">
		location.href = "index.jsp?main=admin/setShowing.jsp";
	</script>
</html>