<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/admin/include/header.jsp"%>

<style>
.td1{
text-align:center;
border-bottom:1px solid #5055B1;
vertical-align:middle;
}
table{
	padding:0;
	margin:0;
	border-spacing:0;
}
</style>
  
<center>
   
<table width="1500" border=0 height=25>
	<tr height=25>
		<td align=left style="color:white;width:70px;height:20px;border:1px solid #88C7E0;border-radius: 10px;cursor:pointer;text-align:center;background-color:#88C7E0 " id="diviC" onclick="item_ch('new')">신품</td>
		<td width=10/>
		<td align=left style="color:#F76300;width:70px;height:20px;border:1px solid #F76300;border-radius: 10px;cursor:pointer;text-align:center;" id="diviD" onclick="item_ch('used')">중고</td>
		<td width=230/>
		<td style="text-align:center;color:#B464EB;"><h2>상품목록</h2></td>
		<td width=200/>
		<td align=right>
			<table>
				<tr>	
					<td></td>
					
				</tr>
			</table>
		</td>						
	</tr>	
</table>
<div id="new2">
<table border=0 width=1500 height=30 align=center>
		<tr>			
		<td width=950>
		<c:if test="${countNew>0 }">
	<c:set var="pageCountNew" value="${countNew / pageSize + (countNew % pageSize == 0 ? 0 : 1) }" />
	<fmt:parseNumber var="pageCountNew" value="${pageCountNew }" integerOnly="true" />
	<!-- 2개의 변수 초기화 -->
	<c:set var="startPageNew" value="${1 }" />
	<c:set var="pageBlockNew" value="${3 }" />	

	<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분-->
	<c:if test="${pageNum > pageBlockNew }">
		<!-- 결과를 정수형으로 리턴 받아야 하기 때문에 fmt -->
		<fmt:parseNumber var="resultNew" value="${pageNum / pageBlockNew - (pageNum % pageBlockNew == 0 ? 1:0) }" integerOnly="true"/>
		<c:set var="startPageNew" value="${resultNew * pageBlockNew + 1 }" />
	</c:if>	

	<!-- endPage 값 설정 부분 -->
	<c:set var="endPageNew" value="${startPageNew + pageBlockNew - 1 }" />
	<c:if test="${endPageNew > pageCountNew }">
		<c:set var="endPageNew" value="${pageCountNew }" />
	</c:if>
	
	<!-- 이전 링크 -->
	<td width=60 style="text-align:center">
	<c:if test="${startPageNew > pageBlockNew }">
		<a href="/admin/item/list?pageNum=${startPageNew - pageBlockNew }&pageNum2=${pageNum2}&option=new">[이전]</a>
	</c:if>
	</td>
	
	<!-- 페이징 링크 -->
	<td width=110 style="text-align:center;font-size:22px;">
	<c:forEach var="i" begin="${startPageNew }" end="${endPageNew }">
		<c:choose>
			<c:when test="${pageNum == i }">
				<a href="/admin/item/list?pageNum=${i }&pageNum2=${pageNum2}&option=new"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
			</c:when>
			<c:otherwise>					
				<a href="/admin/item/list?pageNum=${i }&pageNum2=${pageNum2}&option=new"><span style="padding:0px 4px;">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</td>			
	<!-- 다음 링크 -->
	<td width=60 style="text-align:center">
	<c:if test="${endPageNew < pageCountNew }">
		<a href="/admin/item/list?pageNum=${startPageNew + pageBlockNew }&pageNum2=${pageNum2}&option=new">[다음]</a>
	</c:if>
	</td>
	</c:if>
	<tr>
	<tr height=15/>
</table>

<form name ="Form1" id = "Form1" >
<table border=0 width=1500>
	<tr>
		<td width=150 style="text-align:left;"><input type="button" value="선택삭제" onClick="select_delete('new')" style="cursor:pointer;font-size:17px;margin:auto;" class="custom-choice btn-choice"></td>
				<td style="width:85px;height:25px;text-align:center;cursor:pointer;font-size:17px;margin:auto;color:white" class="custom-choice btn-choice" onclick="location.href='/item/sell?location=admin'">상품등록</td>
	</tr>
