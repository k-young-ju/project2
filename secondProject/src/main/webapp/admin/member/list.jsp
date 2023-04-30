<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/admin/include/header.jsp" %>   

<style>
.td1{
text-align:center;border-bottom:1px solid #5055B1;
height:30px;
}
table{
	padding:0;
	margin:0;
	border-spacing:0;
	border-collapse:collapse;
}
</style>

<center>
<table width="1100" border=0>
	<tr height=25/>		
	<tr>
		<td style="text-align:center;color:#B464EB;vertical-align:bottom;"><h2>회원목록</h2></td>
	</tr>
</table>


<form action ="" name ="Form1" id = "Form1" >

<table border=0 width=1110 height=30 align=center>
		<tr>			
		<td width=600>
<c:if test="${count>0 }">
	<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
	<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
	<!-- 2개의 변수 초기화 -->
	<c:set var="startPage" value="${1 }" />
	<c:set var="pageBlock" value="${4 }" />	

	<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분-->
	<c:if test="${pageNum > pageBlock }">
		<!-- 결과를 정수형으로 리턴 받아야 하기 때문에 fmt -->
		<fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
		<c:set var="startPage" value="${result * pageBlock + 1 }" />
	</c:if>	

	<!-- endPage 값 설정 부분 -->
	<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
	<c:if test="${endPage > pageCount }">
		<c:set var="endPage" value="${pageCount }" />
	</c:if>
	
	<!-- 이전 링크 -->
	<td width=60 style="text-align:center">
	<c:if test="${startPage > pageBlock }">
		<a href="list?pageNum=${startPage - pageBlock }">[이전]</a>
	</c:if>
	</td>
	
	<!-- 페이징 링크 -->
	<td width=110 style="text-align:center;font-size:22px;">
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${pageNum == i }">
				<a href="list?pageNum=${i }"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
			</c:when>
			<c:otherwise>					
				<a href="list?pageNum=${i }"><span style="padding:0px 4px;">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</td>			
	<!-- 다음 링크 -->
	<td width=60 style="text-align:center">
	<c:if test="${endPage < pageCount }">
		<a href="list?pageNum=${startPage + pageBlock }">[다음]</a>
	</c:if>
	</td>
	
</c:if>
	</tr>
	<tr height=20/>
</table>

<table width=1100 align="center" style="border:1px solid #5055B1;height:25px;">
	<tr>
		<td><input type = "checkbox" name = "all" value="checkbox" onclick = "checkall()"></td>
		<td width =80 style="text-align:center;color:#5055B1;"></td>
		<td width = 120 style="text-align:center;color:#5055B1;">아이디</td>
		<td width = 120 style="text-align:center;color:#5055B1;">이름</td>
		<td width = 130 style="text-align:center;color:#5055B1;">회원등급</td>
		<td width = 150 style="text-align:center;color:#5055B1;">생년월일</td>
		<td width =80 style="text-align:center;color:#5055B1;">성별</td>
		<td width = 200 style="text-align:center;color:#5055B1;">전화번호</td>
		<td width = 220 style="text-align:center;color:#5055B1;"><b>상세정보</b></td>
	</tr>
</table>

<table height=15/>
<table width=1100 border=0 align="center">
	<c:set var="num" value="${0 }"/>
	<c:forEach var="list" items="${v }">
	<tr hieght=10/>
	<tr>
		<td class="td1"><input type="checkbox" name = "ap_check" value="${list.id }" ></td>
		<td width=80 class="td1"></td>
		<td width = 120 class="td1" name="id">${list.id }</td>
		<td width = 120 class="td1">${list.name }</td>
		<td width = 130 class="td1"><input type="number" name="level" value="${list.level }" style="width:30px;"></td>
		<td width = 150 class="td1">${list.birth1 }.${list.birth2 }.${list.birth3 }</td>
		<c:choose>
			<c:when test="${list.gender eq 'M'}">
				<td width =80 class="td1">남자</td>
			</c:when>
			<c:otherwise>
				<td width =80 class="td1">여자</td>
			</c:otherwise>
		</c:choose>
		<td width = 200 class="td1">${list.phone1 }-${list.phone2 }-${list.phone3 }</td>
		<td width = 220 class="td1"><a href = "view?id=${list.id }">상세정보확인</a></td>
	</tr>
	<tr height=20/>
	<c:set var="num" value="${num+1 }"/>
	</c:forEach>
	<tr height=20/>
</table>
<table width=1100 align="center" border=0>
	<tr>
		<td style="text-align: left"><input type="button" onclick="reload()" value ="새로고침" style="cursor:pointer;font-size:17px;margin:auto;" class="custom-choice btn-choice"></td>
		<td></td>
		<td style="text-align: right">
			<input type="button" value="등급일괄변경" onclick="level_ch()" class="custom-choice btn-choice">
			<input type="button" onclick="location.href='/admin/member/add'" value ="회원추가" style="cursor:pointer;font-size:17px;margin:auto;" class="custom-choice btn-choice">
			<button onClick="check_select();return false;" style="cursor:pointer;font-size:17px;margin:auto;" class="custom-choice btn-choice">선택삭제</button>
		</td>
	</tr>
</table>
</form>
</center>
<script>
function reload(){
	location.href="list";
}

function checkall() {//체크박스 전체 선택 , 해제
	if(Form1.all.checked) {
		for(i=1; i < (document.Form1.length); i++){
			document.Form1.elements[i].checked = true;
		}
	}else{
		for(i=1; i < (document.Form1.length); i++){
			document.Form1.elements[i].checked = false;
		}
	}
}

function check_select(){//체크박스 부분 선택
	myForm = document.getElementsByName("ap_check");
	myFormLen = myForm.length; //체크박스 전체수
	if(myFormLen==1){//체크박스 전체 리스트 수가 1개 일때
		document.Form1.ap_check.checked = true;
		check_one=document.Form1.ap_check.value;
		alert(check_one);//체크된 값 확인
		return; 
	} 
	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
		 if(document.Form1.ap_check[i].checked == true) break;
	}
	if(i == document.Form1.ap_check.length) {
		alert("선택된 항목이 없습니다.");         
		return;
	}
	if(confirm('회원정보를 삭제하시겠습니까?')){
		check_select2();
		return;
	} 
}
function check_select2(){//체크박스 전체 리스트 수가 2개 이상일 때
	var check_hide = new Array();

	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
		if(document.Form1.ap_check[i].checked == true) {
			check_hide[i] = document.Form1.ap_check[i].value;
		}
	}
		
		location.href="delete_select?ids="+check_hide;
		
	
	
}

function level_ch(){
	var num="${num}";
	//alert(num);
	var sum = new Array();
	var sum2 = new Array()
	for(i=0;i<num;i++){
		sum += $("input[name=level]:eq("+i+")").val()+",";
		sum2 += $("td[name=id]:eq("+i+")").text()+",";
	}
	//alert("levels="+sum);
	//alert("ids="+sum2)
	$.ajax({		
		url: "level_ch",
		type: "post",
		dataType: "text",
		data: "levels="+sum+"&ids="+sum2,
		success:function(result){
 			//alert(result);
		
		
		}
	});
}


</script>