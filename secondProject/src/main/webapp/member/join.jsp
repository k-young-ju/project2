<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<link rel="stylesheet" href="/css/basic.css"> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<body>
<table>
	<tr>
		<td height=50></td>
	</tr>
</table>
<script>

function id_check(id){
	$.ajax({
		url: "idok", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data:"id="+id,
		success:function(text){ //성공일 경우
			$("#id_result").html(text);
		},
		error:function(){ //실패일 경우
			alert("실패");
		}
	});
}
function pass_check(){
	var e = document.getElementById("pass_result");
	if(m_pass2.value != m_pass.value){
		e.innerHTML = "<div style='color:red'>비밀번호가 일치하지 않습니다.</div>";
	}else{
		e.innerHTML = "<div></div>";
	}
}

var c_num = 0;

function email_ok(str){
	var num = parseInt(Math.random() * 100000);
	$.ajax({
		url: "mailSend", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "num="+num+"&email="+str,
		success:function(text){ //성공일 경우
			//$("#id_result").html(text);
			alert("메일인증 확인하세요.");
			c_num = num;
			
		},
		error:function(){ //실패일 경우
			alert("메일 보내기 실패");
		}
	});
}
function email_confirm(){
	
	if(c_num == num2.value){
		alert("인증되었습니다.");
		e_check.value='y';
	}else{
		alert("인증번호를 다시 확인하세요");
	}
}

function join_ok(){
	
	if(m_id.value ==""){
		alert("아이디를 입력하세요");
		m_id.focus();
		return false;
	}
	if(m_pass.value ==""){
		alert("비밀번호를 입력하세요");
		m_pass.focus();
		return false;
	}
	if(m_pass2.value != m_pass.value){
		alert("비밀번호가 일치하지 않습니다.");
		m_pass2.focus();
		return false;
	}
	if(m_name.value ==""){
		alert("이름을 입력하세요");
		m_name.focus();
		return false;
	}
	if(birth1.value ==""){
		alert("생년을 입력하세요");
		birth1.focus();
		return false;
	}
	if(birth2.value ==""){
		alert("생월을 선택하세요");
		return false;
		
	}
	
	if(birth3.value ==""){
		alert("생일을 입력하세요");
		birth3.focus();
		return false;
	}
	
	if(gender.value ==""){
		alert("성별을 선택하세요");
		return false;
	}	
	
	if(email1.value ==""){
		alert("이메일을 입력하세요");
		email1.focus();
		return false;
	}
	
	if(email2.value ==""){
		alert("도메인을 입력하세요");
		return false;
	}
	
	if(phone1.value =="" || phone2.value=="" || phone3.value==""){
		alert("전화번호를 입력하세요");
		phone1.focus();
		return false;
	}
	
	if(sample4_postcode.value =="" || sample4_roadAddress.value=="" || sample4_jibunAddress.value=="" || sample4_detailAddress.value=="" || sample4_extraAddress.value==""){
		alert("주소를 입력하세요");
		return false;
		
	}
	
	if(e_check.value =='n'){
		alert("메일인증이 되지 않았습니다.");
		num2.focus();
		return false;
	}
	
	result = confirm("아이디 : "+m_id.value+"\n이름 :"+m_name.value+"\n이메일 :"+email1.value+"@"+email2.value+"\n휴대폰 :"+phone1.value+"-"+phone2.value+"-"+phone3.value+"\n맞습니까?");
	if(result == true){
		document.join.submit();
		
	}else{
		return false;
	}
	
}
function e_ch(){
	e_check.value = 'n';
}
</script>
<style>
	.input_style{
	height:25px;
	width:98%;
	padding:0px;
	}

	.name_style{
	height:20px;
	}
	input,select,button{
	border-radius: 10px;	
	}
	
</style>
<center>
<table border=0>
	<tr>
		<td><a href="/"><img src = "/img/Logo5.png" style="width:615px;height:170px"> </a></td>
	</tr>
