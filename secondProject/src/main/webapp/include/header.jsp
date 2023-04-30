<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책판다</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<link rel="stylesheet" href="/css/basic.css">
<%
//오늘 날짜
java.util.Date today3 = new java.util.Date();
SimpleDateFormat cal3 = new SimpleDateFormat("yyyyMMddHHmmss");
String signdate3 = cal3.format(today3);

// session.removeAttribute("cart");

String session_id = (String)session.getAttribute("m_id");
String str3 = "b" + signdate3 ; //문자열 + 아이디
String session_cart = (String)session.getAttribute("cart");
if(session_id == null && session_cart == null){ //장바구니 세션 값이 없다면
	session.setAttribute("cart", str3);
}
%>
<%-- <%=session_id %><br> --%>
<%-- session_cart :|| ${sessionScope.cart } ${cart }asd --%>



<style>
/* 전체영역에서 여백을 없애줌 */
	* {
		margin: 0;
		padding: 0;
		z-index: 0;
	}
	
	table{
		padding:0;
		margin:0;
		border-spacing:0;
	}
	
	a{
		text-decoration: none;
		color:#5055B1;
	}	
	body{
		font-family: 'BookkMyungjo-Bd';
		font-size:20px;
	}

	.td1{
		border:5px solid black;    
		margin:0;
		padding:0;
		font-size:20px;
		background-color: white;
		color:black;
	}
	 
	   
	.click_option{
		position:absolute;
		z-index:1;
		display:none;
		width:1600px;
		height:500px;
		background-color:white;
		border:1px solid gray;
		transform:translate(50px, 20px);
		overflow: auto; /* Enable scroll if needed */
		overflow-x:hidden;
		border-radius: 15px 15px 15px 15px;
			
		}    
	header{
		z-index:1;
	 	position:fixed;
	 	width:100%;
		background-color:white;
		align:center;
	
	}
	
	.t_search{
	width:100%;
	height:50px;
	border:1px solid #5055B1;
	border-radius: 15px;
	}
	
	.cart_img{
		background-image: url("/img/cartLogo.png");
		background-repeat: no-repeat;
		background-size: 60%;
		background-position: center;
		cursor:pointer;
	}
	.cart_img2{
		background-image: url("/img/cartNum.png");
		background-position:center;
		background-size:cover;
		width:35px;
		height:35px;
		transform:translateX(25px) translateY(-15px);
		
	
	}
</style>

<script>

function cartNum(){
	var id ="${m_id}";
	var cart ="${cart}";
// 	alert(cart);
	//alert(id);
	$.ajax({		
		url: "/head_num",
		type: "post",
		dataType: "text",
		data: "session_id="+id+"&session_cart="+cart,
		success:function(result){
// 			alert(result);
		$("span[name=cartNum]").text(result);
		
		}
	});

}
cartNum();

function tab_click(str,num){
	
	//alert(num);
	$.ajax({
		url: "/modal_ch", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "modal_option="+str+"&list_option="+num, //데이터 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(result){ //성공일 경우
			//alert(result);
			$("span[name=modal_result]").html(result);
			
			if (str=='book1'){
				
				document.getElementById('AA').style.color='white';
				document.getElementById('AA').style.background='#5055B1';
				document.getElementById('BB').style.color='#000000';
				document.getElementById('BB').style.background='#ffffff';
				
				kind_small_go('1010','2','국내','0');
				
			}else{
				kind_small_go('2010','3','국내','0');
				
				document.getElementById('AA').style.color='#000000';
				document.getElementById('AA').style.background='#ffffff';
				document.getElementById('BB').style.color='white';
				document.getElementById('BB').style.background='#5055B1';
				
				
			}
		}
	});

}

function kind_small_go(code,option,ca_name,num){
	//alert(num);
	$.ajax({
		url: "/modal_ch2", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "code="+code+"&list_option="+option+"&ca_name="+ca_name, //데이터 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(result){ //성공일 경우
			//alert(result);
			$("span[name=modal_result2]").html(result);
			$("td[name=modal_tab]").css("color","#5055B1");
			$("td[name=modal_tab]").css("background","white");
			$("td[name=modal_tab]:eq("+num+")").css("color","white");
			$("td[name=modal_tab]:eq("+num+")").css("background","#5055B1");
		}
	});
}
 
 
 
// function view_layer(){
// 	document.getElementById("lay_div").style.display="inline";
// 	document.querySelector('body').style.backgroundColor = "rgba(0,0,0,0.2)";
	
// }

// function view_out(){
// 	document.getElementById("lay_div").style.display="none";
// 	document.querySelector('body').style.backgroundColor = "rgba(0,0,0,0.0)";
// }



</script>
 <script type="text/javascript">      
      	function open_pop() {
      		tab_click('book1','2');
      		
      		if($("#lay_div").css("display") == "none"){
      			$('#lay_div').show();
      			document.querySelector('body').style.backgroundColor = "rgba(0,0,0,0.05)";
      			document.getElementById("img").src = "/img/close_button.png";
      		}else{
      			$("#lay_div").hide();
      			document.querySelector('body').style.backgroundColor = "white";
      			document.getElementById("img").src = "/img/cate02.png";
      		}
//       		document.querySelector('header').style.backgroundColor = "rgba(0,0,0,0.02)";
        }    
      	
   function search_go(){
	   if(t_search.value==""){
		  alert("검색어를 입력해주세요");
		  return false;
		   
	   }
   }	
 </script>


