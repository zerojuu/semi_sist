<%@page import="movies.MoviesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="movies.MoviesDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>  
     
<form action="reviewaction.jsp" method="post" class="form-inline">
  <table class="table table-bordered" style="width: 600px; margin-left: 50px; margin-top: 50px;">
  <caption style="margin-left: 280px;font-size: 1.5em;"><b>관람평</b></caption>
  
  <%
  MoviesDto mdto=new MoviesDto();
  %>
  <%
	ArrayList<MoviesDto> movies = new MoviesDao().getAllDatas();
	%>
<tr>
    <th width="100"><span class="glyphicon glyphicon-film" style="margin-left: 30px;"></span></th>
    <td>
      <select id="titles" class="form-select sel" name="movie_num">
				<%for (MoviesDto i : movies) {%>
					<option value="<%= i.getMovie_num() %>"><%= i.getKr_title() %></option>
				<%} %>
			</select>
    </td>
  </tr>
   
  <tr>
    <th width="100"><span class="glyphicon glyphicon-list" style="margin-left: 30px; margin-top: 10px;"></span></th>
    <td>
      <input type="text" class="form-control" required="required" autofocus="autofocus" name="subject" style="width: 300px;">
    </td>
  </tr>
  
  <tr>
    <th width="100"><span class="glyphicon glyphicon-pencil" style="margin-left: 30px; margin-top: 130px;"></span></th>
    <td>
      <textarea style="width: 400px; height: 300px;" name="content" required="required" class="form-control"></textarea>
    </td>
  </tr>
  
  <tr>
  <td colspan="2" align="center">
    <button type="submit" class="btn btn-default">등록</button>
  </td>
  </tr>
  </table>
</form>
</body>
</html>