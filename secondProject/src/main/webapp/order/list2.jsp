<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>    

<style>

.fix1{
/* 	position: fixed; */
}
#tdback{
	background-color:#5055B1;
}
input:focus {outline: none;}
#tdcolor{
	color:#5055B1;
	font-weight:bold;
}
#tdboard{
	border:1px solid #5055B1;
}
input{
    /* focus는 선택되서 커서가 깜빡일 때를 이야기함*/
/* 	color:darkblue;  */
/*     font-weight: bold; font-size: 15px; border-radius: 10px; */
/*     focus{background-color:lemonchiffon;} */
    
}
textarea{
    /* focus는 선택되서 커서가 깜빡일 때를 이야기함*/
	color:darkblue; 
    font-weight: bold; font-size: 15px; border-radius: 10px;
    focus{background-color:lemonchiffon;}

}


</style>
<script>

// function order_ok(){

//  	var one_mi = orderView.num2.value;
//  	var one_pi = orderView.point1.value;
	
// 	if(one_pi > one_mi){            
// 		alert(one_pi+"보유하신 마일리지 이상을 사용하셨습니다.\n"+one_mi+"포인트이하만 사용 가능합니다");
// 		return;
		
// 	}else{
// 	document.orderView.submit();
// 	}
// }
function order_view(){
	
	if(order.od_name.value==""){
		alert("구매자 이름을 입력하세요");
		order.od_name.focus();
		return false;
	}
	if(order.od_phone.value==""){
		alert("구매자 전화번호를 입력하세요");
		order.od_phone.focus();
		return false;
	}
	if(order.sample4_postcode.value=="" || order.sample4_roadAddress.value=="" || order.sample4_jibunAddress.value=="" || order.sample4_extraAddress.value=="" || order.sample4_detailAddress.value==""){
		alert("구매자 주소를 입력하세요");
		return false;
	}
	if(order.od_b_name.value==""){
		alert("수령인 이름을 입력해주세요");
		return false;
	}
	if(order.od_b_phone.value==""){
		alert("수령인 전화번호를 입력해주세요");
		return false;
	}
	if(order.sample4_postcode1.value=="" || order.sample4_roadAddress1.value=="" || order.sample4_jibunAddress1.value=="" || order.sample4_extraAddress1.value=="" || order.sample4_detailAddress1.value==""){
		alert("수령인 주소를 입력해주세요");
		return false;
	}
	if(order.depositor.value==""){
		alert("입금자명을 입력해주세요");
		tab_click1('Passbook');
		order.depositor.focus();
		return false;
	}
		
	document.order.submit();
}

function same_check(){
	var check = document.getElementById('same');
		
	if(check.checked == true){
		
	order.od_b_name.value = order.od_name.value;
	order.od_b_phone.value = order.od_phone.value;
	order.sample4_postcode1.value = order.sample4_postcode.value;
	order.sample4_roadAddress1.value = order.sample4_roadAddress.value;
	order.sample4_jibunAddress1.value = order.sample4_jibunAddress.value
	order.sample4_extraAddress1.value = order.sample4_extraAddress.value;
	order.sample4_detailAddress1.value = order.sample4_detailAddress.value;
	
	}else{
		
		order.od_b_name.value ="";
		order.od_b_phone.value="";
		order.sample4_postcode1.value="";
		order.sample4_roadAddress1.value="";
		order.sample4_jibunAddress1.value="";
		order.sample4_extraAddress1.value="";
		order.sample4_detailAddress1.value="";
	}
	
	
	
}
</script>



<center>
<table width=1110 border=0><tr height=240></tr></table>

<table>
	<tr>
		<td>
		
		
		
		</td>
	</tr>

</table>


<form name="order" action="list" method="post" onsubmit="return order_view()">
<c:choose>
	<c:when test="${uid >= 0}"><input name="uid" id="uid" type="hidden" value="${uid }"></c:when>
	<c:otherwise><input name="uid" id="uid" type="hidden" value="0"></c:otherwise>
