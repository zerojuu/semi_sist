<%@page import="javax.swing.text.html.parser.DTD"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <style type="text/css">
    	.boxoffice {
    		position: relative;
    		left: 5%;
    		top: 10px;
    		width: 100%;
    		height: auto;
    		text-align: center;
    		margin-top: 0;
    	}
    	
    	input {
    		margin-left: 10px;
    		margin-right: 10px;
    		height: 30px;
    	}
    	
    	th { 
    		font-size: 10pt;
    	}
    	
    	td {
			font-size: 8pt;
			padding: 0;
		}
		
		.btn {
			margin: 0;
		}
		
		.container {
    		margin-bottom: 100px;
    	}
    </style>
    
    <%
    request.setCharacterEncoding("utf-8");
 	// ???????????? ??????
	String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");					//???????????????
	String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");		//??????row???
	String movieNm = request.getParameter("movieNm")==null?"":request.getParameter("movieNm");						//?????????
	String directorNm = request.getParameter("directorNm")==null?"":request.getParameter("directorNm");				//?????????
	String openStartDt = request.getParameter("openStartDt")==null?"":request.getParameter("openStartDt");			//???????????? ???????????? ( YYYY )
	%>
    
    <script type="text/javascript">
	    $(function(){
	    	var insertUrl = "";
	    	var kobisService = new KobisOpenAPIRestService("1498e677bdca66c811a03a506cc6248b");
	    	var resJson = null;
	    	try{
	    		resJson = kobisService.getMovieList(true,{curPage:"<%=curPage%>",itemPerPage:"<%=itemPerPage%>",movieNm:"<%=movieNm%>",directorNm:"<%=directorNm%>",openStartDt:"<%=openStartDt%>",openEndDt:"",prdtStartYear:"",prdtEndYear:"",repNationCd:"",movieTypeCdArr:""});
			} catch (e) {
				resJson = $.parseJSON(e.message);
			}
			if (resJson.failInfo) {
				alert(resJson.failInfo.message);
			} else {
				var movieList = resJson.movieListResult.movieList;
				var totCnt = resJson.movieListResult.totCnt;
	
				for (var i = 0; i < movieList.length; i++) {
					var movie = movieList[i];
	
					var appendStr = "<tr><td>" + movie.movieNm
							+ "</td><td>" + movie.movieNmEn
							+ "</td><td>" + movie.prdtYear
							+ "</td><td>" + movie.openDt
							+ "</td><td>" + movie.repNationNm
							+ "</td>";
	
					//??????
					appendStr += "<td>";
					if (movie.directors != null
							&& movie.directors != "") {
						for ( var dir in movie.directors) {
							appendStr += movie.directors[dir].peopleNm;
						}
					}
					appendStr += "</td>";
					
					insertUrl = "index.jsp?main=admin/insertMovie.jsp?code=" + movie.movieCd;
					appendStr += "<td><a href='" + insertUrl +"' class='btn btn-info'>??????</button></td></tr>";
					$("#boxtab tbody").append(appendStr);
				}
			}
		});
	</script>
</head>

<body>
	<div class="container" style="padding: 0;">
		<div class="boxoffice">
			<h1><b style="color: white;">????????? ?????????</b></h1><br>
			<button class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/dailyBoxoffice.jsp'">?????? ??????????????? ????????????</button>
			<button class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/allMovie.jsp'">?????? ?????? ????????????</button>
			<button id="admin_btn" class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/setShowing.jsp'">?????? ?????? ??????</button>
			<br><br><br>
			<b style="color: white;">??????????????? :</b><input type="text" name="curPage" value="<%=curPage %>">
			<b style="color: white;">?????? ????????????:</b><input type="text" name="itemPerPage" value="<%=itemPerPage %>">
			<b style="color: white;">?????????:</b><input type="text" name="directorNm" value="<%=directorNm %>">		
			<b style="color: white;">?????????:</b><input type="text" name="movieNm" value="<%=movieNm %>">
			<b style="color: white;">????????????:</b><input type="text" name="openStartDt" value="<%=openStartDt %>">
			<button id="getMovie" class="btn btn-warning">??????</button>
			<table class="table table-bordered" id="boxtab" style="color: white; font-size: 16pt; height: auto;">
				<thead>
					<tr>
						<th rowspan="2">?????? ??????</th><th>????????????</th><th><th>?????????</th><th>??????</th><th>?????????</th><th>DB</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
		$("input").keydown(function(key) {
			if (key.keyCode == 13) {
				location.href = "index.jsp?main=admin/allMovie.jsp?curPage=" + $("input[name=curPage]").val() + "&itemPerPage=" + $("input[name=itemPerPage]").val() + "&directorNm=" + $("input[name=directorNm]").val() + "&movieNm=" + $("input[name=movieNm]").val() + "&openStartDt=" + $("input[name=openStartDt]").val();
			}
		});
		
		$("#getMovie").on("click", function(){
			location.href = "index.jsp?main=admin/allMovie.jsp?curPage=" + $("input[name=curPage]").val() + "&itemPerPage=" + $("input[name=itemPerPage]").val() + "&directorNm=" + $("input[name=directorNm]").val() + "&movieNm=" + $("input[name=movieNm]").val() + "&openStartDt=" + $("input[name=openStartDt]").val();
		});
	</script>
	
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