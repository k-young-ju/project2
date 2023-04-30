<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String location = (String)request.getAttribute("location");

	if(location.equals("admin")){
%>
<%@ include file = "/admin/include/header.jsp"%>
<%}else{ %>
<%@ include file = "/include/header2.jsp"%>
<%} %>
<script>
//중분류
function cate_ch(str,str2){
	//alert("1");
	$.ajax({
		url: "cate_big", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "code="+str+"&code2="+str2, //데이터 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우
			$("#id_result").html(text);
		}
	});
}

//소분류
function cate_ch2(str2,str3){
	$.ajax({
		url: "cate_middle", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "code2="+str2+"&code3="+str3, //데이터 전달

		success:function(text){ //성공일 경우
			$("#id_result2").html(text);
		}
	});
}
//중분류 자동실행
cate_ch('${i.kind_big}','${i.kind_middle}');

//소분류 자동실행
cate_ch2('${i.kind_middle}','${i.kind_small}');

function modify_go(){
	if(modify.kind_middle.value==""){
		alert("중분류를 입력해주세요");
		modify.kind_middle.focus();
		return false;
	}
	if(modify.kind_small.value==""){
		alert("소분류를 입력해주세요");
		modify.kind_small.focus();
		return false;
	}

	if(modify.n_book.value==""){
		alert("제목을 입력해주세요");
		modify.n_book.focus();
		return false;
	}
	if(modify.price1.value==0 || modify.price2.value==0){
		alert("가격을 입력해주세요");
		modify.price1.focus();
		return false;
	}
	if(modify.comment.value==""){
		alert("상품에 대한 설명을 작성해주세요");
		modify.comment.focus();
		return false;
	}
	document.modify.submit();
}
</script>

<style>
	.input_style{
	height:27px;
	}

	.name_style{
	height:25px;
	}
	select,button{
	border-radius: 7px;	
	}
	.layout{
	padding-left: 20px;
	}
	input{
	outline:none;
	}
</style>
<center>
<table width=800 border=0>
	<tr height=40/>
	<tr>
		<td style="text-align: center;color:#5055B1"><h2>상품수정</h2></td>
	</tr>
</table>
<p style="height:20px;"></p>

<form name="modify" action="" method="post" enctype="multipart/form-data" onsubmit="modify_go()">
<input type="hidden" name="uid" value="${i.uid }">
<input type="hidden" name="pageNum" value="${pageNum }">
<input type="hidden" name="pageNum2" value="${pageNum2 }">
<input type="hidden" name="pageName" value="productUsed">
<input type="hidden" name="useyn" value="y"W>

<table width=800 border=0>
	<tr>
		<td width=150 style="background-color:#5055B1;color:white;text-align:center;">상품분류 </td>
		<td style="border:0px solid #5055B1;padding-left:20px;"> 
				<input name ="kind_big" value="${cb.ca_name }" readonly style="padding-left:10px;width:180px;height:26px;font-size:15px;border:1px solid #2323EF;border-radius:0px;">
			<span id="id_result">
			</span>
			<span id="id_result2">
			</span>
		</td>
	</tr>
	<tr height=20/>
