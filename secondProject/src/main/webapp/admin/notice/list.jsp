<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/admin/include/header.jsp"%>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<style>
	.main_font{
		font-size:30px;
		text-align: left;
	}
	.font_title{
	
	font-weight: bold;
	
	}
	.personel{
	width:200px;
	height:200px;
	background-color: #F7F7F7;
	text-align: center;
	border:1px solid gray;
	}
</style>
<center>

<form action ="" name="Form1" id="Form1">
<c:choose>
	<c:when test="${gongji eq '1' }">
		<table height=50 />
				<table width=1200 height=50>
			<tr>
				<td class="main_font" style="color:#5055B1;">공지사항 관리</td>
			</tr>
		</table>
<table border=0 width=1200 height=30 align=center>
		<tr>			
		<td width=850>
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
		<a href="list?pageNum=${startPage - pageBlock }&gongji=1">[이전]</a>
	</c:if>
	</td>
	
	<!-- 페이징 링크 -->
	<td width=110 style="text-align:center;font-size:22px;">
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${pageNum == i }">
				<a href="list?pageNum=${i }&gongji=1"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
			</c:when>
			<c:otherwise>					
				<a href="list?pageNum=${i }&gongji=1"><span style="padding:0px 4px;">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</td>			
	<!-- 다음 링크 -->
	<td width=60 style="text-align:center">
	<c:if test="${endPage < pageCount }">
		<a href="list?pageNum=${startPage + pageBlock }&gongji=1">[다음]</a>
	</c:if>
	</td>
	<td width=100><button onClick="check_select();return false;" style="cursor:pointer;font-size:17px;margin:auto;" class="custom-choice btn-choice">삭제</button></td>
</c:if>
	<tr>
</table>
		
		
		<table height=15/>
		<table width=1200 border=0 style="border:1px solid #5055B1;height:25px;">
			<tr>
				<td width=50><input type="checkbox" name="all" value="checkbox" onclick="checkall()"></td>
				<td width=100>NO</td>
				<td width=750>공지 제목</td>
				<td width=100>작성자</td>
				<td width=200>등록일</td>
			</tr>
		</table>
		<c:set var="numbering" value="${1 }"/>
		<c:forEach var="list" items="${v }">
		<table width=1200 height=50 style="border-bottom: 1px solid gray">
			<tr>
				<td width=50><input type="checkbox" name="ap_check" value="${list.uid }"></td>
				<td width=100>${numbering }</td>
				<td width=750><a href="view?uid=${list.uid }">${list.subject }</a></td>
				<td width=100>${list.name }</td>
				<td width=200>${list.signdate }</td>
			</tr>
		</table>
		<c:set var="numbering" value="${numbering+1 }" />
		</c:forEach>
		<table width=1200 align=center>
			<tr>
				<td style="text-align: right"><input type="button" value="글쓰기" onclick="location.href='write?gongji=1'" class="custom-choice btn-choice"></td>
			</tr>
		</table>
	</c:when>
	<c:otherwise>
		<table height=50></table>
		<table width=1200 height=50>
			<tr>
				<td class="main_font" style="color:#5055B1;">자주 묻는 질문</td>
			</tr>
		</table>
		<table width=1200>
			<tr>
				<td style="text-align: right"><input type="button" value="글쓰기" onclick="location.href='write?gongji=3'" class="custom-choice btn-choice" ></td>
			</tr>
		</table>
		
		
		<!-- 반복문 시작 -->
		<c:set var="i" value="${0 }" />
		<c:forEach var="list" items="${v }">
		<table width=1200 height=80 style="text-align: center;border-bottom: 1px solid black" border=0 >
			<tr>
				<td width=100 align="center"><img src="/img/question_mark.png" style="width:35px;height:35px;"></td>
				<td width=800 style="text-align: left" onclick="drop_down(${i})">[${list.option }]${list.subject }
				</td>
				<td width=200>${list.signdate }</td>
				<td><a href="modify?uid=${list.uid }&gongji=3">수정</a></td>
				<td><a href="delete?uid=${list.uid }&gongji=${list.gongji}">삭제</a></td>
					
			</tr>
		</table>
		<span id="abc" name = "drop" style="display:none;background-color:#F7F7F7 ;width:1200px;text-align:left" >${fn:replace(list.comment, LF, '<br>')}</span>
		<c:set var="i" value="${i +1 }"/>
		</c:forEach>
<!-- 		<table width=1200> -->
<!-- 			<tr> -->
<!-- 				<td style="text-align: right"><input type="button" value="글쓰기" onclick="location.href='write?gongji=3'" class="custom-choice btn-choice" ></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
	
</c:otherwise>
</c:choose>
</form>
</center>


<script>
function drop_down(num){
	
	if($("span[name=drop]:eq("+num+")").css("display") == "none"){
		$("span[name=drop]:eq("+num+")").show("fast");	
	}else{
		$("span[name=drop]:eq("+num+")").hide("fast");	
	}	
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
		location.href="delete?uid="+check_hide+"&gongji=1";
}
</script>
