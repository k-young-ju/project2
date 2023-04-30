<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/admin/include/header.jsp" %>
    <style>
    	a{
    	text-decoration: none;
    	
    	}
    </style>
 <center>
	 <table height=50 />
	<table width=1300 height=50>
	<tr>
	<td class="main_font" style="color:#5055B1;text-align:center;font-size:25px;">고객 문의 답변</td>
	</tr>
	</table>
	
	<form action ="" name="Form1" id="Form1">
	<table border=0 width=1250 height=30 align=center>
			<tr>			
			<td width=750>
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
		<td width=100 style="text-align:right;"><button onClick="check_select();return false;" style="cursor:pointer;font-size:17px;margin:auto;" class="custom-choice btn-choice">선택삭제</button></td>
	</c:if>
		</tr>
	</table>
		
	<table height=40/>	
	<table width=1250 border=1 style="text-align: center">
		<tr>
			<td width=50><input type="checkbox" name="all" value="checkbox" onclick="checkall()"></td>
			<td width=50>번호</td>
			<td width=150>문의유형</td>
			<td width=300>제목</td>
			<td width=100>회원아이디</td>
			<td width=200>등록일자</td>
			<td width=200>처리일자</td>
			<td width=100>상태</td>
			<td width=100>Mode</td>
		</tr>
	</table>
		
		<!-- 반복문 시작 -->
		<c:set var="numbering" value="${1 }" />
		<c:forEach var="list" items="${v }">
		<table width=1250 style="text-align: center" border=1>
			<tr>
				<td width=50><input type="checkbox" name="ap_check" value="${list.uid }"></td>
				<td width=50>${numbering }</td>
				<td width=150>${list.option }</td>
				<c:choose>
					<c:when test="${fn:contains(list.subject,'[답변]') }">
					<td width=300 style="text-align: left;padding-left: 15px;"><a href="view?uid=${list.uid }" ><img src="/admin/img/thread_new.gif">${list.subject }</a></td>
					</c:when>
					<c:otherwise>
					<td width=300 style="text-align: left;padding-left: 15px;"><a href="view?uid=${list.uid }" >${list.subject }</a></td>
					</c:otherwise>				
				</c:choose>
				<td width=100>${list.id }</td>
				<td width=200>${list.signdate }</td>
				<td width=200>${list.re_date }</td>
				<td width=100>${list.status }</td>
				<td width=100>
					<a href="delete?gongji=2&uid=${list.uid }">삭제</a>
				</td>
			</tr>
		</table>
		<c:set var="numbering" value="${numbering +1 }"/>
		</c:forEach>
	</form>
</center>	

	
<script>
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
		if(confirm('선택된 공지글을 삭제하시겠습니까?')){
			location.href="delete?uids="+check_one+"&gongji=3";
			return false;
		} 
		 
	} 
	for(var i = 0;  i < document.Form1.ap_check.length; i++) {
		 if(document.Form1.ap_check[i].checked == true) break;
	}
	if(i == document.Form1.ap_check.length) {
		alert("선택된 항목이 없습니다.");         
		return;
	}
	if(confirm('선택된 공지글을 삭제하시겠습니까?')){
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
		location.href="delete?uids="+check_hide+"&gongji=3";
}


</script>



























	
	