</table>
	<table width=800 border=0 style="border:0px solid #5055B1">
		<tr>
			<td width=150 style="background-color:#5055B1;color:white;text-align:center;">대표 이미지</td>
			<td class="layout" style="border:1px solid #5055B1">
			<img src="/upload/${i.image }" style="width:50px;height:50px;">
			<input type="file" name="image" style="border-radius: 0px;">
			</td>
		</tr>
		<tr height=15></tr>
		<tr>
			<td style="background-color:#5055B1;color:white;text-align:center;">상품정보이미지</td>
			<td class="layout" style="border:1px solid #5055B1">
				<img src="/upload/${i.image2 }" style="width:50px;height:50px;">
				<input type="file" name="image2" style="border-radius: 0px;" >
				
				<img src="/upload/${i.image3 }" style="width:50px;height:50px;">
				<input type="file" name="image3" style="border-radius: 0px;" >
				
				<img src="/upload/${i.image4 }" style="width:50px;height:50px;">
				<input type="file" name="image4" style="border-radius: 0px;" >
				
				<img src="/upload/${i.image5 }" style="width:50px;height:50px;">
				<input type="file" name="image5" style="border-radius: 0px;" >
			</td>
		</tr>
		<tr height=15></tr>
		<tr>
		<td style="background-color:#5055B1;color:white;text-align:center;">제목</td>
		<td class="layout" style="border:1px solid #5055B1"><input name="n_book" class="input_style" value="${i.n_book }" style="border:1px solid #9C9C9C;border:0px;height:27px;width:100%;"></td>
	</tr>
		<tr height=15></tr>
		<tr>
			<td style="background-color:#5055B1;color:white;text-align:center;">가격</td>
			<td class="layout" style="border:1px solid #5055B1">
						<input type="text" style="border:0px;outline:none;height:27px;width:100%;" id="price2" name="price2" value="<fmt:formatNumber value="${i.price1 }" />"></td>
						<input type="hidden" id="price1" name="price1" value="${i.price1 }">
			</td>
			<!-- 원처리 -->
			<script>
			$(function() {
				  $('#price2').on('change', function() {
					  price1.value = price2.value;  
				     var n = $(this).val();
				   	 n = Math.floor(n/1000) * 1000; 
				     //alert(n);  
				     $(this).val(n);
				  });
				});
			</script>	
			
		</tr>
		<tr height=15></tr>
		<tr>
		<td style="background-color:#5055B1;color:white;text-align:center;">사용여부</td>
		<td class="layout" style="border:1px solid #5055B1"><input type="radio" id="useyn" name="useyn" value="y" <c:if test="${i.useyn eq 'y' }">checked</c:if>> Y
					<input type="radio" id="useyn" name="useyn" value="n" <c:if test="${i.useyn eq 'n' }">checked</c:if>>N</td>
		
		
		<tr height=15></tr>
		<tr>
			<td colspan="2" style="background-color:#5055B1;color:white;vertical-align:middle;">상세설명 <br><textarea placeholder="상품설명" style="width:800px;height:300px;border:1px solid #5055B1;outline:none;" name="comment">${i.comment }</textarea></td>
		</tr>
	</table>
	<table>
	<tr height=20/>
	<tr>
		<td style="border:0px;"><input type="button" style="width:300px;height:50px;background-color:#F87B1F;color:white;font-size:30px;border:0px;border-radius:7px;" value="목록" onclick="location.href='/member/my_page?option=product&option2=used&pageNum=${pageNum}&pageName=${pageName }&option=product&option2=used'"></td>
		<td style="padding-left: 70px"><button style="width:300px;height:50px;background-color:#5055B1;color: white;font-size:30px;border:0px;" >수정</button></td>
		
	</tr>
	<c:if test="${sessionScope.m_level eq 10}">
	<tr height=20/>
	<tr>
		<td style="border:0px;" colspan=2><input type="button" style="width:100%;height:50px;background-color:##C5C5C5;color:black;font-size:30px;border:0px;border-radius:7px;" value="관리자 목록" onclick="location.href='/admin/item/list?option=used&pageNum2=${pageNum2}'"></td>
	</tr>
	</c:if>
</table>
<table height=100 />
</form>
</center>	
<script>
// function commas(t) {
// 	// 콤마 빼고 
// 	var x = t.value;			
// 	x = x.replace(/,/gi, '');

//         // 숫자 정규식 확인
// 	var regexp = /^[0-9]*$/;
// 	if(!regexp.test(x)){ 
// 		$(t).val(""); 
// 		alert("숫자만 입력 가능합니다.");
// 	} else {
// 		x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
// 		$(t).val(x);			
// 	}
// }
</script>
<%@ include file = "/include/footer.jsp"%>