<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp"%>
<style>
.menu{
	width:350px;
	height:400px;
	margin: 0 auto;
	position: fixed;
	top:340px;
	right: 300px;
	padding: 0px;
	border:1px solid #5055B1;
	border-radius: 20px;
	
}
.button_style{
width:100%;
height:25px;
background-color: #4B50AA;
color:white;
text-align: center;
height:50px;
font-size:25px;
border-radius: 15px;
}

.qty_change{
width:30px;
height:30px;
border:1px solid black;
font-size:25px;
}
body{
padding-left: 50px;
}
input:focus {outline: none;}
</style>
<form name ="cart" action="list" method="post">
<!-- 아이템uid -->
<input type="hidden" name="uids">
<!-- 재고 -->
<input type="hidden" name="stock">
<!-- 주문수량 -->
<input type="hidden" name="qtys">
<!-- 카트uid -->
<input type="hidden" name="checkUids">

<table height=50></table>
<table class="menu" border=0>
	<tr>
	<td></td>
	</tr>
	<tr>
		<td align="center">
			<table  border=0 width=300>
			
				<tr>
					<td>상품금액 <input type="hidden" id ="total" name="total" value="" onkeyup="qty_ch(${i})" style="width:100px;border:0px;font-size:20px;text-align: right"></td>
					<td id="total2" style="text-align:right;"></td>
					<td>원</td>
					
				</tr>
				<tr>
					<td height=10></td>
				</tr>
				<tr>	
					<td >배송비</td>
				<input type="hidden" id="delivery" name="delivery"  style="width:100px;border:0px;font-size:20px;text-align: right">
					<td id="delivery2" style="text-align:right;"></td> 
					<td>원</td>
				</tr>
				
				<tr><td height=15 colspan=3 style="border-bottom: 1px solid black"></td>
				</tr>
				
				<tr>
					<td colspan="2" height=15"></td>
				</tr>
				<tr>
					<td>결제예정금액</td>
					<input type="hidden" id="pre_price" name="pre_price" style="width:100px;border:0px;font-size:20px;text-align: right">
					<td id="pre_price2" style="text-align:right;"></td> 
					<td>원</td>
				</tr>
				<tr>
					<td height=10></td>
				</tr>
				<tr>
					<td>적립예정<br>포인트</td>
					<input type="hidden" id="point" name="point" style="width:100px;border:0px;font-size:20px;text-align: right">
					<td id="point2" style="text-align:right;"></td> 
					<td>P</td>
				</tr>
				<tr>
					<td height=10></td>
				</tr>
				<tr>
					<td colspan="3" height=30><button  class="button_style" onClick="check_selectOrder();return false;">주문하기</button></td><td/>
					
				</tr>
			</table>
		</td>
		<td></td>
	</tr>			
</table>
<table width=1200 border=0>
	<tr height=12/>
	<tr>
		<td width=150></td>
		<td style="color:#5055B1;font-size:25px;">장바구니</td>
	</tr>
