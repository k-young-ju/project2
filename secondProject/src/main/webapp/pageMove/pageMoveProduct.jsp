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
					<a href="javascript:callFunction(${startPage - pageBlock },'product');">[이전]</a>
				</c:if>
				</td>
				
				<!-- 페이징 링크 -->
				<td width=100 style="text-align:center;font-size:25px;">
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
<%-- 							<a href="my_page?pageNum=${i }" target="_self"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a> --%>
<%-- 							<a href="javascript:callFunction('mileage','new',${i });"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a> --%>
							<a href="javascript:callFunction(${i },'product');"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
						</c:when>
						<c:otherwise>
<%-- 							<a href="my_page?pageNum=${i }" target="_self"><span style="padding:0px 4px;">${i }</span></a> --%>
<%-- 							<a href="javascript:callFunction('mileage','new',${i });"><span style="padding:0px 4px;">${i }</span></a> --%>
							<a href="javascript:callFunction(${i },'product');"><span style="padding:0px 4px;">${i }</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</td>			
				<!-- 다음 링크 -->
				<td width=75 style="text-align:center">
				<c:if test="${endPage < pageCount }">
					<a href="javascript:callFunction(${startPage + pageBlock },'product');">[다음]</a>
				</c:if>
				</td>
			</c:if>
				<tr>
			</table>    
			
			<table width=1200 border=0 style="text-align:center">
					<tr>
						<td width=150 >이미지</td>
						<td width=100>분류코드</td>
						<td width=150>출판사</td>
						<td width=150>도서명</td>
						<td width=100>작가명</td>
						<td width=150>출판일</td>
						<td width=100>가격</td>
						<td width=100>도서 수량</td>
						<td width=50>Mode</td>
						<td width=100>사용여부</td>
						
					</tr>
					<tr height=20><td colspan=10 style="border-bottom:2px solid #5055B1;"></td></tr>
					<c:forEach var="list" items="${v }">	
					<tr style="text-align: center" onclick="location.href='/board/view?uid=${list.uid}&list_option=2'">
						<td width=150 style="border-bottom:2px solid #5055B1;"><img src="/upload/${list.image }" style="width:90px;height:80px;vertical-align:middle;"></td>
						<td width=100 style="border-bottom:2px solid #5055B1;">${list.kind_small }</td>
						<td width=150 style="border-bottom:2px solid #5055B1;">${list.n_publisher }</td>
						<td width=150 style="border-bottom:2px solid #5055B1;">${list.n_book }</td>
						<td width=100 style="border-bottom:2px solid #5055B1;">${list.n_writer }</td>
						<td width=150 style="border-bottom:2px solid #5055B1;">${list.pudate }</td>
						<td width=100 style="border-bottom:2px solid #5055B1;"><fmt:formatNumber value="${list.price1 }"/></td>
						<td width=100 style="border-bottom:2px solid #5055B1;">${list.qty }</td>
						<td width=50 style="border-bottom:2px solid #5055B1;">
							<a href="/board/modify?uid=${list.uid }&pageNum=${pageNum }">수정</a>
						</td>
						<c:choose>
							<c:when test="${list.useyn eq 'y' }">
								<td width=100 style="border-bottom:2px solid #5055B1;">여</td>
							</c:when>
							<c:otherwise>
								<td width=100 style="border-bottom:2px solid #5055B1;">부</td>
							</c:otherwise>
						</c:choose>	
					</tr>
					</c:forEach>
				</table>
				</form>