<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<table width=200  border=0>
<c:set var="num" value="${0 }" />
<c:forEach var="list" items="${vm1 }">
	<tr>
			<td width=20 style="height:30px;"></td>
			<td name="modal_tab" style="border: 1px solid #5055B1;height:30px;text-align: center;color:#5055B1;cursor: poiner" onclick="kind_small_go('${list.code }','${list_option}','${list.ca_name }','${num }')">${list.ca_name }
					
			</td>
			<td width=20 height=60 style="height:60px;"></td>
	</tr>
		<c:set var="num" value="${num+1 }" />
</c:forEach>
</table>