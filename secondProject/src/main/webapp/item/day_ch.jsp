<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <select id="pudate3"  name = "pudate3" style="width:150px;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;">
	<option value="">일</option>
	
	<c:choose>
		<c:when test="${month == 1 or month == 3 or month == 5 or month == 7 or month == 8 or month == 10 or month == 12}">
			<c:forEach var="i" begin="1" end="31">	
				<option value="${i }">${i}일</option>
			</c:forEach>
		</c:when>
		<c:when test="${month ==2 }">
			<c:forEach var="i" begin="1" end="28">	
				<option value="${i }">${i}일</option>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="i" begin="1" end="30">	
				<option value="${i }">${i}일</option>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</select>