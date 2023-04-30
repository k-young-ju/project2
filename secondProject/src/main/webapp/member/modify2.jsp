<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file = "/include/header2.jsp"%> --%>
<script>

function pass_check(){
	var e = document.getElementById("pass_result");
	if(m_pass2.value != m_pass.value){
		e.innerHTML = "<div style='color:red'>비밀번호가 일치하지 않습니다.</div>";
	}else{
		e.innerHTML = "<div></div>";
	}
}
</script>
<style>
	.input_style{
	height:25px;
	width:98%;
	padding:0px;
	}

	.name_style{
	height:16px;
	}
	input,select,button{
	border-radius: 10px;	
	}
	
</style>
<center>


<table width=600 border=0>
	<tr>
		<td style="text-align: center;color:#5055B1;"><h1>정보수정</h1></td>
			<td style="border:1px solid black">
				책판다ID<br>
				${sessionScope.m_id }<br>
				이름 : ${sessionScope.m_name }<br>
				회원등급 : ${sessionScope.m_level }
				
					<a href="modify">회원수정</a>|
			<a onclick="delete_id()" style="cursor: pointer">회원탈퇴</a><br>
			<a href="/cart/list">장바구니</a>|<a href="/cart/jjim">찜 목록</a>
			</td>
	</tr>
</table>
<form name="modify" action="modify" method="post">
<table width =600 border=0>
	<tr>
		<td><h4>아이디</h4></td>
	</tr>
	<tr>
		<td>
			<input id="m_id" name="m_id" value="${modify.id }" class="input_style" readonly>
		</td>
	
	</tr>
	<tr>
		<td><h4>비밀번호</h4></td>
	</tr>
	<tr>
		<td><input id="m_pass" name="m_pass" value="${modify.pass }" class="input_style"></td>
	</tr>
	<tr>
		<td><h4>비밀번호 확인</h4></td>
	</tr>
	<tr>
		<td>
			<input id="m_pass2" name="m_pass2" value="${modify.pass }" onkeyup="pass_check()" class="input_style">
			<div id="pass_result"></div>
		</td>
	</tr>
	<tr>
		<td><h4>이름</h4></td>
	</tr>
	<tr>
		<td><input id="m_name" name="m_name" value="${modify.name }" class="input_style"></td>
	</tr>
	<tr>
		<td><h4>생년월일</h4></td>
	</tr>
	<tr>
		<td>
			<input id="birth1" name="birth1" placeholder="년" value="${modify.birth1 }" style="width:32%;height:25px">
			<select name = "birth4" value="${modify.birth4 }" style="width:32%;height:25px">
				<option value="${modify.birth4 }">${modify.birth4 }월</option>
				<c:forEach var="i" begin="1" end="12">
					<option value="${i}" >${i }월</option>
				</c:forEach>
			</select>	
				
			<input id="birth3" name="birth3" placeholder="일" value="${modify.birth3 }" style="width:32%;height:25px">
		</td>
	</tr>
	<tr>
		<td><h4>성별</h4></td>
	</tr>
	<tr>	
		<td>
			<select name="gender" value="" class="input_style">
				<option value="M" <c:if test="${modify.gender eq 'M' }">selected</c:if>>남성</option>
				<option value="F" <c:if test="${modify.gender eq 'F' }">selected</c:if>>여성</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><h4>이메일</h4></td>
	</tr>
	<tr>
		<td>
			<input id="email1" name="email1" value="${modify.email1 }" style="width:47%;height:25px"> @
			<select id = "email2" name="email2" value="" style="width:46%;height:25px" onkeyup="e_ch()">
					<option value = "">==이메일 선택==</option>
					<option value="naver.com" <c:if test="${modify.email2 eq 'naver.com' }">selected</c:if>>naver.com</option>
					<option value="gmail.com" <c:if test="${modify.email2 eq 'gmail.com' }">selected</c:if>>gmail.com</option>
					<option value="nate.com" <c:if test="${modify.email2 eq 'nate.com' }">selected</c:if>>nate.com</option>
				</select>
		</td>
		
	</tr>
	<tr>
		<td><h4>전화번호</h4></td>
	</tr>
	<tr>
		<td>
			<input id="phone1" name="phone1" value="${modify.phone1}" style="width:29%;height:25px"> -&nbsp;
			<input id="phone2" name="phone2" value="${modify.phone2}" style="width:29%;height:25px"> -&nbsp;
			<input id="phone3" name="phone3" value="${modify.phone3}" style="width:29%;height:25px">
		</td>
	</tr>
	<tr>
 	    <td><h4>주소</h4></td>
 	</tr>
 	<tr> 
 		 
 		<td>
 			<input type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호" style="height:30px;width:48%" value="${modify.zipcode}" >
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:30px;width:48%;background-color: #5055B1;color: white">
 		</td>
 	</tr>
 	<tr>
 	    <td>
 			<input type="text" id="sample4_roadAddress" name="zipcode1" placeholder="도로명주소" style="height:30px;width:48%" value="${modify.zipcode1}">
			<input type="text" id="sample4_jibunAddress" name="zipcode2" placeholder="지번주소" style="height:30px;width:48%" value="${modify.zipcode2}">
			<span id="guide" style="color:#999;display:none"></span>
 		</td>
 	</tr>
 	<tr>
 	   	<td>
 			<input type="text" id="sample4_detailAddress" name="zipcode3" placeholder="상세주소" style="height:30px;width:48%" value="${modify.zipcode3}">
			<input type="text" id="sample4_extraAddress" name="zipcode4" placeholder="참고항목" style="height:30px;width:48%" value="${modify.zipcode4}">
 		</td>
 	</tr>
</table>
<p style="height:15px"></p>
<table width=600>
	<tr>
		<td align="center" style="width:100%"><button style="width:100%;height:40px;background-color: #5055B1;color: white"><b style="font-size: 20px;">수정하기</b></button></td>
	</tr>
</table>
<table height=30/>
</form>
</center>
<%-- <%@ include file = "/include/footer.jsp"%> --%>
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