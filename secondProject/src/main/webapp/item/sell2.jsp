<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp"%>
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
			$("#kind_big2").val(str);
			
		}
	});

	if(str == '20'){
		 $("#book").hide();
		 $("#used").show();
	}else{
		 $("#book").show();
		 $("#used").hide();
	}
}

function cate_ch2(str2){
	$.ajax({
		url: "cate_middle", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "code2="+str2, //데이터 전달

		success:function(text){ //성공일 경우
			$("#id_result2").html(text);
			$("#kind_middle2").val(str2);
		
		}
	});
}
function cate_ch3(str3){
	$("#kind_small2").val(str3);
		
}

function day_ch(month){
	//alert(month);
	$.ajax({
		url: "month_ch", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "month="+month, //데이터 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우\
			//alert(text);
			$("#day_result").html(text);
		
		}
		
	});
}
var level ="${m_level}";
//alert(level);
if(level==1){
	cate_ch('20');	
	
}

</script>
<style>
	.td{
	background-color:#5055B1;
	color:white;"
	}

	.input_style{
	height:25px;
	width:50%;
	padding:0px;
	}

	.name_style{
	height:25px;
	}
	input,select,button{
	border-radius: 10px;	
	}
	.layout{
	padding-left: 20px;
	}
	table{
	border-spacing:0.7px;
	}
</style>
<center>
<table height=20/>
<table width=800 border=0>
	<tr>
		<td style="text-align: center;color:#5055B1"><h2>상품등록</h2></td>
	</tr>
	<tr height=20/>
</table>

<form name="sell" action="sell" method="post" enctype="multipart/form-data" onsubmit="return sell_go()">
<table width=800 style="border:0px;" border=0>
	<tr height=15/>
	<tr>
		<td width=225 style="background-color:#5055B1;color:white;text-align:center;">상품분류 </td>
			<td width=640 style="padding-left:20px;">
				<select id="kind_big" name ="kind_big" onchange="cate_ch(this.value)" style="padding-left:10px;width:180px;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;text-align:center;">
					<option value="">=대분류선택=</option>
					<c:if test="${m_level >5 }">
					<option value="10">신간</option>
					</c:if>
					<option value="20" <c:if test="${m_level ==1 }">selected</c:if>>중고</option>
				</select>
			<span id="id_result">
				<select style="padding-left:10px;width:190px;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;text-align:center;">
					<option value="">=대분류 선택 필수=</option>
				</select>
			</span>
			<span id="id_result2">
				<select style="width:190px;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;text-align:center;">
					<option value="">=중분류 선택 필수=</option>
				</select>
			</span>
		</td>
	</tr>
<div id="book" style="<c:if test="${m_level ==1 }">display:none</c:if>">
	<tr height=20></tr>
	<tr>
		<td width=70 style="background-color:#5055B1;color:white;text-align:center;">상품 이미지
		</td>
		<td class="layout" style="border:2px solid #5055B1"><input type="file" id="image" name="image" style="border-radius: 0px;">
		</td>
	</tr>
	<tr height=15/>
	<tr>
		<td style="background-color:#5055B1;color:white;text-align:center;">상품 정보 이미지</td>
		<td class="layout" style="border:2px solid #5055B1"><input type="file" id="image2" name="image2" style="border-radius: 0px;"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td style="background-color:#5055B1;color:white;text-align:center;">출판사명</td>
		<td style="border:0px solid #5055B1"><input id="n_publisher" name="n_publisher" class="input_style" style="width:100%;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td style="background-color:#5055B1;color:white;text-align:center;">도서명</td>
		<td style="border:0px solid #5055B1"><input id="n_book" name="n_book" class="input_style" style="width:100%;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td style="background-color:#5055B1;color:white;text-align:center;">작가명</td>
		<td style="border:0px solid #5055B1"><input id="n_writer" name="n_writer" class="input_style" style="width:100%;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td style="background-color:#5055B1;color:white;text-align:center;">
			출판일
		</td>
		<td width=100 style="border:0px solid #5055B1">
			<select id="pudate1" name = "pudate1" style="width:150px;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;">
				<option value="">년</option>
				<c:set var="j" value="${year }"/>
				<c:forEach var="i" begin="1" end="5">
					<option value="${j }">${j }년</option>
					<c:set var="j" value="${j-1 }"/>
				</c:forEach>
			</select>
			<select id="pudate2" name = "pudate2" style="width:150px;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;" onchange="day_ch(this.value)">
				<option value="">월</option>
				<c:forEach var="i" begin="1" end="12">
					<option value="${i }" >${i }월</option>
				</c:forEach>
			</select>
			<span id="day_result">
				<select style="width:150px;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;">
					<option value="">일</option>
					<c:forEach var="i" begin="1" end="31">
					<option value="${i }">${i }일</option>
				</c:forEach>
				</select>
			</span>
		</td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td style="background-color:#5055B1;color:white;text-align:center;">상품가격</td>
		<td>
			<input type="number" id="price2" name="price2" style="width:100%;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;"></td>
			<input type="hidden" id="price1" name="price1" value="0">
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
		<td style="background-color:#5055B1;color:white;text-align:center;">상품 수량</td>
		<td><input type="number" id="qty" name="qty" class="input_style" maxlength=4 style="width:100%;height:27px;font-size:15px;border:1px solid #2323EF;border-radius:0px;"></td>
	</tr>
	<tr height=15/>
