<%@page import="org.eclipse.jdt.internal.compiler.env.IGenericField"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="movies.MoviesDao"%>
<%@page import="movies.MoviesDto"%>
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
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	
	MoviesDao dao = new MoviesDao();
	
	int pageLength = 5;
	int totalRows = dao.getTotalRows();
	int totalPages = totalRows % pageLength == 0 ? totalRows / pageLength : (totalRows / pageLength) + 1;
	int cPage;
	String tempPage = request.getParameter("page");
	if (tempPage == null || tempPage.length() == 0) {
		cPage = 1;
	}
	 try {
		 cPage = Integer.parseInt(tempPage);
	 } catch (NumberFormatException e) {
		 cPage = 1;
	 }
	 
	 int currentBlock = cPage % pageLength == 0 ? cPage / pageLength : (cPage / pageLength) + 1;
	 int startPage = (currentBlock - 1) * pageLength + 1;
	 int endPage = startPage + pageLength - 1;
	 if (endPage > totalPages) {
		 endPage = totalPages;
	 }
	 
	 // 전달된 인자값이 총 페이지보다 클경우
	 if (cPage > totalPages) {
		 cPage = 1;
	 }
	 
	 int start = (cPage - 1) * pageLength;
	 
	 ArrayList<MoviesDto> list = dao.getList(start, pageLength);
	 %>

	<div class="container" align="center" style="margin-top: 10px; margin-left: 50px;">
		<table class="table table-bordered" style="width: 800px;">
			<caption style="text-align: center; color: white; font-size: 30pt; caption-side: top;">영화 목록</caption>
			<thead class="thead-light">
				<tr>
					<th>#</th><th>영화 제목</th><th>장르</th><th>개봉일</th><th></th>
				</tr>
			</thead>
			<tbody style="color: white; font-size: 10pt;">
				<%
				if (list.size() != 0) {
					int pageNum = totalRows - (cPage - 1) * pageLength;
					for (MoviesDto i : list) {%>
						<tr>
							<td><%= pageNum-- %></td>
							<td>
								<a href="index.jsp?main=movie/movieDetail.jsp?movie_num=<%= i.getMovie_num() %>">
									<b><%= i.getKr_title() %> (<%= i.getEn_title() %>)</b>
								</a>
							</td>
							<td>
								<%= i.getGenre() %>
							</td>
							<td>
								<%= sdf.format(i.getOpenDate()) %>
							</td>
							<td>
								<button onclick="" class="btn btn-info">예매하기</button>
							</td>
						</tr>
					<%}
				} else {%>
					<tr><td colspan="4" align="center">데이터가 존재하지 않습니다.</td></tr>
				<%}
				%>
			</tbody>
		</table>
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center">
				<%if (startPage == 1) {%>
					<li class="page-item disabled">
						<a class="page-link" href="#" tabindex="-1" aria-disable="true">Previous</a>
					</li>
				<%} else {%>
					<li class="page-item"><a class="page-link" href="index.jsp?main=movie/movieList.jsp?page=<%= startPage - 1 %>" tabindex="-1" aria-disabled="true">Previous</a></li>
				<%}
				for (int i = startPage; i <= endPage; i++) {%>
					<li class="page-item">
						<a class="page-link" href="index.jsp?main=movie/movieList.jsp?page=<%= i %>"><%= i %></a>
					</li>
				<%}
				if (totalPages == endPage) { %>
					<li class="page-item disabled">
						<a class="page-link" href="index.jsp?main=movie/movieList.jsp?page=<%= endPage + 1 %>">Next</a>
					</li>
				<%}%>
			</ul>
		</nav>
	</div>
	
	
	
	
	
	<!-- Js Plugins -->
    <script src="tmplt/js/KobisOpenAPIRestService.js"></script>
	<script src="tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="tmplt/js/bootstrap.min.js"></script>
	<script src="tmplt/js/player.js"></script>
	<script src="tmplt/js/mixitup.min.js"></script>
	<script src="tmplt/js/jquery.nice-select.min.js"></script>
	<script src="tmplt/js/jquery.slicknav.js"></script>
	<script src="tmplt/js/owl.carousel.min.js"></script>
	<script src="tmplt/js/main.js"></script>
</body>

</html>