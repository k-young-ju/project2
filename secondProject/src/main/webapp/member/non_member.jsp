<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<body>
<center>
<table border=0>
	<tr>
		<td><a href="/"><img src = "/img/Logo5.png" style="width:615px;height:170px"> </a></td>
	</tr>
</table>
<form name="non" action="non_member" method="post" onsubmit="return login_go()">
<table width=500 border=0>
	<tr>
		<td style="border:1px solid black;border-radius: 15px;border-collapse: collapse;"> 
			<input id="non_id" name="non_id" placeholder="주문번호를 입력해주세요" style="width:100%;height:60px;border: 0px;border-radius: 15px;padding: 0px" ><br>
			
		</td>
	</tr>
</table>
<p height=30></p>
<table align="center" width=500 >
	<tr>
		<td style="border:1px solid black;border-radius: 15px;height:50px;background-color: #5055B1;color: white" ><button style="width:100%;border:0px;color: white;background-color: #5055B1;color: white;font-size: 30px">조회</button></td>
	</tr>
</table>
</form>
<script>
function login_go(){
	if(non.non_id.value==""){
		alert("주문번호를 입력해주세요");
		return false;
	}
	
}
</script>