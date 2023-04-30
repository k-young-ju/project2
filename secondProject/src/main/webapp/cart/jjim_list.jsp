<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp"%>
<style>




input[type=checkbox] + .circle{
 display: inline-block; /* 영역적용가능해짐 */
  width: 20px; height: 20px;
  border: 2px solid #666;
  box-sizing: border-box;
  border-radius: 10px; /* 모서리둥글게 처리 */
  position: relative; top: 4px;
  cursor: pointer; /* 마우스 올렸을때 손모양 처리 */

  background-image: url(https://blog.kakaocdn.net/dn/XTnSL/btrhtUIVtpB/5FungHN6IXVXG8bLbhE9Dk/img.png);
  background-size: 70%;
  background-repeat: no-repeat;
  background-position: center;
}
input[type=checkbox]:checked + .circle{
 background-color:#5055B1;
  border-color: #5055B1;
  background-image: url(https://blog.kakaocdn.net/dn/t7a2D/btrhtVgLYmG/dUxzAkBy9hIZ4gHmyllQrk/img.png);
}

/* 체크박스는 display:none;을 주면 데이터 처리가 안됨 */
input[type=checkbox]{
	position: absolute; left: -999em;
}
 
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

.btn-2 {
  background: rgb(96,9,240);
  background: linear-gradient(0deg, rgba(49,164,210,0.9) 0%, rgba(143,164,210,0.8) 100%);
  border: none;
  
}

.btn-2:before {
  height: 0%;
  width: 2px;
}

.btn-1 {
  background: rgb(6,14,131);
  background: linear-gradient(0deg, rgba(6,14,131,1) 0%, rgba(12,25,180,1) 100%);
  border: none;
}
.btn-1:hover {
   background: rgb(0,3,255);
background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
}
</style>
<script>

function item_ch(str){
	//alert(str);
	$.ajax({
		url: "/item/item_ch", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "option="+str, //데이터 전달

		success:function(result){ //성공일 경우
			//alert(result);
			if(result=='new'){
				document.getElementById('new').style.display='inline';
				document.getElementById('used').style.display='none';
				
// 				document.getElementById('new_button').style.color='white';
// 				document.getElementById('new_button').style.background='#5055B1';
// 				document.getElementById('used_button').style.color='black';
// 				document.getElementById('used_button').style.background='white';
				
				document.getElementById('new_button').style.color= 'white';
				document.getElementById('new_button').style.background='#88C7E0';
				document.getElementById('used_button').style.color= '#F76300';
				document.getElementById('used_button').style.background='white';
				
			}else if(result=='used'){
							
				document.getElementById('new').style.display='none';
				document.getElementById('used').style.display='inline';
				
// 				document.getElementById('used_button').style.color='white';
// 				document.getElementById('used_button').style.background='#5055B1';
// 				document.getElementById('new_button').style.color='black';
// 				document.getElementById('new_button').style.background='white';
				document.getElementById('used_buttonn').style.color= 'white';
				document.getElementById('used_buttonn').style.background='#F76300';
				document.getElementById('new_buttonn').style.color= '#5288C9';
				document.getElementById('new_buttonn').style.background='white';
			}
			
		}
	
	});
}

//item_ch('new');

function allCheck1(){
	if(delete_new.all1.checked){
		for(i=1;i<(document.delete_new.length);i++){
			document.delete_new.elements[i].checked = true;
		}
	}else{
		for(i=1;i<(document.delete_new.length);i++){
			document.delete_new.elements[i].checked = false;
		}
	}	
	
}

function allCheck2(){
	
	if(delete_used.all2.checked){
		for(i=1;i<(document.delete_used.length);i++){
			document.delete_used.elements[i].checked = true;
		}
	}else{
		for(i=1;i<(document.delete_used.length);i++){
			document.delete_used.elements[i].checked = false;
		}
	}	
}

function check_select_new(){//체크박스 부분 선택
	myForm = document.getElementsByName("apCheck1");
	myFormLen = myForm.length; //체크박스 전체수
	if(myFormLen==1){//체크박스 전체 리스트 수가 1개 일때
		document.delete_new.apCheck1.checked = true;
		check_one=document.delete_new.apCheck1.value;
		//alert(check_one);//체크된 값 확인
		var result = confirm('찜 정보를 삭제하시겠습니까?');
		
		if(result == true){
			location.href="jjimDelete?uid="+check_one+"&option=new";
			return;
		}else{
			return;
		}
	} 
	for(var i = 0;  i < document.delete_new.apCheck1.length; i++) {
		 if(document.delete_new.apCheck1[i].checked == true) break;
	}
	if(i == document.delete_new.apCheck1.length) {
		alert("선택된 항목이 없습니다.");         
		return;
	}
	check_select_new2();
	return;
}

function check_select_new2(){//체크박스 전체 리스트 수가 2개 이상일 때
	var check_hide = new Array();

	var result2 = confirm('찜 정보를 삭제하시겠습니까?');
	if(result2 == true){
		for(var i = 0;  i < document.delete_new.apCheck1.length; i++) {
			if(document.delete_new.apCheck1[i].checked == true) {
				check_hide[i] = document.delete_new.apCheck1[i].value;
			}
		}
			
			location.href="jjimDelete?uids="+check_hide+"&option=new";
	}

}


function check_select_used(){//체크박스 부분 선택
	myForm = document.getElementsByName("apCheck2");
	myFormLen = myForm.length; //체크박스 전체수
	if(myFormLen==1){//체크박스 전체 리스트 수가 1개 일때
		document.delete_used.apCheck2.checked = true;
		check_one=document.delete_used.apCheck2.value;
		
		var result = confirm('찜 정보를 삭제하시겠습니까?');
		
		if(result == true){
			location.href="jjimDelete?uid="+check_one+"&option=used";
			return;
		}else{
			return;
		}
	} 
	for(var i = 0;  i < document.delete_used.apCheck2.length; i++) {
		 if(document.delete_used.apCheck2[i].checked == true) break;
	}
	if(i == document.delete_used.apCheck2.length) {
		alert("선택된 항목이 없습니다.");         
		return;
	}
		check_select_used2();
		return;
	
}

function check_select_used2(){//체크박스 전체 리스트 수가 2개 이상일 때
	var check_hide = new Array();

	var result2 = confirm('찜 정보를 삭제하시겠습니까?');
	if(result2 == true){
		for(var i = 0;  i < document.delete_used.apCheck2.length; i++) {
			if(document.delete_used.apCheck2[i].checked == true) {
				check_hide[i] = document.delete_used.apCheck2[i].value;
			}
		}
			
			location.href="jjimDelete?uids="+check_hide+"&option=used";
	}
	
	
}
</script>


<center>

<div id="new" >
<table ><tr><td height=30></td></tr></table>
<form id="delete_new" name="delete_new" action="/cart/jjim" >
<table style="width:1200px;" align=center; border=0>	
	<tr>
		<td width=30>
			<label for="all1">
				<input type="checkbox" id="all1" name="all1" onclick="allCheck1()" >
				 <i class="circle"></i>
			 </label>
		</td>
		<td>
			<button onclick="check_select_new();return false;" class="custom-btn btn-1">선택삭제</button>
		</td>
		<td style="text-align: left;color:#5055B1"><h2>찜목록</h2></td>
		<td width=400 style="padding-left:20px;">
			<span id ="new_button"  style="width:200px;height:40px;border: 1px solid #88C7E0;border-radius: 10px;cursor: pointer" onclick="item_ch('new')">신간</span>
			<span id="used_button"  style="width:200px;height:40px;border: 1px solid #F76300;border-radius: 10px;cursor: pointer" onclick="item_ch('used')">중고</span>
		</td>
	</tr>
</table>
<table ><tr><td height=30></td></tr></table>
	<table border=0 style="text-align: center;width:1200px;'">
			<c:set var="num" value="${0 }" />
			<c:forEach var="list" items="${v }">
				<c:if test="${num % 2 == 0 }"><tr></c:if>
					
					<td width = 200 align=center height=250  style="text-align: left" >
						<table border=0>
							<tr>
								<td width=10 valign="top">
									<label for="apCheck1[${num }]">
									<input type="checkbox" id="apCheck1[${num }]" name="apCheck1" value="${list.uid }">
									 <i class="circle"></i>
									 </label>
								</td>
								<td style="cursor: pointer" onclick="location.href='/board/view?uid=${list.uid}&list_option=${list_option }'">
									<img src="/upload/${list.image }" class="comment_img" style="width:200px;height:230px;border:1px solid gray" >
								</td>
								<td width=20></td>
								<td valign="top">
									<table>
										<tr>
											<td><a href="/board/view?uid=${list.uid}&list_option=${list_option }">${list.subject }</a></td>
										</tr>
										<tr>	
											<td style="font-weight: bold;" colspan=2>${list.price1 }원</td><td></td>
										</tr>
										<tr>
											<td colspan=2>${list.n_writer }</td>
										</tr>
									</table>		
								</td>
							</tr>	
						</table>
					</td>
					<td width=20></td>
				<c:if test="${num % 2 == 1 }"></tr></c:if>
				<c:set var="num" value="${num+1 }"/>
			</c:forEach>
		</table>
</form>		
</div>

<div id="used" >
<table ><tr><td height=30></td></tr></table>
<form id="delete_used" name="delete_used" action="" method="post">
<table style="width:1200px;" align=center border=0>	
	<tr>
		<td width=30>
			<label for="all2">
				<input type="checkbox" id="all2" name="all2" onclick="allCheck2()">
				<i class="circle"></i>
			 </label>
		</td>
		<td>
			<button onclick="check_select_used();return false;" class="custom-btn btn-1">선택삭제</button>
		</td>
		<td style="text-align: left;color:#5055B1"><h2>찜목록</h2></td>
		<td width=400 style="padding-left:20px;">
			<span id="new_buttonn" style="width:200px;height:40px;border: 1px solid #88C7E0;border-radius: 10px;cursor: pointer" onclick="item_ch('new')" >신간</span>
			<span id="used_buttonn" style="width:200px;height:40px;border: 1px solid #F76300;border-radius: 10px;cursor: pointer" onclick="item_ch('used')">중고</span>
		</td>
	</tr>
</table>
<table ><tr><td height=30></td></tr></table>
	<table  border=0 style="text-align: center;width:1200px;">
			<c:set var="num" value="${0 }" />
			<c:forEach var="list" items="${v2 }">
				<c:if test="${num % 2 == 0 }"><tr></c:if>
					<td width = 200 align=center height=250  style="text-align: left" >
						<table border=0>
							<tr>
								<td width=10 valign="top">
									<label for="apCheck2[${num }]">
									<input type="checkbox" id="apCheck2[${num }]" name="apCheck2" value="${list.uid }">
									<i class="circle"></i>
									 </label>
								</td>
								<td style="cursor: pointer" onclick="location.href='/board/view?uid=${list.uid}&list_option=${list_option }'"><img src="/upload/${list.image }" class="comment_img" style="width:200px;height:230px;border:1px solid gray" ></td>
								<td width=20></td>
								<td valign="top">
									<table>
										<tr>
											<td><a href="/board/view?uid=${list.uid}&list_option=${list_option }">${list.subject }</a></td>
										</tr>
										<tr>	
											<td style="font-weight: bold;" colspan=2>${list.price1 }원</td><td></td>
										</tr>
										<tr>
											<td colspan=2>${list.n_writer }</td>
										</tr>
									</table>		
								</td>
							</tr>	
						</table>
					</td>
					<td width=20></td>
				<c:if test="${num % 2 == 1 }"></tr></c:if>
				<c:set var="num" value="${num+1 }"/>
			</c:forEach> 
			
		</table>
</form>		
</div>
	
	</center>	
	<script>
	var tab_choose = "${option}";
	if(tab_choose == 'used'){
		item_ch('used');
	}else{
		item_ch('new');
	}
	</script>