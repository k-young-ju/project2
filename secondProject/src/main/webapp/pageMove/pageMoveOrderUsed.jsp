<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
		<table border=0 width=1200 align=center>
				<tr>			
				<td width=900>
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
				<td width=75 style="text-align:center">
				<c:if test="${startPage > pageBlock }">
					<a href="javascript:callFunction2(${startPage - pageBlock },'orderUsed');">[이전]</a>
				</c:if>
				</td>
				
				<!-- 페이징 링크 -->
				<td width=100 style="text-align:center;font-size:25px;">
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
<%-- 							<a href="my_page?pageNum=${i }" target="_self"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a> --%>
<%-- 							<a href="javascript:callFunction('mileage','new',${i });"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a> --%>
							<a href="javascript:callFunction2(${i },'orderUsed');"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
						</c:when>
						<c:otherwise>
<%-- 							<a href="my_page?pageNum=${i }" target="_self"><span style="padding:0px 4px;">${i }</span></a> --%>
<%-- 							<a href="javascript:callFunction('mileage','new',${i });"><span style="padding:0px 4px;">${i }</span></a> --%>
							<a href="javascript:callFunction2(${i },'orderUsed');"><span style="padding:0px 4px;">${i }</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</td>			
				<!-- 다음 링크 -->
				<td width=75 style="text-align:center">
				<c:if test="${endPage < pageCount }">
					<a href="javascript:callFunction2(${startPage + pageBlock },'orderUsed');">[다음]</a>
				</c:if>
				</td>
			</c:if>
				<tr>
			</table>    
    
    	<table width=1200 border=0>
		<tr height=20/>
		<tr height=45>
			<td width=240 style="text-align:center;" id="tdcolor">주문번호</td>
			<td width=240 style="text-align:center;" id="tdcolor">상품명</td>
			<td width=240 style="text-align:center;" id="tdcolor">판매자명</td>
			<td width=240 style="text-align:center;" id="tdcolor">판매가</td>
			<td width=240 style="text-align:center;" id="tdcolor">주문상태</td>
			<td width=240 style="text-align:center;" id="tdcolor">요청사항</td>
			<td width=240 style="text-align:center;" id="tdcolor">상세보기</td>
			<td width=240 style="text-align:center;" id="tdcolor">주문취소</td>
		</tr>
		<tr height=1><td style="border-bottom:2px solid #5055B1;" colspan=9/></tr>
		<c:set var="i" value="${0 }"/>
		<c:forEach var="lists" items="${v8 }" varStatus="status"> 
		<tr height=80>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${lists.od_id }</td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${lists.subject}</td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${lists.id}</td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;<fmt:formatNumber value="${lists.od_price }"/></td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${lists.od_status }</td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${lists.require1 }	</td>	
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;<a href="/order/orderViewDetail?od_id=${lists.od_id }&od_point=${list.od_point }&mb_id=${list.mb_id }&order_option=b&pageNum=${pageNum}&pageName=orderUsed&option2=used&where=Order">상세보기</a></td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;<c:if test="${lists.od_status eq '주문' }"><a href="/order/cancel?od_id=${lists.od_id }&order_option=myPage">주문취소</a></c:if></td>		
		</tr>
		<c:set var="i" value="${i + 1 }"/>
		</c:forEach>
		