<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/admin/include/header.jsp"%>

<script>

function pass_check(){
	var e = document.getElementById("pass_result");
	if(m_pass2.value != m_pass.value){
		e.innerHTML = "<div style='color:red'>비밀번호가 일치하지 않습니다.</div>";
	}else{
		e.innerHTML = "<div></div>";
	}
}

function delete_go(){
	result = confirm("회원정보를 삭제하시겠습니까?");
	if(result == true){
		location.href="/admin/member/delete?id="+m_id.value;
	}
}
</script>
<style>
	* {
		margin: 0;
		padding: 0;
		z-index: 0;
	}
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
<table>
	<tr>
		<td height=20></td>
	</tr>
</table>
<table width=600 border=0>
	<tr>
		<td style="text-align: center"><h1>회원정보</h1></td>
	</tr>
</table>
<form name="modify" action="modify" method="post">
<table width =600 border=0>
	<tr>
		<td><h2>아이디</h2></td>
	</tr>
	<tr>
		<td>
			<input id="m_id" name="m_id" value="${m2.id }" class="input_style" readonly>
		</td>
	
	</tr>
	<tr>
		<td><h2>비밀번호</h2></td>
	</tr>
	<tr>
		<td><input id="m_pass" name="m_pass" value="${m2.pass }" class="input_style"></td>
	</tr>
	<tr>
		<td><h2>이름</h2></td>
	</tr>
	<tr>
		<td><input id="m_name" name="m_name" value="${m2.name }" class="input_style"></td>
	</tr>
	<tr>
		<td><h2>생년월일</h2></td>
	</tr>
	<tr>
		<td>
			<input id="birth1" name="birth1" placeholder="년" value="${m2.birth1 }년" style="width:32%;height:25px">
			<input id ="birth2" name= "birth2" value="${m2.birth2 }월" style="width:32%;height:25px">
			<input id="birth3" name="birth3" placeholder="일" value="${m2.birth3 }일" style="width:32%;height:25px">
		</td>
	</tr>
	<tr>
		<td><h2>회원등급</h2></td>
	</tr>
	<tr>
		<td><input name="level" value="${m2.level }" class="input_style"></td>
	</tr>
	<tr>
		<td><h2>성별</h2></td>
	</tr>
	<tr>	
		<td>
			<c:choose>
				<c:when test="${m2.gender eq 'M'}">
					<input name="gender" value="남성" class="input_style">
				</c:when>
				<c:otherwise>
					<input name="gender" value="여성" class="input_style">
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td><h2>이메일</h2></td>
	</tr>
	<tr>
		<td>
			<input id="email1" name="email1" value="${m2.email1 }" style="width:47%;height:25px"> @
			<select id = "email2" name="email2" value="" style="width:46%;height:25px" onkeyup="e_ch()">
					<option value = "">==이메일 선택==</option>
					<option value="naver.com" <c:if test="${m2.email2 eq 'naver.com' }">selected</c:if>>naver.com</option>
					<option value="gmail.com" <c:if test="${m2.email2 eq 'gmail.com' }">selected</c:if>>gmail.com</option>
					<option value="nate.com" <c:if test="${m2.email2 eq 'nate.com' }">selected</c:if>>nate.com</option>
				</select>
		</td>
		
	</tr>
	<tr>
		<td><h2>전화번호</h2></td>
	</tr>
	<tr>
		<td>
			<input id="phone1" name="phone1" value="${m2.phone1}" style="width:29%;height:25px"> -&nbsp;
			<input id="phone2" name="phone2" value="${m2.phone2}" style="width:29%;height:25px"> -&nbsp;
			<input id="phone3" name="phone3" value="${m2.phone3}" style="width:29%;height:25px">
		</td>
	</tr>
	<tr>
 	    <td><h2>주소</h2></td>
 	</tr>
 	<tr> 
 		 
 		<td>
 			<input type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호" style="height:30px;width:48%" value="${m2.zipcode}" >
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:30px;width:48%">
 		</td>
 	</tr>
 	<tr>
 	    <td>
 			<input type="text" id="sample4_roadAddress" name="zipcode1" placeholder="도로명주소" style="height:30px;width:48%" value="${m2.zipcode1}">
			<input type="text" id="sample4_jibunAddress" name="zipcode2" placeholder="지번주소" style="height:30px;width:48%" value="${m2.zipcode2}">
			<span id="guide" style="color:#999;display:none"></span>
 		</td>
 	</tr>
 	<tr>
 	   	<td>
 			<input type="text" id="sample4_detailAddress" name="zipcode3" placeholder="상세주소" style="height:30px;width:48%" value="${m2.zipcode3}">
			<input type="text" id="sample4_extraAddress" name="zipcode4" placeholder="참고항목" style="height:30px;width:48%" value="${m2.zipcode4}">
 		</td>
 	</tr>
</table>
<p style="height:15px"></p>
<table width=600>
	<tr>
		<td align="center" style="width:50%"><button style="width:100%;height:30px"><b style="font-size: 20px">수정하기</b></button></td>
		<td style="width:50%"><input type="button" value="삭제하기" onclick="delete_go()" style="width:100%;height:30px;font-size: 20px;font-weight: bold"></td>
	</tr>
	<tr height=50/>
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