</head>


<body>

<header>
<center>

<table width=100% border=0>
	<tr>
		<td width=130/>
		<td style="width:615px;">
			<a href="/"><img src="/img/Logo5.png" style="width:615px;height:140px"></a><br>
		</td>
		<td width=20/>
		<td width=600>
		<form action="/t_search" method="get" onsubmit="return search_go()">
			<table border=0 class="t_search">
				<tr>
					<td style="padding-left: 10px;text-align:left;"  valign="top"> 
						<input id="t_search" name="t_search" value="${t_search }" style="width:95%;height:45px;border:0;padding-left: 10px;border-radius: 15px;font-size:25px;outline: none;">
					</td>
					<td width=50>	
						<button style="border:0px;"><img src="/img/search_icon.png"></button>
						
					</td>
				</tr>
			</table>
		</form>	
		</td>
		<c:choose>
			<c:when test="${sessionScope.m_id == null }">
				<td width=100 align=right style="vertical-align:middle;"><a href="/member/login"><img src ="/img/log-in.png" style="width:60px;height:60px;">&nbsp;&nbsp;</a></td>
				<td width=80 align=center style="vertical-align:middle;"><a href="/member/join"><img src ="/img/signup.png" style="width:60px;height:60px;">&nbsp;&nbsp;</a></td>
				<td width=80 height=50 align=center  class="cart_img" onclick="location.href='/cart/list'">
					<div class="cart_img2">
						<span id="cartNum" name="cartNum" style="color: white;vertical-align: middle;">${cartNum }</span>
					</div>
				</td>
			</c:when>
			<c:otherwise>
				<td width=100 align=right><a href="/member/my_page"><img src ="/img/user.png" style="width:50px;height:40px;">&nbsp;&nbsp;</a></td>
				<td width=100 align=center><a href="/member/logout"><img src ="/img/shutdown.png" style="width:50px;height:40px;">&nbsp;&nbsp;</a></td>
<!-- 				<td width=80 align=center><a href="/cart/list"><img src ="/img/cartLogo.png" style="width:50px;height:40px;">&nbsp;&nbsp;</a></td> -->
				<td width=80 height=50 align=center  class="cart_img" onclick="location.href='/cart/list'">
					<div class="cart_img2">
						<span id="cartNum" name="cartNum" style="color: white;vertical-align: middle;">${cartNum }</span>
					</div>
				</td>
						
			</c:otherwise>
		</c:choose>
		<td width=400 align=center>
			<c:if test="${sessionScope.m_level == '10' }">
			<a href = "/admin">[관리자]</a>
			</c:if>
		</td>
	</tr>
	<tr height=20></tr>
</table>



<table width=1800 border=0">
<tr>
	<td width=100 border=1></td>
	<td style="border-top:0px solid #9A9A9A;border-bottom:0px solid #9A9A9A;border-left:0px solid #9A9A9A">
	  	<table width=100 border=0>
	   	<tr>
	   		<td width=100 style="text-align: center;"><img id="img" src="/img/cate02.png" style="width:40px;height:40px;" onclick="open_pop()">
<!-- 	   		여기서 헤멤 onclick 영역을 td로 잡아놓으면 td크기가 작더라도 td클릭시 하위요소들이 다실행되어버림 그러니까 이미지에만 부여 -->
	   			<div id="lay_div" class="click_option" style="border:2px solid #5055B1">
	   				<table width=1600 border=0 style="padding:0;margin:0;border-spacing : 1;">
	   					<tr>
	   						<td>
									<table width="1600" border=0 style="padding:0;margin:0;border-spacing :0";>							
										<tr style="padding:0;margin:0;border-spacing : 0">
											<td height=60 width="400" align="center" id="AA" onClick="tab_click('book1','2')" style="cursor:pointer;background-color: #5055B1;color: white;">신간도서</td>
											<td height=60 width="400" align="center" id="BB" onClick="tab_click('book2','3')" style="cursor:pointer">중고물품</td>
											
											
										</tr>
									</table>
																		
<!-- 									<table border=0><tr height=20></tr></table> -->
									
									<table width=1600 style="border-top:2px solid #A5CAD2"><tr><td></td></tr></table>
									
									<table border=0>
									<tr height=60></tr>
									</table>
										<table border=0 width=1600>
											<tr>
												<td valign="top">
													<span  name="modal_result" style="display:block;cursor: pointer">	</span>
												</td>
												<td width=1000 valign="top"><span name="modal_result2"></span></td>
											</tr>
														
									</table>
							</td>
	   					</tr>	
	   				</table>	
	   				<table><tr><td height=200></td></tr></table>
			
				</div>
	   		</td>
	   	</tr>
	   </table>	
	</td>
<!-- 모달창끝 -->


	<td width=1600 style="border-bottom:0px solid #9A9A9A;border-top:0px solid #9A9A9A;border-right:0px solid #9A9A9A">

		<table border=0 width=1600>
			<tr>
				<td width=200></td>
				<td><a href="/board/list?list_option=1">베스트셀러</a></td>
				<td><a href="/board/list?list_option=2">신간도서</a></td>
				<td><a href="/board/list?list_option=3">중고거래</a></td>
				<td><a href = "/notice/main">고객센터</a></td>
			</tr>
		</table>
	</td>
</tr>
</table>

<table height=20 width=100% style="border-bottom:2px solid #5055B1;"><tr><td></td></tr></table>
</center>
</header>


<!-- 모달띄우기끝 -->

