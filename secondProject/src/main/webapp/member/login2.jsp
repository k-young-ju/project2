<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<body>
<center>
<table border=0>
	<tr>
		<td><a href="/"><img src = "/img/Logo5.png" style="width:615px;height:170px"> </a></td>
	</tr>
</table>
<form action="login" method="post">
<table width=500 border=0>
	<tr>
		<td style="border:1px solid black;border-radius: 15px;border-collapse: collapse;"> 
			<input id="m_id" name="m_id" placeholder=" 아이디를 입력해 주세요" style="width:100%;height:60px;border: 0px;border-radius: 15px 15px 0px 0px;padding: 0px" ><br>
			<input  type ="password" id="m_pass" name="m_pass" placeholder=" 비밀번호를 입력해주세요" style="width:99%;height:60px;border: 0px;border-radius: 0px 0px 15px 15px">
		</td>
	</tr>
</table>
<p height=30></p>
<table align="center" width=500 >
	<tr>
		<td style="border:1px solid black;border-radius: 15px;height:50px;background-color: gray" ><button style="width:100%;border:0px;color: white;background-color: gray;font-size: 30px">로그인</button></td>
	</tr>
</table>
</form>
<p></p>
<table width=500 border=0>
	<tr>
		<td align="right">
				
				<a href="find_inp">아이디&비밀번호 찾기</a>
		</td>
	</tr>
</table>
<p height=100></p>
<script>
function join_go(){
	location.href="join";
}
</script>
<table width=500 border=0>
	<tr>
		<td  style="width:100%;height:50px;background-color: green;color:white;text-align: center;color: white;border-radius: 15px;">
	      <!-- 아래와같이 아이디를 꼭 써준다. -->
	      <a id="naverIdLogin_loginButton" href="javascript:void(0)" style="color:white;">
	          <span >네이버 로그인</span>
	      </a>
      </td>
	</tr>
	
</table>

<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "ITOORoL2YIVxWb12XDMq", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/member/login_insert", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var id =naverLogin.user.getId();
			var pass = naverLogin.user.getPassword();
			var name = naverLogin.user.getName();
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>
<table width=500 >
	<tr>
		<td style="border:1px solid blue;border-radius: 15px;height:60px" ><input type="button" value="회원가입" onclick="join_go()" style="width:100%;border:0px;color: blue;font-size: 30px;background-color: white"></td>
	</tr>
</table>
<p style="height:10px"></p>
<table width=500 style="border-top: 1px solid gray">
	<tr>
		<td height=10></td>
	</tr>
	<tr>
		<td style="text-align: center"><a href = "">비회원 주문조회 ></a></td>
	</tr>
</table>

</center>    
</body>
</html>