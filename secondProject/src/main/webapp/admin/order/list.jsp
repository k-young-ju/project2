<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/admin/include/header.jsp" %>   



<style>
.custom-choice {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

.btn-choice {
  background: rgb(6,14,131);
  background: linear-gradient(0deg, rgba(6,14,131,1) 0%, rgba(12,25,180,1) 100%);
  border: none;
}
.btn-choice:hover {
   background: rgb(0,3,255);
background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
}


.td1{
text-align:center;border-bottom:1px solid #5055B1;
}
table{
	padding:0;
	margin:0;
	border-spacing:0;
}



</style>


<center>   

<table width="1200" border=0>
	<tr height=50/>	
	<tr height=30/>
		<td style="text-align:center;color:#B464EB;vertical-align:bottom;"><h2>주문내역</h2></td>
	</tr>
	
</table>


<form action="" name ="Form1" id ="Form1">
<table border=0 width=1550 height=30 align=center>
		<tr>			
		<td width=950>
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
	<td width=150 style="text-align:right;"><button onClick="check_select();return false;" style="cursor:pointer;font-size:17px;margin:auto;" class="custom-choice btn-choice">변경</button></td>
</c:if>
	<tr>
	<tr height=20/>
</table>



<table width=1550 style="border:1px solid #5055B1";>
	<tr>
		<td width=50 style="text-align:center;"><input type = "checkbox" name = "all" value="checkbox" onclick="checkall()"></td>
		<td width=125 style="text-align:center;color:#5055B1;">주문번호</td>
		<td width=150 style="text-align:center;color:#5055B1;">주문가격</td>
		<td width=150 style="text-align:center;color:#5055B1;">주문 적립포인트</td>
		<td width=150 style="text-align:center;color:#5055B1;">구매자 아이디</td>
		<td width=150 style="text-align:center;color:#5055B1;">구매자 이름</td>
		<td width=400 style="text-align:center;color:#5055B1;">요청사항</td>
		<td width=50 style="text-align:center;color:#5055B1;"></td>
		<td width=125 style="text-align:center;color:#5055B1;">주문상태</td>
		<td width=100 style="text-align:center;color:#5055B1;"></td>
		<td width=100 style="text-align:center;color:#5055B1;">상세보기</td>
		<td></td>		
	</tr>
</table>
<table height=10/>

<table width=1550 border=0>	
	<c:forEach var="list" items="${ord}">

	<tr height=50/>
		<td width=50 class="td1"><input type="checkbox" name = "ap_check" value="${list.od_uid }" ></td>
		<td width=125 style="text-align:center;" class="td1">${list.od_uid }</td>
		<td width=150 class="td1"><fmt:formatNumber value="${list.od_price }"/></td>
		
		<c:choose>
		<c:when test="${list.od_point > 1}">
		<td width=150 class="td1"><fmt:formatNumber value="${list.od_point }"/></td>
		</c:when>
		<c:otherwise>
		<td width=150 class="td1">없음</td>
		</c:otherwise>
		</c:choose>
		<td width=150 class="td1">${list.mb_id }</td>
		<td width=150 class="td1">${list.od_name }</td>
		<td width=400 class="td1">${list.require1 }</td>
		<td width=50 class="td1"></td>
		<c:if test="${list.od_status eq '주문'}"><td width=125 class="td1">${list.od_status }</td></c:if>
		<c:if test="${list.od_status eq '완료'}"><td width=125 class="td1" style="color:#F4525F;font-weight:bold;">${list.od_status }</td></c:if>
		<td width=100 class="td1"></td>
<!-- 		<td width=100 class="td1"><button onClick="check_select();return false;" style="cursor:pointer;" class="w-btn w-btn-gra1 w-btn-gra-anim">변경</button></td> -->
		<td width=100 class="td1"><a href="/order/orderViewDetail?od_id=${list.od_id }&od_point=${list.od_point }&mb_id=${list.mb_id }&pageNum=${pageNum }&where=adminOrder">상세보기</a></td>	
		<td><input type="checkbox" name="accept" id="accept" value="${list.od_id }" style="display:none"/></td>
	</tr>
	<tr height=5/>
	</c:forEach>
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
		if(document.Form1.ap_check.checked == true){	
			if(confirm('주문정보를 완료로 변경하시겠습니까?')){		
			document.Form1.ap_check.checked = true;
			document.Form1.accept.checked = true;
			check_one=document.Form1.ap_check.value;
			check_two=document.Form1.accept.value;
			location.href="statusChange?orderUids="+check_one+"&orderOids="+check_two;
			return;
			}
		}else{
			alert("주문내역을 선택해주세요");
			return;
		}
		
	} 
	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
		 if(document.Form1.ap_check[i].checked == true) break;
	}
	if(i == document.Form1.ap_check.length) {
		alert("선택된 항목이 없습니다.");         
		return;
	}
	if(confirm('주문정보를 완료로 변경하시겠습니까?')){
		check_select2();
		return;
	} 
}
function check_select2(){//체크박스 전체 리스트 수가 2개 이상일 때
	var check_hide = new Array();
	var oid_hide = new Array();

	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
		if(document.Form1.ap_check[i].checked == true) {
			check_hide[i] = document.Form1.ap_check[i].value;
			document.Form1.accept[i].checked = true;
			oid_hide[i] = document.Form1.accept[i].value;
		}
	}
		
	location.href="statusChange?orderUids="+check_hide+"&orderOids="+oid_hide;

}


</script>