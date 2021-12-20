<%@page import="showing.ShowingDto"%>
<%@page import="showing.ShowingDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" name='viewport' content='width=device-width, initial-scale=1.0'>
	<title>Document</title>
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String movie_num = request.getParameter("movie_num");
	String show_num = request.getParameter("show_num");
	Timestamp show_date;
	if (request.getParameter("showing_date").length() == 16) {
		show_date = Timestamp.valueOf(request.getParameter("showing_date") + ":00");
	} else {
		show_date = Timestamp.valueOf(request.getParameter("showing_date"));
	}
	
	ShowingDao dao = new ShowingDao();
	ShowingDto dto = new ShowingDto();
	
	dto.setShow_num(show_num);
	dto.setMovie_num(movie_num);
	dto.setShowing_date(show_date);
	dto.setTheater_num(request.getParameter("theater_num"));
	
	dao.updateShowing(dto);
	%>
</body>
	<script type="text/javascript">
		location.href = "index.jsp?main=admin/setShowing.jsp";
	</script>
</html>