</c:choose>
<input type="hidden" name="option" value="${option }">
<input type="hidden" name="checkUids" value="${checkUids }">
<input type="hidden" name="totals" value="${totals }">

 <table width=1400 border=0>
 	<tr height=40/>
	<tr height=50>
		<td width=100></td>
		<td colspan=6 width=800 style="color:#8D0837;font-weight:bold;font-size:23px;">주문예정 내역</td>
		<td width=70 style="text-align:center;"></td>
	</tr>
	<tr height=20/>
	<tr>
		<td width=100></td>
		<td colspan=6 width=800 style="border-top:2px solid #5055B1"></td>
		<td width=70 style="text-align:center;border-top:2px solid #5055B1"></td>
	</tr>
	<tr height=15><td colspan=7></td></tr>
	
	<tr height=45>
		<td width=100 style="text-align:center;" id="tdcolor"></td>
		<td width=100 style="text-align:center;" id="tdcolor"></td>
		<td width=100 style="text-align:center;" id="tdcolor">상품</td>
		<td width=220 style="text-align:center;" id="tdcolor">상품명</td>
		<td width=60 style="text-align:center;" id="tdcolor">개수</td>
		<td width=110 style="text-align:center;" id="tdcolor">판매가</td>
		<td width=110 style="text-align:center;" id="tdcolor">합계</td>
		<td width=70 style="text-align:center;"></td>
	</tr>
	<tr height=15><td/><td style="border-bottom:2px solid #5055B1;" colspan=7/></tr>

	<c:forEach var="list" items="${v }">	
	<tr height=10/>	
	<tr height=80>
		<td width=100 style="text-align:center;"></td>
		<td width=100 style="text-align:center;border-bottom:1px solid #5055B1;">${list.n_writer }</td>
		<td width=100 style="text-align:center;border-bottom:1px solid #5055B1;"><img src="/upload/${list.image }" style="width:80px;height:80px;"></td>
		<td width=220 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${list.subject }</td>
		<td width=60 style="text-align:center;border-bottom:1px solid #5055B1;"><fmt:formatNumber value="${list.qty }"/></td><input type="hidden" name="qty" value="${list.qty }">
		<td width=110 style="text-align:center;;border-bottom:1px solid #5055B1;"><fmt:formatNumber value="${list.price1 }"/></td>
		<td width=110 style="text-align:center;border-bottom:1px solid #5055B1;"><fmt:formatNumber value="${list.qty * list.price1 }"/></td>
		<td width=100 style="text-align:center;border-bottom:1px solid #5055B1;"><input type="hidden" name="ct_uid" value="${list.ct_uid }"></td>
	
		<td width=70></td>		
	</tr>
	<tr height=10/>	
	<c:set var="i" value="${i + 1 }"/>
	</c:forEach>
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${v != null }"> --%>
			
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<tr height=50> -->
<!-- 				<td width=100 style="text-align:center;"></td> -->
<%-- 				<td width=100 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${c.n_writer }</td> --%>
<%-- 				<td width=320 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;"><img src="/upload/${c.image }" style="width:25px;height:25px;">${c.subject }</td> --%>
<%-- 				<td width=60 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${c.qty }</td> --%>
<%-- 				<td width=110 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${c.price1 }</td> --%>
<%-- 				<td width=110 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${c.qty * c.price1 }</td> --%>
<%-- 				<td width=100 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${c.mileage }</td> --%>
<!-- 				<td width=70></td>		 -->
<!-- 			</tr>			 -->
<%-- 		</c:otherwise>	 --%>
<%-- 	</c:choose> --%>
</table>




