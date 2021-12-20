<%@page import="java.util.Date"%>
<%@page import="movies.MoviesDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="movies.MoviesDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    // 파라메터 설정	
	String movieCd = request.getParameter("code");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
	// 발급키
	String key = "1498e677bdca66c811a03a506cc6248b";	
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
	String movieResponse = service.getMovieInfo(true, movieCd);
	// JSON
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(movieResponse);
	
	JSONObject result = (JSONObject) obj;
	result = (JSONObject) result.get("movieInfoResult");
	result = (JSONObject) result.get("movieInfo");
	
	JSONArray json_list = (JSONArray)result.get("directors");
	JSONObject json = (JSONObject)json_list.get(0);
	
    MoviesDto dto = new MoviesDto();
    dto.setDirector((String)json.get("peopleNm"));
    dto.setEn_title((String)result.get("movieNmEn"));
    
    json_list = (JSONArray)result.get("genres");
	json = (JSONObject)json_list.get(0);
    dto.setGenre((String)json.get("genreNm"));
    
    dto.setKr_title((String)result.get("movieNm"));
    dto.setMovie_num(movieCd);
    
    Date dt = sdf.parse((String)result.get("openDt"));
    dto.setOpenDate(dt);
    
    MoviesDao dao = new MoviesDao();
    dao.insertMovies(dto);
	%>

</body>
	<script type="text/javascript">
		location.href = "index.jsp?main=admin/adminConfig.jsp";
	</script>
</html>