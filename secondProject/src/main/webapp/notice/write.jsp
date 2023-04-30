<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<%@ include file ="/include/header2.jsp"%>
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
<script>
function write_go(){
	if(option.value==""){
		alert("옵션을 선택해주세요");
		return false;
		
	}
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
<center>
<table>
	<tr>
		<td height=200></td>
	</tr>
</table>
<table width=1000>
	<tr>
		<td style="font-size: 25px;font-weight: bold;">1:1 문의 접수</td>
		<td align=right width=100 style="font-size:20px;"><a href="main">고객센터</a></td>
		<td align=right width=100 style="font-size:20px;"><a href="write">새로고침</a></td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
</table>
<form name="write" action="write" method="post"  enctype="multipart/form-data" onsubmit="return write_go()">
<input type="hidden" name="gongji" value="2">
<table 	width=1000 height=50 style="border-bottom: 1px solid black">
</table>
<table width=1000>
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td>문의유형</td>
		<td>
			<select class="input_style" id="option" name="option">
				<option value="">문의 유형을 선택해주세요</option>
				<option value="member">회원정보서비스</option>
				<option value="order">주문/결제</option>
				<option value="delivery">배송/수령일 안내</option>
				<option value="item">도서/상품정보</option>
				<option value="used">중고 거래 관련</option>
			</select>
		</td>
	</tr>
	<tr><td height=15></td></tr>
	<tr>
		<td width=200>내용</td><td width=800><input id="subject" name="subject" placeholder="제목을 입력해주세요" class="input_style"></td>
	</tr>
	<tr><td height=15></td></tr>
	<tr>
		<td width=200></td><td width=800><textarea id ="comment" name="comment" placeholder="문의내용을 입력해주세요" style="width:100%;height:300px;"></textarea></td>
	</tr>
	<tr>
		<td width=200>사진 첨부</td><td width=800><input style="width:100%;border:0px;" value="빠른 답변을 위해 이미지를 첨부해주세요" readonly >
			
		</td>
	</tr>
	<tr>
		<td width=200></td>
		<td>
			<label for="file1"><img src ="/img/file_up.png"></label>
			<input type="file" id="file1" name="file1" onchange="readURL(this);" value="업로드" style="display: none">  
			<img id="preview" style="width:100px;height:120px;border:0px;"/>
			</td>
		<td></td>
		
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
		<td width=300 height=80><input type="button" style="background-color: gray" class="button_style" value="취소" onclick="window.history.back()"></td>
		<td width=30></td>
		<td width=300><button style="background-color:#5055B1" class="button_style">문의 접수</button></td>
	</tr>
</table>
</form>
</center>
<script>
function readURL(input) {
	
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	 
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	     
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}


</script>