</table>
<table height=12/>
<p></p>
<c:choose>
	<c:when test="${sessionScope.m_id == null }">
		<table width=1200 border=0>
			<tr>
				<td width=150></td>
				<td style="background-color:#5055B1;color:white;">&nbsp;<input type = "checkbox" name = "all" value="checkbox" onclick = "checkall()" checked>&nbsp;&nbsp;전체</td>
				<td style="background-color:#5055B1" width=500></td>
				<td style="background-color:#5055B1" width=80>
				
					<a href=""><img src="/img/jjim2.png" style="width:30px;height:40px;background-color:#5055B1"></a>
					<button onClick="check_select();return false;" style="border:0px;background-color:#5055B1"><img src ="/img/delete_image1.png" style="width:30px;height:40px;background-color:#5055B1"></button>
				</td>
			</tr>
		</table>
	
		<table width=1200 border=0>
			<tr><td/><td colspan=7 style="border-bottom: 2px solid #5055B1"></td></tr>
			<c:set var="i" value="${0 }"/>
			<c:forEach var="list" items="${v2 }">
			<tr height=5/>
			<tr>
				<td width=150></td>
				<td>	
					<input type="checkbox" id="ap_check" name = "ap_check" value="${list.ct_uid }" checked >
					<input type="hidden" name="ct_uid" id="ct_uid" value="${list.ct_uid }">
					<input type="hidden" name="uid" id="uid" value="${list.uid }">
				</td>
				<td width=100><img src="/upload/${list.image }" style="width:100px;height:150px;"></td>&nbsp;
	
				<input type="hidden" id="price1[${i }]" name="price1" value="${list.price1 }">
				
				<c:choose>
				<c:when test="${list.qtys > 0}">
				<td>재고 : <fmt:formatNumber value="${list.qtys }"/></td>
				<input type="hidden" name="itemQty" value="${list.qtys }">
				</c:when>
				<c:otherwise>
				<td>재고 : 품절</td>
				<input type="hidden" name="itemQty" value="0">
				</c:otherwise>
				</c:choose>

				<td>
					<input type="button" id=qty- value="-" onclick="qty_num('-',${i })" style="width:22px;height:22px;">
					<input id="qty[${i }]" onkeyup="qty_ch(${i})" maxlength=3 min=1 name="qty" value="${list.qty }" style="width:20px;height:20px;border:1px solid blue;text-align:center" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<input type="button" id=qty+ value="+" onclick="qty_num('+',${i })" style="width:22px;height:22px;">
				</td>
				
				<td>
				<input id="total_price" name="total_price"  style="width:100px;height:25px;border:0px;text-align: right;font-size: 25px;" readonly>원<br>
				</td>
				
				<td><a href="delete?ct_uid=${list.ct_uid }">삭제</a></td>
			</tr>
			<tr><td/><td colspan=7 style="border-bottom:2px solid #5055B1"></td></tr>
			<c:set var="i" value="${i + 1 }"/>
			</c:forEach>
						
			</table>
				
		</c:when>
	<c:otherwise>
		<table width=1200 border=0>
			<tr>
				<td width=150></td>
				<td style="background-color:#5055B1;color:white;">&nbsp;<input type = "checkbox" name = "all" value="checkbox" onclick = "checkall()" checked>&nbsp;&nbsp;전체</td>
				<td style="background-color:#5055B1" width=500></td>
				<td style="background-color:#5055B1" width=80>
				
					<a href=""><img src="/img/jjim2.png" style="width:30px;height:40px;background-color:#5055B1"></a>
					<button onClick="check_select();return false;" style="border:0px;background-color:#5055B1"><img src ="/img/delete_image1.png" style="width:30px;height:40px;background-color:#5055B1"></button>
				</td>
			</tr>
		</table>
	
	
		<table width=1200 border=0>
			<tr><td/><td colspan=7 style="border-bottom: 2px solid #5055B1"></td></tr>
			<c:set var="i" value="${0 }"/>
			<c:forEach var="list" items="${v }">
			<tr height=5/>
			<tr>
				<td width=150></td>
				<td>	
					<input type="checkbox" id="ap_check" name = "ap_check" value="${list.ct_uid }" checked >
					<input type="hidden" name="ct_uid" id="ct_uid" value="${list.ct_uid }">
					<input type="hidden" name="uid" id="uid" value="${list.uid }">
				</td>
				<td width=100><img src="/upload/${list.image }" style="width:100px;height:150px;"></td>&nbsp;
				<td>&nbsp;&nbsp;${list.subject }<br><br>&nbsp; <fmt:formatNumber value="${list.price1 }"/>원(<fmt:formatNumber value="${list.mileage }"/>P)</td>
				<input type="hidden" id="price1[${i }]" name="price1" value="${list.price1 }">
				
				<c:choose>
				<c:when test="${list.qtys > 0}">
				<td>재고 : ${list.qtys }</td>
				<input type="hidden" name="itemQty" value="${list.qtys }">
				</c:when>
				<c:otherwise>
				<td>재고 : 품절</td>
				<input type="hidden" name="itemQty" value="0">
				</c:otherwise>
				</c:choose>
				
				<td>
					<input type="button" value="-" onclick="qty_num('-',${i })" style="width:22px;height:22px;">
					<input id="qty[${i }]" onkeyup="qty_ch(${i})" maxlength=3 min=1 name="qty" value="${list.qty }" style="width:20px;height:20px;border:1px solid blue;text-align:center" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<input type="button" id=qty+ value="+" onclick="qty_num('+',${i })" style="width:22px;height:22px;">
				</td>
				
				<td>
				<input id="total_price" name="total_price" style="width:100px;height:25px;border:0px;text-align: right;font-size: 25px;" readonly>원<br>		
				</td>
				
				<td><a href="delete?ct_uid=${list.ct_uid }">삭제</a></td>
			</tr>
			<tr><td/><td colspan=7 style="border-bottom:2px solid #5055B1"></td></tr>
			<c:set var="i" value="${i + 1 }"/>
			</c:forEach>
						
		</table>
	</form>