<table width=1400 border=0>
	<tr height=80>
		<td width=100></td>
		<td width=600 style="vertical-align:bottom;color:#8D0837;font-weight:bold;font-size:23px;">결제 페이지</td>
		<td width=20></td>
		<td width=250></td>
	</tr>
	<tr>
		<td width=100></td>
		<td width=600 rowspan=3 style="vertical-align:top;">
			<table height=30/>
			<table style="background-color: white;border:2px solid #8D0837;border-radius: 15px;vertical-align:top;" border=0>
				<tr height=20 />

				<tr height=20><td width=20></td><td colspan=4>구매자</td></tr>
				<tr height=20></tr>
				<tr height=10 style="border-top:1px solid #8D0837;"></tr>
				<tr height=20/>
				<tr height=20>
					<td width=20></td>
					<td width=100>이름</td>
					<td width=20></td>
					<td width=500><input id="od_name" name="od_name" style="width:400px;height:35px;padding-left: 10px;" placeholder="${m.name }" value="${m.name }"></td>
					<td width=100></td>
				</tr>
			
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>전화번호</td>
					<td width=20></td>
					<td width=500>
						<c:set var="hi" value="-" />
						<input value="${m.phone1 }${m.phone2 }${m.phone3 }" placeholder="${m.phone1 } ${hi } ${m.phone2 } ${hi } ${m.phone3 }" id="od_phone" name="od_phone" type="text" maxlength="12" style="width:400px;height:35px;padding-left: 10px;" name="od_b_phone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />			
					</td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>
				<tr height=40>
					<td width=20></td>
					<td width=100>주소</td>
					<td width=20></td>
					<td width=500>
		 				<input type="text" id="sample4_postcode" name="zipcode" value="${m.zipcode }" placeholder="${m.zipcode }" style="height:35px;width:295px;padding-left: 10px;">
           			 	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:36px;width:100px">						
					</td>
					<td width=200></td>
				</tr>			
				<tr height=10/>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=500>
 						<input type="text" id="sample4_roadAddress" name="zipcode1" value="${m.zipcode1 }" placeholder="${m.zipcode1 }" style="height:35px;width:400px;padding-left: 10px;">					
					</td>
					<td width=200></td>
				</tr>
				<tr height=10/>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=500>
			 			<input type="text" id="sample4_jibunAddress" name="zipcode2" value="${m.zipcode2 }" placeholder="${m.zipcode2 }" style="height:35px;;width:400px;padding-left: 10px;">
						<span id="guide" style="color:#999;display:none"></span>
					</td>
					<td width=200></td>
				</tr>
				<tr height=10/>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=500>
					<input type="text" id="sample4_extraAddress" name="zipcode4" value="${m.zipcode4}" placeholder="${m.zipcode4 }" style="height:35px;width:400px;padding-left: 10px;">
					</td>
					<td width=200></td>
				</tr>
				<tr height=10/>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=500>
			 			<input type="text" id="sample4_detailAddress" name="zipcode3" value="${m.zipcode3 }" placeholder="${m.zipcode3 }" style="height:35px;width:400px;padding-left: 10px;">
					</td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>
			</table>
			
			<table height=25/>
			<table>
				<tr>
					<td><input type="checkbox" id="same" onclick="same_check()">구매자 수령인 동일</td>
				</tr>
			</table>
			<table height=25/>
			<table style="background-color: white;border:2px solid #8D0837;border-radius: 15px;" border=0>
				<tr height=20></tr>
				<tr height=20><td width=20></td><td colspan=4>수령인</td></tr>
				<tr height=20></tr>
				<tr height=10 style="border-top:1px solid #8D0837;"></tr>
				<tr height=20/>
				<tr height=20>
					<td width=20></td>
					<td width=100>이름</td>
					<td width=20></td>
					<td width=500><input id="od_b_name" name="od_b_name" style="width:400px;height:35px;padding-left: 10px;" placeholder="이름을 작성해주세요" value=""></td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>전화번호</td>
					<td width=20></td>
					<td width=500>
					<c:set var="hi" value="-" />
						<input type="text"maxlength="12" style="width:400px;height:35px;padding-left: 10px;" id="od_b_phone" name="od_b_phone" placeholder="전화번호를 작성해주세요." onkeyup="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
					</td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>

				<tr height=40>
					<td width=20></td>
					<td width=100>주소</td>
					<td width=20></td>
					<td width=500>
		 				<input type="text" id="sample4_postcode1" name="zipcode_b" placeholder="우편번호" style="height:35px;width:295px;padding-left: 10px;">
           			 	<input type="button" onclick="sample4_execDaumPostcode1()" value="우편번호 찾기" style="height:36px;width:100px">						
					</td>
					<td width=200></td>
				</tr>
				<tr height=10/>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=500>
 						<input type="text" id="sample4_roadAddress1" name="zipcode1_b" placeholder="도로명주소" style="height:35px;width:400px;padding-left: 10px;">					
					</td>
					<td width=200></td>
				</tr>
				<tr height=10/>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=500>
			 			<input type="text" id="sample4_jibunAddress1" name="zipcode2_b" placeholder="지번주소" style="height:35px;width:400px;padding-left: 10px;">
						<span id="guide" style="color:#999;display:none"></span>
					</td>
					<td width=200></td>
				</tr>
				<tr height=10/>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=500>
					<input type="text" id="sample4_extraAddress1" name="zipcode4_b" placeholder="참고항목" style="height:35px;width:400px;padding-left: 10px;">
					</td>
					<td width=200></td>
				</tr>
				<tr height=10/>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=500>
			 			<input type="text" id="sample4_detailAddress1" name="zipcode3_b" placeholder="상세주소" style="height:35px;width:400px;padding-left: 10px;">
					</td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>
				<tr height=40>
					<td width=20></td>
					<td width=100>요청사항</td>
					<td width=20></td>
					<td width=500>
			 			<textarea name="require1" style="height:80px;width:400px;padding-left: 10px;"></textarea>
					</td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>				
			
			</table>						   
		</td>
		<td width=20 rowspan=3></td>
		<td width=250 rowspan=3 border=0 class="fix1" style="vertical-align:top;">
			<table border=0 height=150 width=350 style="vertical-align:top;">
				<tr height=28/>
				<tr>
					<td style="vertical-align:top;">
						<table border=0 width=350 style="border:2px solid #8D0837;vertical-align:top;" height=150>
							<tr height=80>
								<c:choose>
									<c:when test="${m_id eq null }">
										<td style="width:350px;border:2px solid #8D0837;text-align:center;" colspan=3>주문금액<br><fmt:formatNumber value="${totals }"/>원</td>
									</c:when>
									<c:otherwise>
										<td style="width:350px;border:2px solid #8D0837;text-align:center;" colspan=3>주문금액<br><fmt:formatNumber value="${totals }"/>원</td>
									</c:otherwise>	
								</c:choose>
								<input type="hidden" id="num2" name="num2" value="${num2 }">
							</tr>
							<tr height=15/>
							<tr>
								<td >&nbsp;&nbsp;주문</td>
								<td ></td>
								<td style="text-align:right;"><fmt:formatNumber value="${totals }"/>&nbsp;&nbsp;</td>
							</tr>		
							<tr height=15/>
							<tr>
								<td>&nbsp;&nbsp;배송비</td>
								<td></td>
								<td style="text-align:right;">
								<c:if test="${totals <= 29999 && totals >=1 }"><fmt:formatNumber value="${3000 }"/> 원&nbsp;&nbsp; <input id ="delivery" name="delivery" type="hidden" value="3000"></c:if>		
								<c:if test="${totals >= 30000}">무료&nbsp;&nbsp;<input id ="total" name="total" type="hidden" value="${totals }"><input id ="delivery" name="delivery" type="hidden" value="0"></c:if>
							
								</td>
							</tr>
							<tr height=15/>							
						</table>
							<!-- 원처리 -->
							<script>
							$(function() {
								
								  $('#point2').on('change', function() {
									  point1.value = point2.value;
									  if(point2.value ==""){
										  point1.value=0;
									  }
									  
								     var n = $(this).val();
								   	 n = Math.floor(n/1000) * 1000; 
								     //alert(n);  
								     $(this).val(n);
								  });
								});
							
							</script>
							
					
					</td>
				</tr>
			</table>
			
			<table height=20/>

			<table border=0 height=50 width=350 style="border:2px solid #8D0837">
				<tr>
					<td width=140>&nbsp;&nbsp;총 주문금액</td>
					<td width=10></td>
					<td width=200 style="text-align:right;">
					<c:if test="${totals <= 29999 && totals >=1 }">				
					<fmt:formatNumber value="${totals + 3000 }"/> 원&nbsp;&nbsp;
					<input type ="hidden" name="od_price" value="${totals + 3000 }">
					</c:if>
					<c:if test="${totals >= 30000 }">
					<fmt:formatNumber value="${totals }"/> 원&nbsp;&nbsp;
					<input type ="hidden" name="od_price" value="${totals }">
					</c:if>
					</td>
				</tr>
			</table>
			<table height=20/>
			<table border=0 height=50 width=350 style="border:2px solid #8D0837">
				<tr height=20/>
				<tr>
					<td style="text-align:center;" colspan=3>결제수단</td>
				</tr>
				<tr height=20></tr>
				<tr>
					<td width=10></td>
					<td style="border:1px solid #8D0837;text-align:center;" width=150 height=30 onclick="tab_click1('Passbook')">무통장입금</td>
