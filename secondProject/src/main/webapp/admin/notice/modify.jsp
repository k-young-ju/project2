<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<%@ include file ="/admin/include/header.jsp"%>
<style>
	.input_style{
		width:100%;
		height:30px;
		
	}
	.button_style{
		width:100%;
		height:70px;
		color:white;
		border-radius: 15px;
		font-size: 25px;
		font-weight: bold;
	}
</style>
<center>
<table>
	<tr>
		<td height=200></td>
	</tr>
</table>
<table width=1000>
	<tr>
		<td style="font-size: 25px;font-weight: bold;">공지사항 수정</td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
</table>
<form action="modify" method="post" onsubmit="return modify_go()">
<input  type="hidden" name="uid" value="${n.uid }">
<table 	width=1000 height=50 style="border-bottom: 1px solid black">
</table>
<table width=1000>
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td>문의유형</td>
		<td>
			<input type="radio" name="gongji" value="1" <c:if test="${n.gongji eq 1 }">checked</c:if>>공지사항
			<input type="radio" name="gongji" value="3" <c:if test="${n.gongji eq 3 }">checked</c:if>>자주묻는 질문
		</td>
	</tr>
	<tr><td height=15></td></tr>
	<c:choose>
		<c:when test="${n.gongji == 3 }">
			<tr>
		<td>문의유형</td>
		<td>
			<select class="input_style" id="option" name="option" >
				<option value="">문의 유형을 선택해주세요</option>
				<option value="member" <c:if test="${n.option eq '회원정보 서비스'}">selected</c:if>>회원정보 서비스</option>
				<option value="order" <c:if test="${n.option eq '주문/결제'}">selected</c:if>>주문/결제</option>
				<option value="delivery" <c:if test="${n.option eq '배송/수령일 안내'}">selected</c:if>>배송/수령일 안내</option>
				<option value="item" <c:if test="${n.option eq '도서/상품정보'}">selected</c:if>>도서/상품정보</option>
				<option value="used" <c:if test="${n.option eq '중고 거래 관련'}">selected</c:if>>중고 거래 관련</option>
			</select>
		</td>
	</tr>		
		</c:when>
		<c:otherwise>
			<tr></tr>
		</c:otherwise>
	</c:choose>
	<tr>
		<td width=200>내용</td><td width=800><input id="subject" name="subject" value="${n.subject }" class="input_style"></td>
	</tr>
	<tr><td height=15></td></tr>
	<tr>
		<td width=200></td><td width=800><textarea id="comment" name="comment"  style="width:100%;height:300px;">${n.comment }</textarea></td>
	</tr>

</table>
<table >
	<tr>
		<td></td>
	</tr>
</table>
<p style="height:30px;"></p>
<table width=830 border=0>
	<tr>
		<td width=200></td>
		<td width=300 height=80><input type="button" style="background-color: gray" class="button_style" value="취소" onclick="location.href='/';"></td>
		<td width=30></td>
		<td width=300><button style="background-color:#5055B1" class="button_style">공지 수정</button></td>
	</tr>
</table>
</form>
</center>
<script>
function modify_go(){
	
	if(subject.value == ""){
		alert("제목을 입력해주세요");
		return false;
	}
	if(comment.value == ""){
		alert("내용을 입력해주세요");
		return false;
	}
	document.write.submit();
}
</script>

