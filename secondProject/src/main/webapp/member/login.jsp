<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style>
input:focus {outline:none;}
a{
	text-decoration: none;
}

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<body>
<center>
<table border=0>
	<tr>
		<td><a href="/"><img src = "/img/Logo5.png" style="width:615px;height:170px"> </a></td>
	</tr>
</table>
<form name="login" action="login" method="post" onsubmit="return login_go()">
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
		<td style="border:1px solid black;border-radius: 15px;height:50px;background-color: #5055B1;color: white" ><button style="width:100%;border:0px;color: white;background-color: #5055B1;color: white;font-size: 30px">로그인</button></td>
	</tr>
</table>
</form>
<p></p>
<table width=500 border=0>
	<tr>
		<td align="right">
				
				<a href="find">아이디&비밀번호 찾기</a>
		</td>
	</tr>
</table>
<p height=100></p>
<script>
function join_go(){
	location.href="join";
}

function login_go(){
	if(m_id.value ==""){
		alert("아이디를 입력해주세요");
		login.m_id.focus();
		return false;
	}
	if(m_pass.value==""){
		alert("비밀번호를 입력해주세요");
		login.m_pass.focus();
		return false;
	}
	login.submit;
}

</script>

<table width=500 >
	<tr>
		<td style="border:1px solid #5055B1;border-radius: 15px;height:60px" ><input type="button" value="회원가입" onclick="join_go()" style="width:100%;border:0px;color: #5055B1;font-size: 30px;background-color: white"></td>
	</tr>
</table>
<p style="height:10px"></p>
<table width=500 style="border-top: 1px solid gray">
	<tr>
		<td height=10></td>
	</tr>
	<tr>
		<td style="text-align: center;font-size:20px;"><a href = "/member/non_member">비회원 주문조회</a></td>
	</tr>
</table>

</center>    
</body>
</html>