</table>
<table width=800 style="border:0px solid #5055B1;" border=0>
	<tr height=20/>
	<tr><td colspan="2" style="background-color:#5055B1;color:white;">상품소개</td></tr>
	<tr><td colspan="2"><textarea placeholder="상품설명" style="width:800px;height:80px;border:1px solid #2323EF;" id="comment" name="comment"></textarea></td></tr>
	<tr><td colspan="2" style="background-color:#5055B1;color:white;">책소개 메인 </td><tr>	
	<tr>
		<td colspan="2"><textarea placeholder="책소개 메인" style="width:800px;height:100px;border:1px solid #2323EF;" id="cmt_main" name="cmt_main"></textarea></td>
	</tr>
	<tr><td colspan="2" style="background-color:#5055B1;color:white;">책소개 서브</td><tr>	
	<tr>
		<td colspan="2"><textarea placeholder="책소개 서브" style="width:800px;height:200px;border:1px solid #2323EF;" id="cmt_sub" name="cmt_sub"></textarea></td>
	</tr>
	<tr><td colspan="2" style="background-color:#5055B1;color:white;">작가 정보</td><tr>
	<tr>
		<td colspan="2"><textarea placeholder="작가정보" style="width:800px;height:200px;border:1px solid #2323EF;" id="cmt_writer" name="cmt_writer"></textarea></td>
	</tr>
	<tr><td colspan="2" style="background-color:#5055B1;color:white;">목차 정보</td><tr>
	<tr>
		<td colspan="2"><textarea placeholder="목차" style="width:800px;height:200px;border:1px solid #2323EF" id="cmt_index" name="cmt_index"></textarea></td>
	</tr>	
</table>
<table height=20/>
<table width=800 border=0>
	<tr>
		<td style="text-align:center;padding-right:20px;border:0px;"><button style="width:500px;height:50px;background-color:#5055B1;color:white;font-size:30px;border:0px;" >등록</button></td>
	</tr>
</table>
</form>
</div>
<div id="used" style="display: none;<c:if test="${m_level ==1 }">display:inline</c:if>">
<form name="sell_used" action="sell_used" method="post" enctype="multipart/form-data" onsubmit="return sell_used_go()">
	<input  type="hidden" id = "kind_big2" name="kind_big" value="20"> 
	<input  type="hidden" id = "kind_middle2" name="kind_middle" value="">
	<input  type="hidden" id = "kind_small2" name="kind_small">
	<table width=800 border=1>
		<tr>
			<td width=150>대표 이미지</td>
			<td class="layout"><input type="file" id ="image" name="image" style="border-radius: 0px;"></td>
		</tr>
		<tr height=15></tr>
		<tr>
			<td>상품정보이미지</td>
			<td class="layout">
				<input type="file" id ="image2" name="image2" style="border-radius: 0px;">
				<input type="file" id ="image3" name="image3" style="border-radius: 0px;">
				<input type="file" id ="image4" name="image4" style="border-radius: 0px;">
				<input type="file" id ="image5" name="image5" style="border-radius: 0px;">
			</td>
		</tr>
		<tr height=15></tr>
		<tr>
		<td>제목</td>
		<td class="layout"><input id="n_book" name="n_book" class="input_style"></td>
	</tr>
		<tr height=15></tr>
		<tr>
			<td>가격</td>
			<td class="layout">
			<input type="number" id="price4" name="price4"></td>
			<input id="price3" name="price3" type="hidden" value="0">
			</td>
	
			<!-- 원처리 -->
			<script>
			$(function() {
				  $('#price4').on('change', function() {
					  price3.value = price4.value;  
				     var n = $(this).val();
				   	 n = Math.floor(n/1000) * 1000; 
				     //alert(n);  
				     $(this).val(n);
				  });
				});
			</script>
		</tr>
		<tr>
			<td colspan="2"> 상세설명 <br><textarea placeholder="상세설명" style="width:700px;height:50px;border:1px solid #D5D5D5;" id="comment" name="comment"></textarea></td>
		</tr>
		<tr height=15></tr>
	</table>
	<table height=20/>
	<table>
	<tr>
		<td style="padding-left: 70px"><button style="width:500px;height:50px;background-color:#5055B1;color: white;font-size: 30px" >등록</button></td>
		
	</tr>