<script>
function tab_click1(str){
	if(str=='Passbook'){//내정보 관리 클릭시
		document.getElementById('depositPassbook').style.display='inline';
	}
}
</script>					
					<td></td>
				</tr>
				<tr height=20></tr>
			</table>
			<table height=20/>
	
			
			<table id="depositPassbook" style="display:none;" width=350 border=0>
				<tr height=10></tr>
				<tr>
					<td width=100 style="text-align:left;">
					OO은행 : 
					</td>
					<td width=250>12345-6789-0123</td>
				</tr>
				<tr>
					<td width=100 style="text-align:left;">
					예금주명 :
					</td>
					<td width=250>책판다</td>
				</tr>				
				<tr>
					<td width=100>입금자명 :</td>
					<td width=250><input name="depositor"></td>
				</tr>
				<tr height=10></tr>		
			</table>			
			
			<table style="" height=50 width=350>
				<tr height=10></tr>
				<tr>
					<td width=175 style="text-align:center;">
<!-- 					<input style="width:94%;height:40px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:18px;" type="button" value="결제하기"> -->
					<button style="width:94%;height:40px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:18px;">결제하기</button>
<!-- 					<input type="button" value="결제하기" class=button style="width:94%;height:40px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:18px;"> -->

					</td>
					<td width=175>
					<input style="width:94%;height:40px;background-color:#767676;color:#FEFEFE;border-radius:15px;border:0px;font-size:18px;" type="button" value="취소하기" onClick="window.history.back()">
					</td>
				</tr>
				<tr height=10></tr>		
			</table>			
						
			<table border=0 height=440 width=350>
				<tr>
					<td></td>
				</tr>
			</table>
			
			 
						
		</td>
	</tr>
	<tr height=20>
		<td width=100></td>
<!-- 		<td width=20></td> -->
<!-- 		<td width=250></td> -->
	</tr>
	<tr>
		<td width=100></td>
<!-- 				<td width=600 rowspan=3> -->
	   
<!-- 		</td> -->
<!-- 		<td width=20></td> -->
<!-- 		<td width=250></td> -->
	</tr>
</table>


<table><tr height=20></tr></table>
</form>
</center>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode1() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode1').value = data.zonecode;
                document.getElementById("sample4_roadAddress1").value = roadAddr;
                document.getElementById("sample4_jibunAddress1").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress1").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress1").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }


	
</script>