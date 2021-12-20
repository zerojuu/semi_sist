<%@page import="org.codehaus.jackson.annotate.JsonTypeInfo.Id"%>
<%@page import="Sign.SignDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
//프로젝트 경로구하기
String root=request.getContextPath();

%>
<head>
	<meta charset="UTF-8" name='viewport' content='width=device-width, initial-scale=1.0'>
	
	<!-- jQuery -->
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- TITLE -->
	<title>SIST MOVIE</title>
	
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
    <%
    request.setCharacterEncoding("utf-8");
    
    String main="./layout/main.jsp";
    if (request.getParameter("main") != null) {
    	main = request.getParameter("main");
    } else {
    	main = "./layout/main.jsp";
    }
    %>
</head>

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="./index.jsp?main=layout/main.jsp">
                            <b style="font-size: x-large;">SIST MOVIE</b>
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="./index.jsp?main=layout/main.jsp">Home</a></li>
                                <li><a href="./index.jsp?main=reserve/reservation.jsp">영화 예매 <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./index.jsp?main=movie/movieList.jsp">영화 목록</a></li>
                                        <li><a href="./index.jsp?main=reserve/reservation.jsp">예매</a></li>
                                    </ul>
                                </li>
                                <li><a href="./index.jsp?main=review/reviewlist.jsp">후기</a></li>
                                <li><a href="./index.jsp?main=event/eventlist.jsp">이벤트</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                    	<a id="admin" style="visibility: hidden;" href="./index.jsp?main=admin/adminConfig.jsp" class="search-switch"><span class="glyphicon glyphicon-cog"></span></a>
                        
                        <!-- 로그인 상태면 회원정보수정 로그아웃상태라면 회원가입으로 보내기 시작-->
                        <%
                        //로그인중인지..세션값 얻기
                        String loginok2=(String)session.getAttribute("loginok");
                       

                        //아이디 얻기
                        String myid2=(String)session.getAttribute("myid");

                        SignDao db=new SignDao();
                        String hnum=db.getNum(myid2);
                        if(loginok2==null){%>
                        <a href="./index.jsp?main=sign/signup/signupform.jsp"><span class="icon_profile"></span></a>
                        <%}else{%>
                        <a href="./index.jsp?main=sign/memberupdate/updateform.jsp?hnum=<%=hnum%>"><span class="icon_profile"></span></a>
                        <%}
                        %>
                        <!-- 로그인 상태면 회원정보수정 로그아웃상태라면 회원가입으로 보내기 종료-->
                        
                        
                        <!-- 로그인,로그아웃 버튼 부분 시작 -->
                        <span>
                        <%
                        //로그인중인지..세션값 얻기
                        String loginok=(String)session.getAttribute("loginok");

                        //아이디 얻기
                        String myid=(String)session.getAttribute("myid");

                        if(loginok==null){%>
                        <button type="button" class="btn btn-success" style="width: 55px; height: 30px;"
                        onclick="location.href='index.jsp?main=sign/login/loginform.jsp'">LOG IN</button>
                        <%}else{%>
                        <button type="button" class="btn btn-danger" style="width: 55px height: 30px;"
                        onclick="location.href='sign/login/logoutaction.jsp'">LOG OUT</button>
                        <%}%>
                        </span>
                        <!-- 로그인,로그아웃 버튼 부분 끝-->
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
        <script type="text/javascript">
    		// 관리자 로그인 확인
    		if ("<%= myid %>" == "admin") {
    			$("#admin").css("visibility", "visible");
    		} 
    	</script>
    </header>
    <!-- Header End -->

    <!-- Main Section -->
    <div class="container">
    	<div>
    		<jsp:include page="<%= main %>"></jsp:include>
    	</div>
    </div>
    
    <!-- Footer Start -->
    <footer class="footer">
		<div style="color: white;">
			서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 | Tel_02-3482-4632~5 | Fax_02-3482-4636<br>
			사업자번호_214-85-29296 | 대표_노경한 | 개인정보처리관리책임자_장일규<br>
			통신판매업신고번호 제 833호 COPYRIGHT © Sist Movie, Inc. All rights reserved<br>
		</div>
	</footer>
    <!-- Footer End -->
    
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