</table>
</form>	
</div>
<table height=100 />

</center>
<%@ include file = "/include/footer.jsp"%>

<script>
function sell_go(){ //신간 판매 등록
	if(sell.kind_big.value == ""){
		alert("대분류를 입력해주세요");
		sell.kind_big.focus();
		return false;
	}
	if(sell.kind_middle.value==""){
		alert("중분류를 입력해주세요");
		sell.kind_middle.focus();
		return false;
	}
	if(sell.kind_small.value==""){
		alert("소분류를 입력해주세요");
		sell.kind_small.focus();
		return false;
	}
	if(sell.image.value==""){
		alert("상품의 빠른 판매를 위해 상품이미지를 등록해주세요");
		sell.image.focus();
		return false;
	}
	if(sell.image2.value==""){
		alert("상품의 빠른 판매를 위해 상품의 상세 이미지를 등록해주세요");
		sell.image2.focus();
		return false;
	}
	if(sell.n_publisher.value==""){
		alert("출판사를 입력해주세요");
		sell.n_publisher.focus();
		return false;
	}
	if(sell.n_book.value==""){
		alert("도서명을 입력해주세요");
		sell.n_book.focus();
		return false;
	}
	
	if(sell.pudate1.value==""){
		alert("출판일을 입력해주세요");
		sell.pudate1.focus();
		return false;
	}
	if(sell.pudate2.value==""){
		alert("출판일을 입력해주세요");
		sell.pudate2.focus();
		return false;
	}
	if(sell.pudate3.value==""){
		alert("출판일을 입력해주세요");
		sell.pudate3.focus();
		return false;
	}
	if(sell.price1.value==""){
		alert("상품가격을 입력해주세요");
		sell.price1.focus();
		return false;
	}
	if(sell.qty.value==""){
		alert("상품수량을 입력해주세요");
		sell.qty.focus();
		return false;
	}
	if(sell.comment.value==""){
		alert("상품소개를 작성해주세요");
		sell.comment.focus();
		return false;
	}
	
}

function sell_used_go(){//중고 판매 등록
	
	if(sell.kind_middle.value==""){
		alert("중분류를 입력해주세요");
		sell.kind_middle.focus();
		return false;
	}
	if(sell.kind_small.value==""){
		alert("소분류를 입력해주세요");
		sell.kind_small.focus();
		return false;
	}
	if(sell_used.image.value==""){
		alert("대표 이미지를 등록해주세요");
		sell_used.image.focus();
		return false;
	}
	if(sell_used.image2.value==""){
		alert("상품의 빠른 판매를 위해 상품의 상세 이미지 4개를 등록해주세요");
		sell_used.image2.focus();
		return false;
	}
	if(sell_used.image3.value==""){
		alert("상품의 빠른 판매를 위해 상품의 상세 이미지 4개를 등록해주세요");
		sell_used.image3.focus();
		return false;
	}
	if(sell_used.image4.value==""){
		alert("상품의 빠른 판매를 위해 상품의 상세 이미지 4개를 등록해주세요");
		sell_used.image4.focus();
		return false;
	}
	if(sell_used.image5.value==""){
		alert("상품의 빠른 판매를 위해 상품의 상세 이미지 4개를 등록해주세요");
		sell_used.image5.focus();
		return false;
	}
	if(sell_used.n_book.value==""){
		alert("제목을 입력해주세요");
		sell_used.n_book.focus();
		return false;
	}
	if(sell_used.price1.value==""){
		alert("가격을 입력해주세요");
		sell_used.price1.focus();
		return false;
	}
	if(sell_used.comment.value==""){
		alert("상품에 대한 설명을 작성해주세요");
		sell_used.comment.focus();
		return false;
	}
	
}

</script>