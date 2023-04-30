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
<body>
<style>
	 input,select{
	 border-radius: 10px
	 }
	 table{
	 	border-collapse:collapse;
	 }
	 .custom-cate {
		  width: 700px;
		  height: 40px;
		  color: #fff;
		  border-radius: 5px;
		  font-family: 'Lato', sans-serif;
		  font-weight: 500;
		  background: transparent;
		  cursor: pointer;
		  transition: all 0.3s ease;
		  display: inline-block;
		   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
		   7px 7px 20px 0px rgba(0,0,0,.1),
		   4px 4px 5px 0px rgba(0,0,0,.1);
		  outline: none;
	}
	
	.btn-cate {
	  background: #663dff;
	  border: none;
	  z-index: 1;
	}
</style>
<center>
<table border=0>
	<tr>
		<td ><a href="/"><img src = "/img/Logo5.png" style="width:615px;height:170px"> </a></td>
	</tr>
</table>
<p height=30></p>	
<table width="700" border=0>
	<tr>
		<td width="50%" align="center" id="find_id" height=50>
			<span onClick="tab_click('find_id')" style="cursor:pointer" ><h2>아이디 찾기</h2></span>
		</td>
		<td width="50%" align="center" id="find_pass">
			<span onClick="tab_click('find_pass')" style="cursor:pointer" ><h2>비밀번호 찾기</h2></span>
		</td>
	</tr>
</table>


<div id="A" style="display:block;">
<form action="find?option=1" method="post" >
	<table width="700" border=0 style="border:1px solid #5055B1;border-radius: 15px">
		<tr>
			<td><h3>전화번호 입력</h3></td>
		</tr>
		<tr>
			<td>
				<input id="phone1" name="phone1" value="${m2.phone1 }"> -
				<input id="phone2" name="phone2" value="${m2.phone2 }"> -
				<input id="phone3" name="phone3" value="${m2.phone3 }">
			</td>
		</tr>
		<tr>
			<td><h3>메일주소</h3></td>
		</tr>
		<tr>
			<td>
				<input id="email1" name="email1" value="${m2.email1 }">@
				<select id = "email2" name="email2" onkeyup="e_ch()" style="width:40%;height:25px" value="${m2.email2 }">
					<option value = "">==이메일 선택==</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><h3>생년월일</h3></td>
		</tr>
		<tr>
			<td>
				<input id ="birth1" name="birth1" placeholder=" 년" value="${m2.birth1 }">
				<input id="birth2" name="birth2" placeholder=" 월" value="${m2.birth2 }">
				<input id="birth3" name="birth3" placeholder=" 일" value="${m2.birth3 }">
			</td>
		</tr>
		<tr>
			<td height=30></td>
		</tr>
		<tr>
			<td style="font-size:30px;text-align:left;"><button class="custom-cate btn-cate" style="font-size:22px;">찾기</button></td>
		<tr>
		<tr>
			<td>
				<c:choose>
					<c:when test="${m2.id == null }">
						<b style="color:red">정보와 일치하는 아이디는 존재하지 않습니다.</b>
					</c:when>
					<c:otherwise>
						<b style="color:blue">아이디는 :</b> <span id="id_result">${m2.id }</span>	
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	</form>
</div>

<div id="B" style="display:none;">
	<form action="find?option=2" method="post" >
	<table width="700" border=0 style="border:1px solid black;border-radius: 15px">
		<tr>
			<td><h3>아이디</h3></td>
		</tr>
		<tr>
			<td><input id="m_id" name="m_id" value="${m2.id }"></td>
		</tr>
		<tr><td><h3>전화번호</h3></td></tr>
		<tr>
			<td>
				<input id="phone1" name="phone1" value="${m2.phone1 }"> -
				<input id="phone2" name="phone2" value="${m2.phone2 }"> -
				<input id="phone3" name="phone3" value="${m2.phone3 }">
			</td>
		</tr>
		<tr>
			<td><h3>메일주소</h3></td>
		</tr>
		<tr>
			<td>
				<input id="email1" name="email1" value="${m2.email1 }">@
				<select id = "email2" name="email2" onkeyup="e_ch()" style="width:40%;height:25px" value="${m2.email2 }">
					<option value = "">==이메일 선택==</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><h3>생년월일</h3></td>
		</tr>
		<tr>
			<td>
				<input id ="birth1" name="birth1" value="${m2.birth1 }">년
				<input id="birth2" name="birth2" value="${m2.birth2 }">월
				<input id="birth3" name="birth3" value="${m2.birth3 }">일
			</td>
		</tr>
		<tr>
			<td height=30></td>
		</tr>
		<tr>
			<td style="font-size:30px;text-align:left;"><button class="custom-cate btn-cate" style="font-size:22px;">찾기</button></td>
		</tr>
		<tr>
			<td>
			<c:choose>
					<c:when test="${m2.pass == null }">
						<b style="color:red">정보와 일치하는 비밀번호는 존재하지 않습니다.</b>
					</c:when>
					<c:otherwise>
						<b style="color:blue">비밀번호는 :</b> <span id="id_result">${m2.pass}</span>	
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	</form>
	
</div>

<table>
	<tr>
		
	</tr>
</table>
</center>

<script>
function tab_click(str){
	if (str=='find_id'){
		document.getElementById('A').style.display='inline';
		document.getElementById('B').style.display='none';
		

		document.getElementById('find_id').style.color='white';
		document.getElementById('find_id').style.background='#5055B1';

		document.getElementById('find_pass').style.color='#000000';
		document.getElementById('find_pass').style.background='#ffffff';
		
		
		
	}else{
		document.getElementById('A').style.display='none';
		document.getElementById('B').style.display='inline';

		document.getElementById('find_id').style.color='#000000';
		document.getElementById('find_id').style.background='#ffffff';

		document.getElementById('find_pass').style.color='white';
		document.getElementById('find_pass').style.background='#5055B1';
		
	
	}
}

var tab_choose = "${option}";

if(tab_choose == "2"){
	tab_click('find_pass');
	
}else{
	tab_click('find_id');
	
}
</script>