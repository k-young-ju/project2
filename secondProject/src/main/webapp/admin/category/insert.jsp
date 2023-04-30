<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp" %>
<center>
<form action="insert" method="post">
<!-- <table> -->
<!-- 	<tr> -->
<!-- 		<td> -->
<!-- 			<ul>상품 분류 코드</ul> -->
<!-- 			code : <input name="code"><br> -->
<!-- 			<ul>상품명</ul> -->
<!-- 			상품명 : <input name="ca_name"> -->
<!-- 			<ul>사용여부 -->
<!-- 				<input type="radio" name="useyn" value='y' >사용 -->
<!-- 				<input type="radio" name="useyn" value='n' >미사용 -->
<!-- 			</ul> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->
<table height=50/>
<table>
	<tr>
		<td colspan=3 align=center style="font-size:23px;">상품 분류 코드</td>
	</tr>
	<tr height=10/>
	<tr>
		<td></td>
		<td>code : </td>
		<td><input name="code" maxlength="6"></td>
	</tr>
	<tr height=10/>	
	<tr>
		<td colspan=3 align=center style="font-size:23px;">상품명</td>
	</tr>
	<tr height=10/>
	<tr>
		<td></td>
		<td>상품명 : </td>
		<td><input name="ca_name"></td>
	</tr>
	<tr height=10/>
	<tr>
		<td></td>
		<td>사용여부</td>
		<td><input type="radio" name="useyn" value='y' >사용  <input type="radio" name="useyn" value='n' >미사용</td>
	</tr>	
	<tr height=10/>		
</table>

<table>
	<tr>
		<td><button class="custom-choice btn-choice">등록</button></td>
	</tr>
</table>
</form>
</center>