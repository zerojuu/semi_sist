<%@page import="reserve.ReserveDao"%>
<%@page import="reserve.ReserveDto"%>
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
	
	String user_num = request.getParameter("user_num");
	String show_num = request.getParameter("show_num");
	String theater_num = request.getParameter("theater_num");
	String seat_id = request.getParameter("seat_id");
	
	ReserveDto dto = new ReserveDto();
	dto.setSeat_id(seat_id);
	dto.setShow_num(show_num);
	dto.setTheater_num(theater_num);
	dto.setUser_num(user_num);
	new ReserveDao().insertReserve(dto);
	%>
</body>
	<script type="text/javascript">
		alert("예매되었습니다.");
		location.href = "index.jsp?main=layout/main.jsp";
	</script>
</html>