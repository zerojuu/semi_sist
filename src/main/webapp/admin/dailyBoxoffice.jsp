<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.Date"%>
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
    		height: 600px;
    		text-align: center;
    		padding: 0;
    		margin: 0;
    	}
    	
    	#result {
    		text-align: center;
    		margin-bottom: 10px;
    	}
    	
    	.container {
    		margin-bottom: 100px;
    	}
    </style>
    
    <%
    // ?????? ??????
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    Calendar cal = Calendar.getInstance();
    cal.setTime(new Date());
    cal.add(Calendar.DATE, -1);
    String day = sdf.format(cal.getTime());
    
    if (request.getParameter("day") != null) {
    	day = request.getParameter("day");
    }
    
    
    
    // ???????????? ??????
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
	String targetDt = request.getParameter("day") == null ? sdf2.format(cal.getTime()) : request.getParameter("day").replace("-", "");			//????????????

	// ?????????
	String key = "1498e677bdca66c811a03a506cc6248b";
	// KOBIS ?????? API Rest Client??? ?????? ??????
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// ?????? ??????????????? ????????? ?????? (boolean isJson, String targetDt, String itemPerPage,String multiMovieYn, String repNationCd, String wideAreaCd)
    String dailyResponse = service.getDailyBoxOffice(true,targetDt,"10","","","");
 
	// JSON
    ObjectMapper mapper = new ObjectMapper();
    HashMap<String,Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
    
    request.setAttribute("dailyResult",dailyResult);
    %>
</head>

<body>
	<div class="container" align="center">
		<div class="boxoffice" align="center">
			<h1><b style="color: white;">????????? ?????????</b></h1><br><br><br><br>
			<button id="admin_btn" class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/dailyBoxoffice.jsp'">?????? ??????????????? ????????????</button>
			<button id="admin_btn" class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/allMovie.jsp'">?????? ?????? ????????????</button>
			<button id="admin_btn" class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/setShowing.jsp'">?????? ?????? ??????</button>
			<br><br><br>
			<b style="color: white;">?????? ??????</b><input type="date" id="daily" value="<%= day %>">
			<div id="result" align="center">
				<table class="table table-bordered" style="color: white; font-size: 12pt; width: 800px; height: auto;">
					<tr>
						<th>??????</th><th>??????</th><th>?????????</th>
					</tr>
					<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
						<tr>
							<td><c:out value="${boxoffice.rank }"/></td><td><c:out value="${boxoffice.movieNm }"/></td><td><c:out value="${boxoffice.openDt }"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<script type="text/javascript">
			$("#daily").change(function(){
				var date1 = new Date($("#daily").val());
				var date2 = new Date();
				date2.setDate(date2.getDate() - 1);
				if (date1 > date2){
					alert("????????? ???????????????. (?????? ?????????????????? ????????? ???????????? ?????????.)");
				} else {
					location.href = "index.jsp?main=admin/dailyBoxoffice.jsp?day=" + $("#daily").val();
				}
			});
			
			$("#setMain").on("click", function() {
				// ?????? ????????? ?????????????????? ????????? DAO ??????
			});
		</script>
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