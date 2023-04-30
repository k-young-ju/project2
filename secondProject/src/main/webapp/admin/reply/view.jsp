<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/admin/include/header.jsp"%>
<style>
	.nameNSigndate{
	font-size: 15px;
	height:50px;
	padding-top:10px;
	padding-bottom:50px;
	border-bottom: 1px solid black;
	}
	.button_style{
	text-align: center;
	color: #5055B1;
	font-size: 25px;
	background-color: white;
	border:1px solid #5055B1;
	border-radius: 15px;
	height:60px;
	width:300px;;
	
	}
	.fnn{
	border-bottom: 1px soild black;

	}
</style>
<center>
<table>
	<tr>
		<td height=200></td>
	</tr>
</table>
<table width=1200 border=0>
	<tr>
		<td colspan="2" style="font-size: 30px;font-weight: bold">${n.subject }</td>
	</tr>
	<tr>
		<td width=50 class="nameNSigndate">${n.name }</td>
		<td class="nameNSigndate">${n.signdate }</td>
	</tr>
</table>
<p style="height:25px;"></p>
<table width=1200 height=500 border=0 style="border-bottom: 1px solid gray">
	<tr>
		<td valign="top" style="padding-top: 30px;">${fn:replace(n.comment, LF, '<br>')} </td>
	</tr>
</table>
<table height=50/>
<table width=1200 border=0>
	<tr>
		<td align="center" style="background-color: white"><input type="button" class="button_style" value="목록" onclick="location.href='list'"></td>
		<c:choose>
			<c:when test="${fn:contains(n.subject,'[답변]') }">
				<td align="center" style="background-color: white"><input type="button" class="button_style" value="답변수정" onclick="location.href='modify?uid=${n.uid}'"></td>
			</c:when>
			<c:otherwise>
				<td align="center" style="background-color: white"><input type="button" class="button_style" value="답변달기" onclick="location.href='write?uid=${n.uid}'"></td>
			</c:otherwise>
		</c:choose>
	</tr>
</table>
</center>
<table height=100></table>
<%@ include file = "/include/footer.jsp"%>