</c:otherwise>
</c:choose>
<script>

//직접입력시 변경
function qty_ch(num){
	
// 	alert($("input[name=qty]:eq("+num+")").val());
// 	if($("input[name=itemQty]:eq("+num+")").val() <= $("input[name=qty]:eq("+num+")").val()){
// 		alert("위험");
// 	} 
	var one_price = $("input[name=price1]:eq("+num+")").val(); //1개 가격
	var one_qty = $("input[name=qty]:eq("+num+")").val();
	var total_number = one_price * one_qty; //총 가격
	
// 	<fmt:formatNumber value=""/>
	var total_price = $("input[name=total_price]:eq("+num+")").val(total_number);
	
	var regexp = /^[0-9]*$/;
	total_number = total_number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	alert(total_number);
	$("input[name=total_price]:eq("+num+")").val(total_number);
// 	$("span[name=total_price3]:eq("+num+")").text(total_number);
		
	//alert(num);
	var sum2 = 0;	
	for(j=0;j<=num;j++){
		sum2 += $("input[name=price1]:eq("+j+")").val()*$("input[name=qty]:eq("+j+")").val();
	}
	//alert(sum2);	
 	abcd();
}


//수량 증가,감소 처리
function qty_num(str,num2){

	var num = parseInt($("input[name=qty]:eq("+num2+")").val());
	var one_price = parseInt($("input[name=price1]:eq("+num2+")").val());
	var c = 0;
	
	if(str == '-'){ //차감
		if(num <= 1){
			alert("주문 최소 수량은 1개입니다.");
			$("input[name=qty]:eq("+num2+")").val(1);
		}else{
			
		var total_number = one_price * (num-1);	
		var regexp = /^[0-9]*$/;
		total_number = total_number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		$("input[name=total_price]:eq("+num2+")").val(total_number);
		
		$("input[name=qty]:eq("+num2+")").val(num -1);
		
		$("#qty-").click(function() {
	    	window.reload();
	    })
		
		}
	}else{ //증가
		
		var total_number = one_price * (num+1);	
		var regexp = /^[0-9]*$/;
		total_number = total_number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		$("input[name=total_price]:eq("+num2+")").val(total_number);
		$("input[name=qty]:eq("+num2+")").val(num + 1);
		
		
	    $("#qty+").click(function() {
	    	window.reload();
	    })
	}
	abcd();
}

function checkall() {//체크박스 전체 선택 , 해제
	
	if(cart.all.checked) {
		for(i=1; i < (document.cart.length); i++){
			document.cart.elements[i].checked = true;
		}
	}else{
		for(i=1; i < (document.cart.length); i++){
			document.cart.elements[i].checked = false;
		}
	}
}

function check_select(){//체크박스 부분 선택
	myForm = document.getElementsByName("ap_check");
	myFormLen = myForm.length; //체크박스 전체수
	
	var checkUids = 0;
	
	
	if(myFormLen==1){//체크박스 전체 리스트 수가 1개 일때
		document.cart.ap_check.checked = true;
		check_one=document.cart.ap_check.value;
// 		alert(check_one);//체크된 값 확인
		checkUids = check_one;
		location.href="delete_select?lists="+check_one;
	
		return; 
	} 
	for(var i = 0;  i < document.cart.ap_check.length; i++) {
		 if(document.cart.ap_check[i].checked == true) break;
	}
	if(i == document.cart.ap_check.length) {
		alert("선택된 항목이 없습니다.");         
		return;
	}
	if(confirm('해당 상품을 삭제하시겠습니까?')){
		check_select2();
		return;
	} 
}
function check_select2(){//체크박스 전체 리스트 수가 2개 이상일 때
	var check_hide = new Array();

	for(var i = 0;  i < document.cart.ap_check.length; i++) {
		if(document.cart.ap_check[i].checked == true) {
			check_hide[i] = document.cart.ap_check[i].value;
		}
	}
	var checkUids = 0;
	checkUids = check_hide;
	
		location.href="delete_select?lists="+check_hide;
}