</table>
<table width=1500 height=25 style="border:1px solid #5055B1;">
	<tr>
		<td width=20 style="text-align:center;vertical-align:middle"><input type = "checkbox" name = "all" value="checkbox" onclick = "checkall('new')"></td>
		<td width=100 style="text-align:center;color:#5055B1;">제목 이미지</td>
		<td width=100 style="text-align:center;color:#5055B1;">분류코드</td>
		<td width=100 style="text-align:center;color:#5055B1;">출판사</td>
		<td width=100 style="text-align:center;color:#5055B1;">도서명</td>
		<td width=100 style="text-align:center;color:#5055B1;">작가명</td>
		<td width=200 style="text-align:center;color:#5055B1;">출판일</td>
		<td width=100 style="text-align:center;color:#5055B1;">도서 가격</td>
		<td width=100 style="text-align:center;color:#5055B1;">도서 수량</td>
		<td width=100 style="text-align:center;color:#5055B1;">등록자 아이디</td>
		<td width=100 style="text-align:center;color:#5055B1;">사용여부</td>
		<td width=200 style="text-align:center;color:#5055B1;">Mode</td>
	</tr>
</table>
<table height=10/>

<table width=1500 border=0 style="text-align:center;vertical-align:middle;" name="new">	
<c:set var="k" value="${0 }" />
	<c:forEach var="list" items="${itemNewlist }">
	<tr>
		<td width=20 class="td1"><input type="checkbox" name="ap_check" value="${list.uid }" ></td>
		<td width=100 class="td1"><img src="/upload/${list.image }" style="width:100px;height:100px;vertical-align:middle;"></td>
		<td width=100 class="td1">${list.kind_small }</td>
		<td width=100 class="td1">${list.n_publisher }</td>
		<td width=100 class="td1">${list.n_book }</td>
		<td width=100 class="td1">${list.n_writer }</td>
		<td width=200 class="td1">${list.pudate }</td>
		<td width=100 class="td1"><fmt:formatNumber value="${list.price1 }"/></td>
		<td width=100 class="td1">${list.qty }</td>
		<td width=100 class="td1">${list.id }</td>
		<c:choose>
			<c:when test="${list.useyn eq 'y' }">
				<td width=100 class="td1">사용함</td>
			</c:when>	
			<c:otherwise>
				<td width=100 class="td1" >사용안함</td>
			</c:otherwise>
		</c:choose>
		<td width=200 class="td1">
			<a href="/board/modify?uid=${list.uid}&pageNum=${pageNum }&location=admin">자세히 보기</a>
		</td>	
	</tr>
	<c:set var="k" value="${k+1 }" />
	</c:forEach>
</table>
</form>
</div>

