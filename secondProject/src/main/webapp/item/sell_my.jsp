<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header.jsp"%>
<script>
function cate_ch(str){
	$.ajax({
		url: "cate_big", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "code="+str, //데이터 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우
			$("#id_result").html(text);
		}
	});
}
function cate_ch2(str){
	$.ajax({
		url: "cate_middle", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "code="+str, //데이터 전달

		success:function(text){ //성공일 경우
			$("#id_result2").html(text);
		}
	});
}


</script>
<center>

<table height=250><tr><td></td></tr></table>

<table width=1900 border=0>
	<tr>
		<td><b>상품등록</b></td>
	</tr>
</table>

<form action="sell" method="post" enctype="multipart/form-data">
<table width=1100>
	<tr>
		<td>
			대분류 : 
			<select name ="kind_big" onchange="cate_ch(this.value)">
				<option value="">=대분류선택=</option>
				<c:forEach var="list" items="${v }">
					<option value="${list.code }">${list.ca_name }</option>
					
				</c:forEach>
			</select>
			<span id="id_result">
				<select>
					<option value="">=대분류 선택시 중분류 선택가능=</option>
				</select>
			</span>
			<span id="id_result2">
				<select >
					<option value="">=중분류 선택시  소분류 선택가능=</option>
				</select>
			</span>
		</td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>상품이미지 : <input type="file" name="image"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>상품정보이미지 : <input type="file" name="image2"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>출판사명 : <input name="n_publisher"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>도서명 : <input name="n_book"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>작가명 : <input name="n_writer"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td width=100>
			출판일 : 
			<input id="pudate1" name="pudate1" placeholder="년">
			<select id="pudate2" name = "pudate2">
				<option value="">월</option>
				<c:forEach var="i" begin="1" end="12">
					<option value="${i }">${i }월</option>
				</c:forEach>			
			<input id="pudate3" name="pudate3" placeholder="일">
		</td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>상품가격 : <input id="price1" name="price1"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>상품 수량 : <input name="qty"></td>
	</tr>
	<tr height=15></tr>
	
	<tr>
		<td> 상품소개 <br><textarea placeholder="상품설명" style="width:700px;height:50px;border:1px solid #D5D5D5;" name="comment"></textarea></td>
	</tr>
	
	<tr>
		<td> 책소개 메인 <br><textarea placeholder="책소개 메인" style="width:700px;height:100px;border:1px solid #D5D5D5;" name="cmt_main"></textarea></td>
	</tr>
	<tr>
		<td> 책소개 서브<br><textarea placeholder="책소개 서브" style="width:700px;height:200px;border:1px solid #D5D5D5;" name="cmt_sub"></textarea></td>
	</tr>

	<tr>
		<td> 작가 정보<br><textarea placeholder="작가정보" style="width:700px;height:200px;border:1px solid #D5D5D5;" name="cmt_writer"></textarea></td>
	</tr>
	<tr>
		<td> 목차 정보<br><textarea placeholder="목차" style="width:700px;height:200px;border:1px solid #D5D5D5;" name="cmt_index"></textarea></td>
	</tr>	
	
</table>

<table>
	<tr>
		<td><button>등록</button></td>
		
	</tr>
</table>
</form>
</center>