</table>
<form name="join" action="join" method="post" onsubmit="return join_ok()">
<table width =600 border=0>
	<tr>
		<td ><h2 class="name_style">아이디</h2></td>
	</tr>
	<tr>
		<td>
			<input id="m_id" name="m_id" onkeyup="id_check(join.m_id.value)" class="input_style">
			<div id="id_result"></div>
		</td>
	
	</tr>
	<tr>
		<td><h2 class="name_style">비밀번호</h2></td>
	</tr>
	<tr>
		<td><input type="password" id="m_pass" name="m_pass" class="input_style"></td>
	</tr>
	<tr>
		<td><h2 class="name_style">비밀번호 확인</h2></td>
	</tr>
	<tr>
		<td>
			<input type="password" id="m_pass2" name="m_pass2" onkeyup="pass_check()" class="input_style">
			<div id="pass_result"></div>
		</td>
	</tr>
	<tr>
		<td><h2 class="name_style">이름</h2></td>
	</tr>
	<tr>
		<td><input id="m_name" name="m_name" class="input_style"></td>
	</tr>
	<tr>
		<td><h2 class="name_style">생년월일</h2></td>
	</tr>
	<tr>
		<td>
			<input id="birth1" name="birth1" placeholder="년" style="width:32%;height:25px">
			<select id="birth2" name = "birth2" style="width:32%;height:25px">
				<option value="">월</option>
				<c:forEach var="i" begin="1" end="12">
					<option value="${i }">${i }월</option>
				</c:forEach>
				
			<input id="birth3" name="birth3" placeholder="일" style="width:32%;height:25px">
		</td>
	</tr>
	<tr>
		<td><h2 class="name_style">성별</h2></td>
	</tr>
	<tr>	
		<td>
			<select id ="gender" name="gender" class="input_style">
				<option value="">=성별=</option>
				<option value="M">남성</option>
				<option value="F">여성</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><h2 class="name_style">이메일</h2></td>
	</tr>
	<tr>
		<td>
			<input id="email1" name="email1" onkeyup="e_ch()" style="width:40%;height:25px"> @
			<select id = "email2" name="email2" onkeyup="e_ch()" style="width:40%;height:25px">
					<option value = "">==이메일 선택==</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
				</select>
		
			<input type="button" value="메일인증" onclick="email_ok(email1.value+'@'+email2.value)" style="height:25px;background-color: #5055B1;color: white">
			<input type="hidden"  id ="e_check" name="e_check" value="n">
			<br><p></p>
			<input id="num2" name="num2" placeholder="인증번호를 입력하세요"  style="width:50%;height:25px">
			<input type="button" value="인증" onclick="email_confirm()" style="height:25px;background-color: #5055B1;color: white">
		</td>
		
	</tr>
	<tr>
		<td><h2 class="name_style">전화번호</h2></td>
	</tr>
	<tr>
		<td>
			<input id="phone1" name="phone1" style="width:29%;height:25px"> -&nbsp;
			<input id="phone2" name="phone2"  style="width:29%;height:25px"> -&nbsp;
			<input id="phone3" name="phone3"  style="width:29%;height:25px">
		</td>
	</tr>
	<tr>
 	    <td><h2 class="name_style">주소</h2></td>
 	</tr>
 	<tr> 
 		 
 		<td>
 			<input type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호" style="height:30px;width:48%">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:30px;;width:48%;background-color: #5055B1;color: white">
 		</td>
 	</tr>
 	<tr>
 	    <td>
 			<input type="text" id="sample4_roadAddress" name="zipcode1" placeholder="도로명주소" style="height:30px;;width:48%">
			<input type="text" id="sample4_jibunAddress" name="zipcode2" placeholder="지번주소" style="height:30px;;width:48%">
			<span id="guide" style="color:#999;display:none"></span>
 		</td>
 	</tr>
 	<tr>
 	   	<td>
 			<input type="text" id="sample4_detailAddress" name="zipcode3" placeholder="상세주소" style="height:30px;;width:48%">
			<input type="text" id="sample4_extraAddress" name="zipcode4" placeholder="참고항목" style="height:30px;;width:48%">
 		</td>
 	</tr>
</table>
<p></p>
<table width=600>
	<tr>
		<td align="center" style="width:100%"><button style="width:100%;height:40px;background-color: #5055B1;color: white"><b style="font-size: 20px">가입하기</b></button></td>
	</tr>
</table>
</form>
</center>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>