<div id="used" style="display:none">
<table border=0 width=1500 height=30 align=center>
		<tr>			
		<td width=950>
		<c:if test="${countUsed>0 }">
	<c:set var="pageCountUsed" value="${countUsed / pageSize + (countUsed % pageSize == 0 ? 0 : 1) }" />
	<fmt:parseNumber var="pageCountUsed" value="${pageCountUsed }" integerOnly="true" />
	<!-- 2개의 변수 초기화 -->
	<c:set var="startPageUsed" value="${1 }" />
	<c:set var="pageBlockUsed" value="${3 }" />	

	<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분-->
	<c:if test="${pageNum2 > pageBlockUsed }">
		<!-- 결과를 정수형으로 리턴 받아야 하기 때문에 fmt -->
		<fmt:parseNumber var="resultUsed" value="${pageNum2 / pageBlockUsed - (pageNum2 % pageBlockUsed == 0 ? 1:0) }" integerOnly="true"/>
		<c:set var="startPageUsed" value="${resultUsed * pageBlockUsed + 1 }" />
	</c:if>	

	<!-- endPage 값 설정 부분 -->
	<c:set var="endPageUsed" value="${startPageUsed + pageBlockUsed - 1 }" />
	<c:if test="${endPageUsed > pageCountUsed }">
		<c:set var="endPageUsed" value="${pageCountUsed}" />
	</c:if>
	
	<!-- 이전 링크 -->
	<td width=60 style="text-align:center">
	<c:if test="${startPageUsed > pageBlockUsed }">
		<a href="/admin/item/list?pageNum=${pageNum }&pageNum2=${startPageUsed - pageBlockUsed }&option=used">[이전]</a>
	</c:if>
	</td>
	
	<!-- 페이징 링크 -->
	<td width=110 style="text-align:center;font-size:22px;">
	<c:forEach var="i" begin="${startPageUsed }" end="${endPageUsed }">
		<c:choose>
			<c:when test="${pageNum2 == i }">
				<a href="/admin/item/list?pageNum=${pageNum }&pageNum2=${i }&option=used"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
			</c:when>
			<c:otherwise>					
				<a href="/admin/item/list?pageNum=${pageNum }&pageNum2=${i }&option=used"><span style="padding:0px 4px;">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</td>			
	<!-- 다음 링크 -->
	<td width=60 style="text-align:center">
	<c:if test="${endPageUsed < pageCountUsed }">
		<a href="/admin/item/list?pageNum=${pageNum }&pageNum2=${startPageUsed + pageBlockUsed }&option=used">[다음]</a>
	</c:if>
	</td>
	</c:if>
	<tr>
	<tr height=15/>
</table>
<form name="Form2" id="Form2">
<table border=0 width=1500>
	<tr>
		<td width=150 style="text-align:left;"><input type="button"  value="선택삭제" onClick="select_delete('used')" style="cursor:pointer;font-size:17px;margin:auto;" class="custom-choice btn-choice"></td>
		<td style="width:85px;height:25px;text-align:center;cursor:pointer;font-size:17px;margin:auto;color:white" class="custom-choice btn-choice" onclick="location.href='/item/sell?location=admin'">상품등록</td>
	</tr>
</table>
<table width=1500 height=25 style="border:1px solid #5055B1;" border=1>
	<tr>
		<td width=20 style="text-align:center;vertical-align:middle"><input type = "checkbox" name = "all2" value="checkbox" onclick = "checkall('used')"></td>
		<td width=100 style="text-align:center;color:#5055B1;">제목 이미지</td>
		<td width=100 style="text-align:center;color:#5055B1;">분류코드</td>
		<td width=500 style="text-align:center;color:#5055B1;">상품명</td>
		<td width=100 style="text-align:center;color:#5055B1;">상품 가격</td>
		<td width=100 style="text-align:center;color:#5055B1;">수량</td>
		<td width=100 style="text-align:center;color:#5055B1;">등록자 아이디</td>
		<td width=100 style="text-align:center;color:#5055B1;">사용여부</td>
		<td width=200 style="text-align:center;color:#5055B1;">Mode</td>
	</tr>
</table>
<table height=10/>
<table width=1500 border=0 style="text-align:center;vertical-align:middle;" border=1>	
	<c:set var="j" value="${0 }"/>
	<c:forEach var="list" items="${itemUsedlist }">
	<tr>
		<td width=20 class="td1"><input type="checkbox" name="ap_check2" value="${list.uid }" ></td>
		<td width=100 class="td1"><img src="/upload/${list.image }" style="width:100px;height:100px;vertical-align:middle;"></td>
		<td width=100 class="td1">${list.kind_small }</td>
		<td width=500 class="td1">${list.n_book }</td>
		<td width=100 class="td1"><fmt:formatNumber value="${list.price1 }"/></td>
		<td width=100 class="td1">${list.qty }</td>
		<td width=100 class="td1">${list.id }</td>
		<c:choose>
			<c:when test="${list.useyn eq 'y' }">
				<td width=100 class="td1">사용함</td>
			</c:when>	
			<c:otherwise>
				<td width=100 class="td1" >사용안함</td>
			</c:otherwise>
		</c:choose>
		<td width=200 class="td1">
			<a href="/item/modify_used?uid=${list.uid}&pageNum=${pageNum}&pageName=orderUsed&pageNum2=${pageNum2}&location=admin">자세히 보기</a>
		</td>	
	</tr>
	<c:set var="j" value="${j+1 }"/>
	</c:forEach>
