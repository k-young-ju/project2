<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String location = (String)request.getAttribute("location");
	if(location.equals("admin")){
%>
<%@ include file = "/admin/include/header.jsp"%>
<%}else{ %>
<%@ include file = "/include/header.jsp"%>
<%} %> 

<style>
table{
	border-collapse: collapse;
	border-spacing : 0;

}

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

	.button{
	width:250px;
	height:70px;
	color:white;
	font-size: 30px;
	}
</style>

<script>
//중분류
function cate_ch(str,str2){
	//alert("1");
	$.ajax({
		url: "/item/cate_big", //전송받을 페이지 경로
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
		url: "/item/cate_middle", //전송받을 페이지 경로
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
		url: "/item/month_ch", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "month="+month, //데이터 전달
		
		success:function(text){ //성공일 경우\
			//alert(text);
			$("#day_result").html(text);
		
		}
		
	});
}


$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	  fileTarget.on('change', function(){  // 값이 변경되면
	    if(window.FileReader){  // modern browser
	      var filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name').val(filename);
	  });
	});

$(document).ready(function(){
	  var fileTarget = $('.filebox2 .upload-hidden');

	  fileTarget.on('change', function(){  // 값이 변경되면
	    if(window.FileReader){  // modern browser
	      var filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name2').val(filename);
	  });
	});

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
		alert("도서명를 입력해주세요");
		modify.n_book.focus();
		return false;
	}
	
	if(modify.n_writer.value==""){
		alert("작가명을 입력해주세요");
		modify.n_writer.focus();
		return false;
	}
	
	if(modify.n_publisher.value==""){
		alert("출판사를 입력해주세요");
		modify.n_publisher.focus();
		return false;
	}
	
	if(modify.pudate1.value==""){
		alert("출판일을 입력해주세요");
		modify.pudate1.focus();
		return false;
	}
	if(modify.pudate2.value==""){
		alert("출판일을 입력해주세요");
		modify.pudate2.focus();
		return false;
	}
	if(modify.pudate3.value==""){
		alert("출판일을 입력해주세요");
		modify.pudate3.focus();
		return false;
	}
	if(modify.price2.value==0 || modify.price1.value==0){
		alert("상품가격을 입력해주세요");
		modify.price1.focus();
		return false;
	}
	if(modify.qty.value==""){
		alert("상품수량을 입력해주세요");
		modify.qty.focus();
		return false;
	}
	if(modify.comment.value==""){
		alert("상품소개를 작성해주세요");
		return false;
	}
	document.modify.submit();
}
</script>


<center>


<c:if test="${location ne 'admin' }">
<table><tr height=240></tr></table>
</c:if>


<form name="modify" action="modify" method="post" enctype="multipart/form-data" onsubmit="return modify_go()">
<input type="hidden" name="pageNum" value="${pageNum }">
<input type="hidden" name="uid" value="${it.uid }">
<table width=1400 border=0>
	<tr height=20/>
	<tr>
		<td width=165 style="color:#5055B1;font-weight:bold;font-size:22px;">상품분류 </td>
		<td class="layout">
				<input name ="kind_big" value="${cb.ca_name }" style="padding:0;width:60px;font-size:20px;color:#5055B1;font-weight:bold;outline:none;border:0" readonly>
		</td>
		<td id="id_result">
				<select id ="kind_middle" name="kind_middle" style="height:25px;width:150px;">
					<option value="${cm.ca_name }">${cm.ca_name }</option>
				</select>
		</td>
		<td id="id_result2">
				<select id="kind_small" name="kind_small" style="height:25px;width:150px;">
					<option value="${cs.ca_name }">${cs.ca_name }</option>
				</select>
		</td>
		<td width=1000/>
		
	</tr>
</table>

