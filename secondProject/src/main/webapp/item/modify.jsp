<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp"%>
<style>
/* 첨부파일디자인변경 */
.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}
/* 첨부파일디자인변경완료*/

/* 첨부파일디자인변경2 */
.filebox2 input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox2 label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox2 .upload-name2 {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}
/* 첨부파일디자인변경완료2*/

</style>


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
cate_ch('${it.kind_big}','${it.kind_middle}');

//소분류 자동실행
cate_ch2('${it.kind_middle}','${it.kind_small}');

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
</script>

<style>
	.input_style{
	height:25px;
	width:50%;
	padding-left:5px;
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
</style>
<center>

<table height=200><tr><td></td></tr></table>

<table width=800 border=0>
	<tr>
		<td style="text-align: center;color:#5055B1"><h2>상품수정</h2></td>
	</tr>
</table>
<p style="height:20px;"></p>

<form action="modify" method="post" enctype="multipart/form-data">
<input type ="hidden" name="uid" value="${it.uid }">
<input type ="hidden" name="uid" value="${list_option }">

<table width=800 border=1 >
	<tr>
		<td width=165>상품분류 </td>
		<td  class="layout">
				<input name ="kind_big" value="${cb.ca_name }"  style="padding-left: 10px;width:100px;" readonly>
			<span id="id_result">
				<select name="kind_middle" style="height:25px;width:150px;">
					<option value="${cm.ca_name }">${cm.ca_name }</option>
				</select>
			</span>
			<span id="id_result2">
				<select name="kind_small" style="height:25px;width:150px;">
					<option value="${cs.ca_name }">${cs.ca_name }</option>
				</select>
			</span>
		</td>
	</tr>
</table>
<table width=800 border=1 >	
	<tr>
		<td width=70>상품이미지</td>
		<td class="layout">
		<img src="/upload/${it.image }" style="width:100px;height:120px;">
		<input type="file" name="image" style="border-radius: 0px;" value="${it.image }">
		</td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>상품정보이미지</td>
		<td class="layout">
			<img src="/upload/${it.image2 }" style="width:100px;height:120px;">
			<input type="file" name="image2" style="border-radius: 0px;" value="${it.image2 }">
			<input type="text" name="image2" style="border-radius: 0px;" value="${it.image2 }">
		</td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>사용여부</td>
		<td style="padding-left: 15px;">
			<input type="radio" name="useyn" value="y" <c:if test="${it.useyn eq 'y' }">checked</c:if>>사용
			<input type="radio" name="useyn" value="n" <c:if test="${it.useyn eq 'n' }">checked</c:if>>미사용
		</td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>출판사명</td>
		<td class="layout"><input name="n_publisher" class="input_style"  value="${it.n_publisher }"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>도서명</td>
		<td class="layout"><input name="n_book" class="input_style" value="${it.n_book }"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>작가명</td>
		<td class="layout"><input name="n_writer" class="input_style" value="${it.n_writer }"></td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td >
			출판일 
		</td>
		<td width=100 class="layout">	
			<select id="pudate1" name = "pudate1" style="height:25px;width:150px" >
				<option value="">년</option>
				<c:set var="j" value="${year }"/>
				<c:forEach var="i" begin="1" end="5">
				<option value="${j }" <c:if test="${pudate1 == j }">selected</c:if>>${j }년</option>
				<c:set var="j" value="${j-1 }"/>
				</c:forEach>
			</select>
			
			<select id="pudate2" name = "pudate2" style="height:25px;width:150px" onchange="day_ch(this.value)">
				<option value="">월</option>
				<c:forEach var="i" begin="1" end="12">
					<option value="${i }" <c:if test="${pudate22 == i }">selected</c:if>>${i }월</option>
				</c:forEach>	
			</select>
			<span id="day_result">
		<select name="pudate3" style="height:25px;width:150px">
			<option value="">일</option>
				<c:choose>
					<c:when test="${pudate22 == 1 or pudate22 == 3 or pudate22 == 5 or pudate22 == 7 or pudate22 == 8 or pudate22 == 10 or pudate22 == 12}">
						<c:forEach var="i" begin="1" end="31">
							<option value="${i }" <c:if test="${pudate33 == i }">selected</c:if>>${i }일</option>
						</c:forEach>
				</c:when>
				<c:when test="${pudate22 ==2 }">
					<c:forEach var="i" begin="1" end="28">
						<option value="${i }" <c:if test="${pudate33 == i }">selected</c:if>>${i }일</option>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" begin="1" end="30">
						<option value="${i }" <c:if test="${pudate33 == i }">selected</c:if>>${i }일</option>
					</c:forEach>
				</c:otherwise>
				</c:choose>
		</select>
	</span>	
		</td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>상품가격</td>
		<td class="layout">
			<input id="price2" name="price2" class="input_style" value="<fmt:formatNumber value='${it.price1 }'/>" onkeyup="commas(this)">
<!-- 			onkeyup="commas(this)" -->
			<input type="hidden" id="price1" value="0" name="price1" value="">		
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
		</td>
	</tr>
	<tr height=15></tr>
	<tr>
		<td>상품 수량</td>
		<td class="layout"><input name="qty" class="input_style" value="<fmt:formatNumber value='${it.qty }'/>" onkeyup="commas(this)"></td>
	</tr>
	<tr height=15></tr>
	
	<tr>
		<td colspan="2"> 상품소개 <br><textarea placeholder="상품설명" style="width:700px;height:50px;border:1px solid #D5D5D5;" name="comment">${it.comment }</textarea></td>
	</tr>
	
	<tr>
		<td colspan="2"> 책소개 메인 <br><textarea placeholder="책소개 메인" style="width:700px;height:100px;border:1px solid #D5D5D5;" name="cmt_main">${it.cmt_main}</textarea></td>
	</tr>
	<tr>
		<td colspan="2"> 책소개 서브<br><textarea placeholder="책소개 서브" style="width:700px;height:200px;border:1px solid #D5D5D5;" name="cmt_sub">${it.cmt_sub }</textarea></td>
	</tr>
	
	<tr>
		<td colspan="2"> 작가 정보<br><textarea placeholder="작가정보" style="width:700px;height:200px;border:1px solid #D5D5D5;" name="cmt_writer">${it.cmt_writer }</textarea></td>
	</tr>
	<tr>
		<td colspan="2"> 목차 정보<br><textarea placeholder="목차" style="width:700px;height:200px;border:1px solid #D5D5D5;" name="cmt_index">${it.cmt_index }</textarea></td>
	</tr>	
</table>	
<p style="height:15px"></p>
<table width=700 border=0>
	<tr>
		<td><input type="button" style="width:300px;height:50px;background-color:#CCCCCC;color: white;font-size: 30px" value="목록" onclick="location.href='/member/my_page?option=product&option2=new'"></td>
		<td style="padding-left: 70px"><button style="width:300px;height:50px;background-color:#5055B1;color: white;font-size: 30px" >수정</button></td>
		
	</tr>
</table>
</form>
</center>
<script>
function commas(t) {
	// 콤마 빼고 
	var x = t.value;			
	x = x.replace(/,/gi, '');

        // 숫자 정규식 확인
	var regexp = /^[0-9]*$/;
	if(!regexp.test(x)){ 
		$(t).val(""); 
		alert("숫자만 입력 가능합니다.");
	} else {
		x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
		$(t).val(x);			
	}
}
</script>