// 체크박스선택주문
function check_selectOrder(){//체크박스 부분 선택
	myForm = document.getElementsByName("ap_check");
	myFormLen = myForm.length; //체크박스 전체수
	
	var checkUids = "";
	
	if(myFormLen==0){
		alert("장바구니에 담긴 상품이 없습니다.");
		return;
	}
	
	if(myFormLen==1){//체크박스 전체 리스트 수가 1개 일때
		if(document.cart.ap_check.checked == true){
		check_one = document.cart.ap_check.value;
		cart.checkUids.value = check_one;
		document.cart.submit();
		return; 
		}else{
			alert("상품을 선택해주세요");         
			return;
		}
	} 
	for(var i = 0;  i < document.cart.ap_check.length; i++) {
		 if(document.cart.ap_check[i].checked == true) break;
	}
	if(i == document.cart.ap_check.length) {
		alert("상품을 선택해주세요");         
		return;
	}	
	if(i == document.cart.ap_check.length) {
		for(var i = 0;  i < document.cart.ap_check.length; i++) {
				check_hide[i] = document.cart.ap_check[i].value;
		}   
		return;
	}else{
		check_selectOrder2();
		return;
	} 
}
function check_selectOrder2(){//체크박스 전체 리스트 수가 2개 이상일 때
	var check_hide = new Array();

	for(var i = 0;  i < document.cart.ap_check.length; i++) {
		if(document.cart.ap_check[i].checked == true) {
			check_hide[i] = document.cart.ap_check[i].value;
		}else if(document.cart.ap_check[i].checked == false){
			check_hide[i] = 0;
		}
	}
	cart.checkUids.value = check_hide;
	document.cart.submit();
	
}


$(document).ready(function(){
	var num = ${i}; //상품 갯수
		
	for(i=0;i<num;i++){
		var one_price = $("input[name=price1]:eq("+i+")").val(); //1개 가격
		var one_qty = $("input[name=qty]:eq("+i+")").val();
		var total_number = one_price * one_qty; //총 가격
		var total_price = $("input[name=total_price]:eq("+i+")").val(total_number);
		var regexp = /^[0-9]*$/;
		total_number = total_number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("input[name=total_price]:eq("+i+")").val(total_number);
	
	}
});

	function abcd(){
	//총 상품금액
	var nums = ${i}; //상품 갯수
	var order_total = 0; //총 금액
	var delivery = 0;
	var pre_price = 0;
	var point = 0;
	var uids= "";
	var total_price = 0;
	var qtys = "";
	var stock = "";
	
	for(i=0;i<nums;i++){
		var one_price = $("input[name=price1]:eq("+i+")").val(); //1개 가격
		var one_qty = $("input[name=qty]:eq("+i+")").val(); //수량
		order_total += one_price * one_qty; //총 가격
		//$("input[name=total_price]:eq("+i+")").val(total_number);
		uids += $("input[name=uid]:eq("+i+")").val()+",";
		qtys += $("input[name=qty]:eq("+i+")").val()+",";
		stock += $("input[name=itemQty]:eq("+i+")").val()+","; 
	}
	cart.uids.value =uids;
	cart.qtys.value = qtys;
	cart.stock.value = stock;
	
	$("#total").val(order_total);
	
	if(total.value < 30000){
		delivery = 3000;
	}
	$("#delivery").val(delivery);
	
	pre_price = order_total+delivery;
	$("#pre_price").val(pre_price);
	
	point = Math.ceil(order_total*0.01);
	$("#point").val(point);
	
	commas();

}
abcd(); 

function commas(a) {
	
	// 콤마 빼고 
	var x = cart.total.value;
	//alert(x);
	x = x.replace(/,/gi, '');
	var y = cart.delivery.value;
// 	alert(y);
	
	var z = cart.pre_price.value;
	
	var zz = cart.point.value;
	

	// 숫자 정규식 확인
	var regexp = /^[0-9]*$/;
// 	if(!regexp.test(x)){ 
// 		$(t).val(""); 
// 		alert("숫자만 입력 가능합니다.");
// 	} 
		x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");	
		y = y.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		z = z.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		zz = zz.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(a).val(x);
		
	$("td[id=total2]").html(x);
	$("td[id=delivery2]").html(y);
	$("td[id=pre_price2]").html(z);

	var m_id ="${m_id}";
	   if(m_id==''){
	      $("td[id=point2]").html("0");
	   }else{
	      $("td[id=point2]").html(zz);
	   }
	

}
</script>
