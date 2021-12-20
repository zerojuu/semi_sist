
<%@page import="java.util.List"%>
<%@page import="review.reviewDao"%>
<%@page import="review.reviewDto"%>
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
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>


    <!-- JS -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	

	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    
	<!-- 슬라이드쇼 css -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
.mySlides {display:none; width: 100%; height: 100%;}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}
</style>

<!-- 마우스오버 css -->
<style type="text/css">
body {margin: 0}

figure {transition: opacity 0.2s; position: relative; margin: 0;}

figure img {width: 100%; height: 100%}

figure figcaption {color: #fff;bottom: 70px; opacity: 0;position: absolute; text-align: center; width: 100%;transition: all .3s ease;}

figure .w3-content {opacity: 1;transition: all 0.3s ease 0s;overflow: hidden}

figure:hover .w3-content {background-color: #000}

figure:hover img {transform: scale(1.1, 1.1);transition: all .3s ease;opacity: 0.15;cursor: url("https://hcode.b-cdn.net/wp-content/themes/h-code/assets/images/icon-zoom-white.png")}

figure:hover figcaption {opacity: 1;transition: all .3s ease; }
</style>

<!--이벤트 스와이퍼 css  -->

<style type="text/css">
#divTopArea{
	margin: 100px;
}
.event-swiper img{
	border-radius: 50px;
}
.event-slider .event-util button {
    display: block;
    float: left;
    height: 12px;
    margin: 0 0 0 12px;
    padding: 0;
    border: 0;
    font-size: 0;
    line-height: 0;
    background-color: transparent;
}
.event-slider .event-control button {
    display: block;
    position: absolute;
    top: 1000px;
    z-index: 2;
    width: 50px;
    height: 50px;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 0;
    line-height: 0;
    border-radius: 100%;
    box-shadow: 4px 4px 10px 0 rgb(45 45 45 / 30%);
    background-color: transparent;
    background-position: 0 0;
    background-repeat: no-repeat;
}

.event-prev
{
left: 30px;
width: 7px;
background-image: url("event/event_img/btn-prev.png");
}
.event-next
{
right: 30px;
width: 7px;
background-image: url("event/event_img/btn-next.png");
} 
</style>
<style type="text/css">

.pre-review{

font-family: 'Nanum Myeongjo', serif;
font-size: 10pt;
color: #fff;
}
.pre-review img{
	width: 200px;
	height: 280px;
}

#review1, #review2, #review3{
float:left;
text-align: center;
padding:20px;
border: 1px dotted #fff;
border-radius:30px;
margin-top:20px;
margin-right:80px;
width: 300px;
height: 420px;
}
#more{
color:#fff;
float:right; 
font-size: 12pt;
margin-right: 100px;
font-weight: bold;
}

</style>
</head>
<body>

<!-- 슬라이드쇼 바디 -->
<figure>
<section class="hero">
  <div class="container">
    <div class="w3-content w3-display-container" style="max-width:500px; max-height: 700px;">
      <a href="index.jsp?main=reserve/reservation.jsp?movie_num=20218052"><img class="mySlides" src="./tmplt/img/20218052.jpeg"></a>
      <a href="index.jsp?main=reserve/reservation.jsp?movie_num=20218256"><img class="mySlides" src="./tmplt/img/20218256.jpeg" ></a>
      <a href="index.jsp?main=reserve/reservation.jsp?movie_num=20210865"><img class="mySlides" src="./tmplt/img/20210865.jpeg" ></a>
      <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
      <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
      <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
      <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
      <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
      <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
      </div>
    </div>
  </div>
</section>
<figcaption><h1 style="color: #fff;" id="fig"></h1></figcaption>
</figure>

<!-- 마우스오버 -->

	<!-- Js Plugins -->
	<script src="tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="tmplt/js/bootstrap.min.js"></script>
	<script src="tmplt/js/player.js"></script>
	<script src="tmplt/js/jquery.nice-select.min.js"></script>
	<script src="tmplt/js/mixitup.min.js"></script>
	<script src="tmplt/js/jquery.slicknav.js"></script>
	<script src="tmplt/js/owl.carousel.min.js"></script>
	<script src="tmplt/js/main.js"></script>


<!--이벤트 스와이퍼  -->

<div id="divTopArea" class="event-slider">
<h3 style="color: white">진행중인 이벤트</h3>
	<div class="inner-wrap">	
			<div class="event-pagination"></div>
				<div class="event-count">
					<!-- <span title="현재 페이지" class="active" >0</span> 
					<span title="전체 페이지" class="total">0</span> -->
				</div>
			<div class="event-util">
				<button type="button" class="pause on">일시정지</button>
				<button type="button" class="play">자동재생</button>
			</div>
			<div class="event-control">
				<button type="button" class="event-prev">이전 이벤트 보기</button>
				<button type="button" class="event-next">다음 이벤트 보기</button>
			</div>
	</div>

