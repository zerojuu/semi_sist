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

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Sign Up</h3>
                        <form action="sign/signup/signupaction.jsp" name="signfrm" method="post" class="form-inline"
                        onsubmit="return check(this)">
                            <table class="table table-boredered" style=" width:1000px; background-color: white;" >
                              <tr>
                                <th style="width: 120px; height:30px; background-color: 	#F5F5F5;">이름</th>
                                <td style="background-color: white;">
                                <input type="text" name="name" placeholder="이름을 입력해주세요." required="required">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 70px; height:30px; background-color: 	#F5F5F5;">아이디</th>
                                <td style="background-color: white;">
                                  <input type="text" name="id" class="form-control" readonly="readonly">
                                  <button type="button" id="btnIdcheck">중복확인</button>
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 70px; height:30px; background-color: 	#F5F5F5;">비밀번호</th>
                                <td style="background-color: white;">
                                  <input type="password" name="pass" placeholder="비밀번호를 입력해주세요." required="required">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 70px; height:30px; background-color: 	#F5F5F5;">비밀번호 확인</th>
                                <td style="background-color: white;">
                                <input type="password" name="pass2" placeholder="비밀번호를 재입력해주세요." required="required">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 70px; height:30px; background-color: 	#F5F5F5;">생년월일</th>
                                <td style="background-color: white;">
                                <input type="date" name="birth">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 70px; height:30px; background-color: 	#F5F5F5;">전화번호</th>
                                <td style="background-color: white;"><input type="text" name="hp" placeholder="전화번호"></td>
                              </tr>
                              
                              <tr>
                              <th width="70px;" style="background-color: #F5F5F5;">이메일</th>
                              <td>
                                <input type="text" name="email1" class="form-control"
                                required="required" style="width: 80px;">
                                <b>@</b>
                                <input type="text" name="email2" class="form-control" id="email2" 
                                required="required" style="width: 140px;"> &nbsp;&nbsp;&nbsp;
                                <!-- <select style="width: 60px; height: 40px" id="selemail" class="form-control">
                                  <option value="-" selected="selected">직접입력</option>
                                  <option value="naver.com">네이버</option>
                                  <option value="gmail.com">구글</option>
                                  <option value="hanmail.net">다음</option>
                                </select> -->
                              </tr>
                              
                            </table>
                            <input style="align:center" type="submit" class="site-btn" value="SIGN UP">
                        </form>
                        <h5>Already have an account? <a href="<%=root%>/index.jsp?main=sign/login/loginmain.jsp">Log In!</a></h5>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <h3>Login With:</h3>
                        <ul>
                            <!-- <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                            </li>
                            <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                        </ul> -->
                        <li id="GgCustomLogin"><a href="javascript:void(0);" class="google"><i class="fa fa-google"></i> Log in With Google</a></li>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->

    <!-- Js Plugins -->
    <script src="<%=root %>/tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="<%=root %>/tmplt/js/bootstrap.min.js"></script>
	<script src="<%=root %>/tmplt/js/player.js"></script>
	<script src="<%=root %>/tmplt/js/jquery.nice-select.min.js"></script>
	<script src="<%=root %>/tmplt/js/mixitup.min.js"></script>
	<script src="<%=root %>/tmplt/js/jquery.slicknav.js"></script>
	<script src="<%=root %>/tmplt/js/owl.carousel.min.js"></script>
	<script src="<%=root %>/tmplt/js/main.js"></script>

</body>
<script type="text/javascript">
$(function(){
	//이메일 선택 이벤트
	$("#selemail").change(function(){
		if($(this).val()=='-'){
			$("#email2").val('');  //지정된 메일 지우기
			$("#email2").focus();  //포커스 주기
		}else{
			$("#email2").val($(this).val());
		}
	});
	
	
	//아이디 입력 버튼 이벤트
	$("#btnIdcheck").click(function(){
		window.open("sign/signup/idsearch.jsp","","width=600px, height=200px,left-top=500px,top=100px");
	});
	
});

//check
function check(f) {
	
	if(f.id.value.length==0){
		alert("아이디 입력을 해주세요");
		return false;
	}
		
	if(f.pass.value!=f.pass2.value){
		alert("비밀번호가 서로 다릅니다");
		f.pass.value="";
		f.pass2.value="";
		return false; //action이 호출되지않는다
	}
}
</script>

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
        //프로필을 가져온다.
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
</html>
</body>
</html>