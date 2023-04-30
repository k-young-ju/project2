<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp" %>
<style>
	input,button{
	height:40px;
	}
	.font{
	font-size: 15px;
	font-weight: bold;
	}
	
	.btn {
  margin: 1rem;
 .btn-ghost{--btn-color:var(--btn-bg);--btn-border:1px solid var(--btn-bg);background:0 0;transition:.3s}
 .btn-ghost:hover{--btn-color:white;background:var(--btn-bg)}
 
</style>
<center>


<table width="800" border=0>
	<tr height=25/>		
	<tr>
		<td style="text-align:center;color:#B464EB;vertical-align:bottom;"><h2>카테고리 관리</h2></td>
		
	</tr>
</table>

<table height=20/>
<table width=800 style="border:1px solid #5055B1" border=0>

	<tr>
		<td width=175 style="text-align:center;"><h2>상품코드</h2></td>
		<td width=175 style="text-align:center;"><h2>상품명</h2></td>
		<td width=120 style="text-align:center;"><h2>사용여부</h2></td>
		<td width=10/>
		<td width=160 style="text-align:right;"><input class="custom-choice btn-choice" type="button" onclick="location.href='insert'" value="카테고리 등록"></td>
	</tr>
</table>
<table width=800 border=0>
	<c:forEach var="list" items="${v }">
	<form action="modify" method="post">
	<tr>
			<td width=140><input name=code value="${list.code }"  class="font"></td>
			<td width=140><input name="ca_name" value="${list.ca_name }" class="font"></td>
			<td width=140 class="font">
				<table width=140 border=0>
					<tr>
						<td width=35 style="text-align:right;"><input type="radio" name="useyn" value="y" <c:if test="${list.useyn eq 'y' }">checked</c:if>></td>
						<td width=35>여</td>
						<td width=35 style="text-align:right;"><input type="radio" name="useyn" value="n" <c:if test="${list.useyn eq 'n' }">checked</c:if>></td>
						<td width=35>부</td>
					</tr>
				</table>
			</td>	
			<td width=100 class="font" ><button style="width:95%">상품수정</button></td>
			<td width=100 class="font"><input type="button" onclick="location.href='delete?code=${list.code}'" value="상품삭제" style="width:95%"></td>
	</tr>
	</form>
	</c:forEach>
</table>
<table>
	<tr>
		
		
	</tr>
</table>
<!-- 페이징 처리 -->

<table width=800 border=0 align=center>
	<tr>
		<td align=center>
			<c:if test="${count>0 }">
				<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
				<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
				<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
			
				<!-- 2개의 변수 초기화 -->
				<c:set var="startPage" value="${1 }" />
				<c:set var="pageBlock" value="${3 }" />	
			
				<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분--> 
				<c:if test="${pageNum > pageBlock }">
					<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
					<fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
					<c:set var="startPage" value="${result * pageBlock + 1 }" />
				</c:if>
			
				<!-- endPage 값 설정 부분 -->
				<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
				<c:if test="${endPage > pageCount }">
					<c:set var="endPage" value="${pageCount }" />
				</c:if>
			
				<!-- 이전 링크 -->
				<c:if test="${startPage > pageBlock }">
					<a href="list?pageNum=${startPage - pageBlock }">[이전] </a>
				</c:if>
			
				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
							<a href="list?pageNum=${i }&field=${field}&search=${search}&level=${level}&age1=${age1}&age2=${age2}"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="list?pageNum=${i }&field=${field}&search=${search}&level=${level}&age1=${age1}&age2=${age2}"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<!-- 다음 링크 -->
				<c:if test="${endPage < pageCount }">
					<a href="list?pageNum=${startPage + pageBlock }">[다음] </a>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>
</center>