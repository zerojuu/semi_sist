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
    // 날짜 포맷
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    Calendar cal = Calendar.getInstance();
    cal.setTime(new Date());
    cal.add(Calendar.DATE, -1);
    String day = sdf.format(cal.getTime());
    
    if (request.getParameter("day") != null) {
    	day = request.getParameter("day");
    }
    
    
    
    // 파라메터 설정
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
	String targetDt = request.getParameter("day") == null ? sdf2.format(cal.getTime()) : request.getParameter("day").replace("-", "");			//조회일자

	// 발급키
	String key = "1498e677bdca66c811a03a506cc6248b";
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// 일일 박스오피스 서비스 호출 (boolean isJson, String targetDt, String itemPerPage,String multiMovieYn, String repNationCd, String wideAreaCd)
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
			<h1><b style="color: white;">관리자 페이지</b></h1><br><br><br><br>
			<button id="admin_btn" class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/dailyBoxoffice.jsp'">일별 박스오피스 가져오기</button>
			<button id="admin_btn" class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/allMovie.jsp'">영화 목록 가져오기</button>
			<button id="admin_btn" class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/setShowing.jsp'">상영 정보 설정</button>
			<br><br><br>
			<b style="color: white;">날짜 선택</b><input type="date" id="daily" value="<%= day %>">
			<div id="result" align="center">
				<table class="table table-bordered" style="color: white; font-size: 12pt; width: 800px; height: auto;">
					<tr>
						<th>순위</th><th>제목</th><th>개봉일</th>
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
					alert("잘못된 날짜입니다. (일별 박스오피스는 전날을 기준으로 합니다.)");
				} else {
					location.href = "index.jsp?main=admin/dailyBoxoffice.jsp?day=" + $("#daily").val();
				}
			});
			
			$("#setMain").on("click", function() {
				// 메인 페이지 데이터베이스 만들고 DAO 구현
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