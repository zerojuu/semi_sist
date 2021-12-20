<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="event.eventDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="event.eventDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">


body,div,ul,li{

margin:0; 
padding:0;
}

ul,li {
list-style:none;
}

.tab{float:left; }
.tabnav{font-size:0; border:1px solid #ddd; border-top:none; border-right: none;  width:1060px;}
.tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd; */}
.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:100%;  border-top: 1px solid #fff;  */}
.tabnav li a.active:before{ height:2px; background:#e63437; width:100%; border:none;}
.tabnav li a.active{border-bottom:1px solid #0d0c27;}
.tabnav li a{ position:relative; display:block;/*  background: #f8f8f8; */ color: #fff; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
.tabnav li a:hover,
.tabnav li a.active{/* background:#fff; */ color:#e63437; }
.tabcontent{padding: 20px;  border-top:none;}

</style>

<style type="text/css">

.list_ttl{
	margin: 0;
}

.thumnail_wrapper{
	text-align:center;
	margin: 20px 30px;
	width:280px;
	height:250px;
	border: 1px solid lightgray;
	border-radius: 30px; 
	background-color: white;
}

.thumbnail{
	padding: 0 0 0 0 px;
	border-radius: 30px 30px 0px 0px;
	border:0;
	width: 320px; 
	height: 160px; 
}

form.form1{
	float: right;
	margin-top: 30px;
}

#ttl{
	padding-left: 60px;
	color: #fff;
	margin-top: 30px;
}

.sideBanner {
 	position:absolute;
 	top:50%;
 	margin-top:-50px;
 	right:10px
}

.board-search{
    position: relative;
    display: inline-block;
    vertical-align: middle;
    width: 230px;
    height: 36px;
    margin: 0 ;
    padding: 0 0 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
        text-align: right;
    background:#fff; 
}
.input-text{
	cursor: text;
	border: 0;
	padding-left: 0;
	width: 180px;
	height: 25px;
}

.btn-search-input {
	overflow: hidden;
    width: 30px;
    height: 32px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
    text-indent: -9999px; 
    background: #fff url(event/event_img/btn-search-input.png) no-repeat center;
  
}

</style>


<script type="text/javascript">
$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	  });
	  
</script>


<title>Insert title here</title>
</head>

<body>
<%
//db선언
eventDao dao = new eventDao();

//전체 리스트 가져오기
ArrayList<eventDto> list = dao.getAllDatas();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

Date today = sdf.parse(sdf.format(new Date()));
Date tmp_date;
%>
<!--검색창-- >
<form method="post" action="index.jsp?main=event/search.jsp"  class="form1">
	<div class="board-search">
		<input type="text" class="input-text" placeholder="검색어를 입력하세요" name="searchWord" />
		<button class="btn-search-input" type="submit">검색</button>
	</div>
</form>


<!--  tab메뉴-->
<div class="tab">
   	<ul class="tabnav">
      	<li><a href="#tab01">진행중인 이벤트</a></li>
      	<li><a href="#tab02">종료된 이벤트</a></li>
   	</ul>
   	
   
<!--타이틀-->
<div style="font-size: 18pt;" id="ttl"><b>제휴할인</b></div>
   
   
    <div class="tabcontent">
      <div id="tab01">
     	<table>
     	<tr>
      	<%	
			for(int i=8; i>=0;i--){
				//i번째 dto얻기
				eventDto dto = list.get(i);
				tmp_date = sdf.parse(sdf.format(dto.getExpirydate()));
				if(tmp_date.compareTo(today) >= 0){
					
			%>
		<td>
		<br>
			<div class="thumnail_wrapper">
				<a href="index.jsp?main=event/content.jsp?num=<%=dto.getEvent_num()%>">
				<img alt="" src="event/event_img/<%=dto.getImg()%>" class="thumbnail" >
				</a>								
				<span style="text-align: center; font-size: 8pt" class="list_ttl">
				<b style="font-size: 10pt;"><%=dto.getSubject() %></b>
				<br>
				<br>
				<%=dto.getTerm() %>
				</span>
			</div>
		</td>
			<%
				if((i%3)==0){%>
				</tr><tr>	
				<%}%>
				<%
				}
			}
		%> 
		</tr>
	</table>
	</div>
 
 
 
      <div id="tab02">
			<table style="width:900px; text-align: center;">
				<tr>
					<%	
						for(int i=0;i<list.size();i++){
							//i번째 dto얻기
							eventDto dto = list.get(i);
							tmp_date = sdf.parse(sdf.format(dto.getExpirydate()));
							if(tmp_date.compareTo(today) < 0){
									
					%>
					
					<td>
						<br>
							<div class="thumnail_wrapper">
								<a href="index.jsp?main=event/content.jsp?num=<%=dto.getEvent_num()%>">
								<img alt="" src="event/event_img/<%=dto.getImg()%>" class="thumbnail" >
								</a>								
								<span style="text-align: center; font-size: 8pt" class="list_ttl">
								<b style="font-size: 11pt;"><%=dto.getSubject() %></b>
								<br>
								<br>
								<%=dto.getTerm() %>
								</span>
							</div>
					</td>
							<%
								if(i%3==0){%>
								</tr><tr>	
							<%}%>
							<%
								}
						}%>
				</tr>	
			</table>
     	 </div>
    </div>
 </div>


<div class="sideBanner">
    <img alt="" src="event/event_img/top.png">
 </div>

	
<script type="text/javascript">

var floatPosition = parseInt($(".sideBanner").css('top'));

$(window).scroll(function(){
	var currentTop = $(window).scrollTop();
	 var bannerTop = currentTop + floatPosition + "px";
	 
$(".sideBanner").stop().animate({
	"top" : bannerTop
},500);

$(".sideBanner").click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
})
	
})
</script>

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
