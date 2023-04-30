<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table width=1400  border=0>
	<tr>
		<td style="text-align: left"><a href="/board/list?code_middle=${code }&list_option=${list_option}">${ca_name }전체</a></td>
	</tr>
</table>
<table width=1400>	
<c:set var="num" value="${0 }" />
	
<c:forEach var="list" items="${vm2 }">
		<c:if test="${num % 4 ==0 }"><tr></c:if>
			<td width=20 style="border-bottom: 1px solid black;height:30px;"></td>
			<td style="border-bottom: 1px solid black;height:30px;"><a href="/board/list?code_small=${list.code }&list_option=${list_option}">${list.ca_name }</a></td>
			<td width=20 height=60 style="border-bottom: 1px solid black;height:60px;"></td>
		<c:if test="${num % 4 ==3 }"></tr></c:if>
		<c:set var="num" value="${num+1 }" />
</c:forEach>
</table> 