<%@page import="showing.ShowingDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="reserve.ReserveDao"%>
<%@page import="reserve.ReserveDto"%>
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
	
	String reserve_num = request.getParameter("reserve_num");
	ReserveDao reserve_dao = new ReserveDao();
	ReserveDto reserve_dto = reserve_dao.getData(reserve_num);
	
	Timestamp show_date = new ShowingDao().getData(reserve_dto.getShow_num()).getShowing_date();
	Timestamp now = new Timestamp(System.currentTimeMillis());
	
	if (show_date.before(now)) {
		%>
		<script type="text/javascript">
			alert("상영 기간이 지난 예매입니다.");
			location.href = "index.jsp?main=reserve/myReserveList.jsp";
		</script>
		<%
	} else {
		reserve_dao.deleteReserve(reserve_num);
		%>
		<script type="text/javascript">
			location.href = "index.jsp?main=reserve/myReserveList.jsp";
		</script>
		<%
	}
	%>
	
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