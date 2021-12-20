<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title> 

    <!-- 구글로그인api -->
    <meta name ="google-signin-client_id" content="187157192206-alod541rdhu926fhjk4him3mh0ssgici.apps.googleusercontent.com">
    
    	<%
	//프로젝트 경로구하기
	String root=request.getContextPath();
	
	
	%>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=root %>/tmplt/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/style.css" type="text/css">

	<style type="text/css">
		th {
			font-family: 'Nanum Myeongjo';
			font-size: 11pt;
		}
		
		td {
			font-family: 'Nanum Myeongjo';
			font-size: 11pt;
		}
	</style>
</head>

</head>

<body>

    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Login</h3>
                        <form action="sign/login/loginaction.jsp" method="post" name="loginfrm">
                            <div class="input__item">
                                <input type="text" name="id" placeholder="id">
                                <span class="icon_profile"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" name="pass" placeholder="Password">
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn">Login Now</button>
                        </form>
                        <a href="#" class="forget_pass">Forgot Your Password?</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>Dont’t Have An Account?</h3>
                        <a href="<%=root %>/index.jsp?main=sign/signup/signupform.jsp" class="primary-btn">Register Now</a>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <!-- <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Log in With
                                Facebook</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Log in 	With Twitter</a>
                                </li> -->
                                <li id="GgCustomLogin"><a href="javascript:void(0);" class="google"><i class="fa fa-google"></i> Log in With Google</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->

    <!-- Js Plugins -->
    <script src="<%=root %>/tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="<%=root %>/tmplt/js/bootstrap.min.js"></script>
	<script src="<%=root %>/tmplt/js/player.js"></script>
	<script src="<%=root %>/tmplt/js/jquery.nice-select.min.js"></script>
	<script src="<%=root %>/tmplt/js/mixitup.min.js"></script>
	<script src="<%=root %>/tmplt/js/jquery.slicknav.js"></script>
	<script src="<%=root %>/tmplt/js/owl.carousel.min.js"></script>
	<script src="<%=root %>/tmplt/js/main.js"></script>

<!-- 구글 로그인 api 시작 -->
<script>
//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyAm92en8oGDzwXSHLxLX4Q-cgJe2Nl_wwo', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
		var profile = googleUser.getBasicProfile();
        var gname=profile.getName();
		
        location.href="<%=root%>/index.jsp?main=sign/login/googleaction.jsp?gname="+gname;
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<!-- 구글 로그인 api끝 -->    
    
</body>
</html>