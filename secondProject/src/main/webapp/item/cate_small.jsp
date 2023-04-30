<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<select name="kind_small" onchange="cate_ch3(this.value)" style="width:190px;height:28px;font-size:15px;border:1px solid #2323EF;border-radius:0px;text-align:center;">
	<option value="">=소분류 선택=</option>
	<c:forEach var="list" items="${v }">	
	<option value="${list.code }" <c:if test="${code3 == list.code }">selected</c:if>>${list.ca_name }</option>
</c:forEach>
</select>    