</table>
</form>
</div>

</center>
<script>



	
function checkall(str) {//체크박스 전체 선택 , 해제
	if(str=='new'){
		if(Form1.all.checked) {
			for(i=1; i < (document.Form1.length); i++){
				document.Form1.elements[i].checked = true;
			}
		}else{
			for(i=1; i < (document.Form1.length); i++){
				document.Form1.elements[i].checked = false;
			}
		}
	}else{
		if(Form2.all2.checked) {
			for(i=1; i < (document.Form2.length); i++){
				document.Form2.elements[i].checked = true;
			}
		}else{
			for(i=1; i < (document.Form2.length); i++){
				document.Form2.elements[i].checked = false;
			}
		}
	}
}


function select_delete(str){
	
	var totalNewNum= "${k}";
	var totalUsedNum = "${j}"
			
	var list = "";
	//alert("신간개수"+totalNewNum);
	//alert("중고개수"+totalUsedNum);
	var con = confirm("선택된 상품을 사용안함으로 바꾸시겠습니까?");
	var ischecked ="";
	
	if(con == true){	
		if(str == 'new'){
			if(totalNewNum ==1){
				
				if(document.Form1.ap_check.checked == true){
					ischecked=1;
					list = $("input[type='checkbox'][name=ap_check]").val()+","; 
				}
			}else{
				for(var i=0;i<totalNewNum;i++){
					if(document.Form1.ap_check[i].checked == true){
						ischecked+=1;
						list += $("input[type='checkbox'][name=ap_check]:eq("+i+")").val()+","; 	
						
					}
				}
			}
		}else{
			if(totalNewNum ==1){
				if(document.Form2.ap_check2.checked == true){
					ischecked=1;
					list = $("input[type='checkbox'][name=ap_check2]").val()+","; 
				}
			}else{
				for(var j=0;j<totalUsedNum;j++){
					if(document.Form2.ap_check2[j].checked == true){
						ischecked+=1;
						list += $("input[type='checkbox'][name=ap_check2]:eq("+j+")").val()+","; 
					//alert(list);
					}
				}
				
			}	
			
		}
		//alert("체크여부"+ischecked);
		if(ischecked==""){
			alert("선택된 상품이 없습니다.");
		}
			//alert(list);
		

			$.ajax({
				url: "delete_select", //전송받을 페이지 경로
				type: "post", //데이터 읽어오는 방식
				dataType: "text", //데이터 방식
				data: "type="+str+"&uids="+list, //데이터 전달
				error:function(){ //실패일 경우
					alert("실패");
				},
				success:function(result){ //성공일 경우
					location.href="list?option="+result
						
				}	
			});
			
	}else{
		return false;
	}	
}

function item_ch(str){
	
	if(str=='new'){
		
		$("#new2").show();
		$("#used").hide();
		document.getElementById('diviC').style.color= 'white';
		document.getElementById('diviC').style.background='#88C7E0';
		document.getElementById('diviD').style.color= '#F76300';
		document.getElementById('diviD').style.background='white';
	}else{
		
		$("#new2").hide();
		$("#used").show();
		document.getElementById('diviD').style.color= 'white';
		document.getElementById('diviD').style.background='#F76300';
		document.getElementById('diviC').style.color= '#5288C9';
		document.getElementById('diviC').style.background='white'
	}	
}

var option ="${option}";
//alert(option);
if(option ==''){
	item_ch('new')
}else{
	item_ch(option);	
}


</script>