<table width=1400 border=0>
	<tr height=350>
	
	
		<td width=250 style="text-align:center"><img src="/upload/${it.image }" width=250 height=280></td>
		<td width=650>
			<table border=0>
				<tr>
					<td width=20></td><td>도서명 &nbsp;&nbsp;</td>
					<td><input id="n_book" name="n_book" value="${it.n_book }"></td>
				</tr>
				<tr>
					<td width=20></td><td>작가명</td>
					<td><input id="n_writer" name="n_writer" value="${it.n_writer }"></td>
				</tr>
				<tr>
					<td width=20></td><td>출판사명</td>
					<td><input id="n_publisher" name="n_publisher" value="${it.n_publisher }"></td>
				</tr>
				<tr>
					<td width=20></td><td>가격</td>
					<td>
						<input id="price2" name="price2" value="<fmt:formatNumber value="${it.price1 }" />"></td>
						<input type="hidden" id="price1" name="price1" value="${it.price1 }">
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

				<tr>
					<td width=20></td><td>재고</td>
					<td><input name="qty" value="${it.qty }"></td>
					
				</tr>
				<tr>
					<td width=20></td><td>사용여부</td>
					<td>
					<input type="radio" id="useyn" name="useyn" value="y" <c:if test="${it.useyn eq 'y' }">checked</c:if>> Y
					<input type="radio" id="useyn" name="useyn" value="n" <c:if test="${it.useyn eq 'n' }">checked</c:if>>N
					</td>	
				</tr>								
				<tr>
					<td width=20/>
					<td>제품img</td>
					
					<td width=400 height=40 class="filebox" style="font-size:15px;">
					<input class="upload-name" value="${it.image }" disabled="disabled">
					<label for="ex_filename">파일찾기</label>
					<input type="file" id="ex_filename" name="image" class="upload-hidden"> 
					</td>
				</tr>
				<tr>
					<td width=20/>
					<td>출판일 </td>
					<td width=100 class="layout">	
						<table>
							<tr>
								<td>
									<select id="pudate1" name = "pudate1" style="height:25px;width:100px" >
										<option value="">년</option>
										<c:set var="j" value="${year }"/>
										<c:forEach var="i" begin="1" end="5">
										<option value="${j }" <c:if test="${pudate1 == j }">selected</c:if>>${j }년</option>
										<c:set var="j" value="${j-1 }"/>
										</c:forEach>
									</select>
								</td>
								<td>
									<select id="pudate2" name = "pudate2" style="height:25px;width:100px" onchange="day_ch(this.value)">
										<option value="">월</option>
										<c:forEach var="i" begin="1" end="12">
											<option value="${i }" <c:if test="${pudate22 == i }">selected</c:if>>${i }월</option>
										</c:forEach>	
									</select>
								</td>
								
								<td>
									<span id="day_result">	
									<select name="pudate3" style="height:25px;width:100px">
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
						</table>
					</td>					
				</tr>
			</table>
		</td>
		<td width=450 border=0>
		상품 설명<br>
		<textarea name="comment" id="comment" style="width:400px;height:180px;">${it.comment }</textarea>
		
			<table border=0>
				<tr height=35/>
				<tr>
					<td width=65 height=40 style="text-align:left">&nbsp;정보img</td>
					
					<td width=380 height=40 class="filebox2" style="font-size:15px;">
					<input class="upload-name2" value="${it.image2 }" disabled="disabled">
					<label for="ex_filename2">파일찾기</label>
					<input type="file" id="ex_filename2" name="image2" class="upload-hidden"> 
					</td>		
				</tr>
				<tr height=0/>
			</table>
			
		</td>	
		<td width=100>
			<table width=100>
			
				<c:if test="${sessionScope.m_level eq 10}">
				<tr>
					<td style="border:0px;"><input type="button" style="width:100%;height:44px;background-color:#E1E1E2;color:#2323EF;border-radius:12px;border:0px;font-size:16px;" value="관리자 목록" onclick="location.href='/admin/item/list?option=new&pageNum=${pageNum}'"></td>
				</tr>
				<tr height=20/>
				</c:if>

				<tr><td style="border:0px;"><input type="button" style="width:100%;height:44px;background-color:#F87B1F;color:#FEFEFE;border-radius:12px;border:0px;font-size:16px;" value="목록" onclick="location.href='/member/my_page?option=product&option2=new&pageNum=${pageNum }&pageName=product'"></td></tr>
				<tr height=20/>
				<tr><td><button style="width:100%;height:44px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:16px;">수정</button></td></tr>
				<tr height=20></tr>
				
			</table>
		
		
		
		</td>
	</tr>
</table>

<table width=1400>
	<tr>
		<td style="width:350px;height:20px;">책소개 메인</td>
		<td style="width:350px;height:20px;">책소개 서브</td>
		<td style="width:350px;height:20px;">작가 정보</td>
		<td style="width:350px;height:20px;">목차</td>
	</tr>
	<tr>
		<td style="width:350px;height:200px;"><textarea name="cmt_main" id="cmt_main" style="width:350px;height:200px;">${it.cmt_main }</textarea></td>
		<td style="width:350px;height:200px;"><textarea name="cmt_sub" id="cmt_sub" style="width:350px;height:200px;">${it.cmt_sub }</textarea></td>
		<td style="width:350px;height:200px;"><textarea name="cmt_writer" id="cmt_writer" style="width:350px;height:200px;">${it.cmt_writer }</textarea></td>
		<td style="width:350px;height:200px;"><textarea name="cmt_index" id="cmt_index" style="width:350px;height:200px;">${it.cmt_index }</textarea></td>
	
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


</body>
</html>