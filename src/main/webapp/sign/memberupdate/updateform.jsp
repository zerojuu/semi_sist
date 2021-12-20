<%@page import="Sign.SignDao"%>
<%@page import="Sign.SignDto"%>
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


    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">

	<%
	//프로젝트 경로구하기
	String root=request.getContextPath();
	String num=request.getParameter("hnum");
	%>

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
</head>
<body>

    <!-- 수정폼 시작 -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                    <div class="login__form">
                        <h3>UPDATE</h3>
                        <form action="sign/memberupdate/updateaction.jsp" name="signfrm" method="post" class="form-inline"
                        onsubmit="return check(this)">
                        <%
                    	//dao선언
                    	SignDao dao=new SignDao();

                    	//dto얻기
                    	SignDto dto=dao.getMember(num);

                    	//이메일 분리하기(@기준으로)
                    	int idx=dto.getEmail().indexOf('@');
                    	String email1=dto.getEmail().substring(0,idx); //0~idx-1까지 추출
                    	String email2=dto.getEmail().substring(idx+1); //idx+1번지부터 끝까지
                        %>
                        <input type="hidden" name="num" value="<%=num%>">
                            <table class="table table-boredered" style=" width:500px; background-color: white;" >
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">이름</th>
                                <td style="background-color: white;">
                                <b><%=dto.getName() %></b>
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">아이디</th>
                                <td style="background-color: white;">
                                  <input type="text" name="id" class="form-control" readonly="readonly" value="<%=dto.getId()%>">
                                  <button type="button" id="btnIdcheck">중복확인</button>
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">비밀번호</th>
                                <td style="background-color: white;">
                                  <input type="password" name="pass" placeholder="비밀번호를 입력해주세요." required="required">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">비밀번호 확인</th>
                                <td style="background-color: white;">
                                <input type="password" name="pass2" placeholder="비밀번호를 재입력해주세요." required="required">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">생년월일</th>
                                <td style="background-color: white;">
                                <b><%=dto.getBirth() %></b>
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">전화번호</th>
                                <td style="background-color: white;"><input type="text" name="hp" value="<%=dto.getHp()%>"></td>
                              </tr>
                              
                              <tr>
                              <th width="100px;" style="background-color: #F5F5F5;">이메일</th>
                              <td>
                                <input type="text" name="email1" value="<%=email1 %>" class="form-control"
                                required="required" style="width: 80px;">
                                <b>@</b>
                                <input type="text" name="email2" value="<%=email2 %>" class="form-control" id="email2" 
                                required="required" style="width: 140px;"> &nbsp;&nbsp;&nbsp;
                                <!-- <select style="width: 60px; height: 40px" id="selemail" class="form-control">
                                  <option value="-" selected="selected">직접입력</option>
                                  <option value="naver.com">네이버</option>
                                  <option value="gmail.com">구글</option>
                                  <option value="hanmail.net">다음</option>
                                </select> -->
                                </td>
                              </tr>
                              <tr>
                                <td colspan="2" align="center">
                                <input type="submit" class="site-btn" value="UPDATE">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="button" class="site-btn" value="DELETE"
                                onclick="location.href='sign/memberupdate/deleteaction.jsp?num=<%=num%>'">
                                </td>
                              </tr>
                            </table>
                      </form>
                </div>
            </div>
        </div>
    </section>
    <!-- 수정폼 끝 -->


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
</html>
</body>
</html>