<div class="event-swiper">
	<div class="swiper-wrapper">
	<!-- 반복 -->
	<div class="cell swiper-slide">
		<a href="#"  data-netfunnel="N" class="eventBtn">
		<p class="img"><img src="event/event_img/event1-thumbnail.png" onerror="noImg(this);"></p>
		</a>
	</div>
	<div class="cell swiper-slide">
		<a href="#" data-netfunnel="N" class="eventBtn">
		<p class="img"><img src="event/event_img/event2-thumbnail.png" onerror="noImg(this);"></p>
		</a>
	</div>
	<div class="cell swiper-slide">
		<a href="#" data-netfunnel="N" class="eventBtn">
		<p class="img"><img src="event/event_img/event3-thumbnail.png" onerror="noImg(this);"></p>
	</a>
	</div>
	<div class="cell swiper-slide">
		<a href="#" data-netfunnel="N" class="eventBtn">
		<p class="img"><img src="event/event_img/event4-thumbnail.png" onerror="noImg(this);"></p>
		</a>
	</div>
	</div>
</div>
</div>
<%


reviewDao dao = new reviewDao();
List<reviewDto> list = dao.getList(1,3);

%>
<a href="index.jsp?main=review/reviewlist.jsp" id="more">더보기 ></a>
<div class="pre-review">
<h3 style="color: white">관람 후기</h3>

<div id="review1">
<img  src="tmplt/img/20218256.jpeg">
<%
	reviewDto dto = list.get(0);
%>
<br><br>
<a><br>"<%=dto.getContent() %>"</a>
<br><br>
❤︎ <%=dto.getLikes() %>likes
</div>


<div id="review2">
<img  src="tmplt/img/20218052.jpeg">
<%
		
	dto = list.get(1);
%>
<br><br>
<a><br>"<%=dto.getContent() %>"</a>
<br><br>
❤︎ <%=dto.getLikes() %>likes
</div>

<div id="review3">
<img  src="tmplt/img/20191061.jpeg">
<%
		
	dto = list.get(2);
%>
<br><br>
<a><br>"<%=dto.getContent() %>"</a>
<br><br>
❤︎ <%=dto.getLikes() %>likes
</div>

</div>

</body>


<!-- 슬라이드쇼 스크립트 -->
<script>
var slideIndex = 1;
showDivs(slideIndex);


function plusDivs(n) {
  showDivs(slideIndex += n);
  
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>

<!-- 이벤트 스와이퍼 스크립트  -->
<script type="text/javascript">


$(function(){
	if( $('.event-swiper').length > 0 ){
		var event_swiper = new Swiper('.event-swiper', {
			autoplay: {
				delay: 2000,
				disableOnInteraction: true,
			},
			loop : true,
			slidesPerView: 2,
			spaceBetween: 40,
			pagination: {
				el: '.event-pagination',
				clickable: false,
			},
			navigation : {
				prevEl : '.event-prev',
				nextEl : '.event-next',
			},
			ally : {
				enabled : true
			}
		});

		// swiper 전체 count
		all_count = $('.event-swiper .cell').length;
	
		dupli_count = $('.event-swiper .swiper-slide-duplicate').length;
		real_count = all_count - dupli_count;

		if('9' > 0) $('.event-slider .event-count .active').text(event_swiper.realIndex + 1);
		$('.event-slider .event-count .total').text(real_count)

		// 이벤트 배너 1개 이하일 경우 좌우 버튼 숨기기
		if(real_count < 2 ){

			$('.event-prev').hide();
			$('.event-next').hide();

			$('.swiper-slide-duplicate').hide(); //스와이프용 duplicate 이미지 숨기기
		}

		// 현재 활성화된 swiper
		event_swiper.on('slideChange', function(){
			if('9' > 0) $('.event-slider .event-count .active').text(event_swiper.realIndex + 1);
		});

		// 자동실행 정지
		$('.event-util .pause').on('click', function(){
			event_swiper.autoplay.stop();

			$(this).removeClass('on');
			$('.event-util .play').addClass('on').focus();
		});

		// 자동실행 시작
		$('.event-util .play').on('click', function(){
			event_swiper.autoplay.start();

			$(this).removeClass('on');
			$('.event-util .pause').addClass('on').focus();
		});

		// 좌우 이동시 자동실행 정지됨
		$(document).on('click','.event-prev, .event-next', function(){
			$('.event-util .pause').removeClass('on');
			$('.event-util .play').addClass('on');
		});
		$(window).resize(function(){
			event_swiper.update();
		}).resize();
	}
});

</script>
</html>