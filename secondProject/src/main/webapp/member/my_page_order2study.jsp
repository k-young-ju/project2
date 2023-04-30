<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
function divisionss_click(str){
	//alert(str);
		
	$.ajax({
		url: "/item/item_ch", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "option="+str, //데이터 전달

		success:function(result){ //성공일 경우
			//alert(result);
			if(result=='new'){
				$("td[name=newww]").show();
				$("td[name=useddd]").hide();
				document.getElementById('diviCC').style.color= 'white';
				document.getElementById('diviCC').style.background='#88C7E0';
				document.getElementById('diviDD').style.color= '#F76300';
				document.getElementById('diviDD').style.background='white';
			}else{
				$("td[name=newww]").hide();
				$("td[name=useddd]").show();
				document.getElementById('diviDD').style.color= 'white';
				document.getElementById('diviDD').style.background='#F76300';
				document.getElementById('diviCC').style.color= '#5288C9';
				document.getElementById('diviCC').style.background='white'
			}
			
		}
	
	});
}

function callFunction(main,sub,as){
	$.ajax({
		url: "/pageMove/pagemove", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "pageNum="+as+"&main="+main+"&sub="+sub, //데이터 전달
		success:function(result){ //성공일 경우
// 			alert(result);
			var arr = result.split(',');
// 			alert(arr[0]);
// 			alert(arr[1]);
// 			alert(arr[2]);
			var as = arr[0];
			var main = arr[1];
			var sub = arr[2] 
			location.href = '/member/my_page?pageNum='+as;
 			num_ch(main,sub,as);
			
		},
		error:function(result){
			alert("실패");
			
		}	
	});
}


function num_ch(main,sub,as){
	
	tab_click("product");
	if(main == "mileage"){
		alert(sub);
// 		locaion.href = "/member/my_page";
		tab_click(main);
		divisionss_click(sub);
	}

}

function callFunction2(as,str){
	$.ajax({
		url: "/pageMove/pagemoveorder", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "pageNum="+as+"&option="+str, //데이터 전달
		success:function(result){ //성공일 경우
			$("div[name=order_result]").html(result);
		},
		error:function(result){
			alert("실패");
			
		}	
	});
}

// callFunction2(1);

function num_ch2(main,sub,as){
	
	tab_click("product");
	if(main == "mileage"){
		alert(sub);
// 		locaion.href = "/member/my_page";
		tab_click(main);
		divisionss_click(sub);
	}

}

</script>    
    
    
	<table width="1200" border=0>	
		<tr>
			<td align=left style="color:#5288C9;width:65px;height:20px;border:1px solid #88C7E0;border-radius: 10px;cursor:pointer;text-align:center;background-color:#88C7E0;color:white;" onClick="divisionss_click('new')" id="diviCC" style="background-color:#88C7E0;color:white">신품</td>
			<td width=10/>
			<td align=left style="color:#F76300;width:65px;height:20px;border:1px solid #F76300;border-radius: 10px;cursor:pointer;text-align:center;" onClick="divisionss_click('used')" id="diviDD">중고</td>
			<td width=230/>
			<td style="text-align:center;color:#5055B1"><h2>주문내역</h2></td>
			<td width=200/>
			<td align=right width=200>
			</td>						
		</tr>
	</table>
	
	
<table>
<tr>
<td name="newww" id="newww" style="display:block;">
		
<!-- 	<table width=1200 border=0> -->
<!-- 		<tr height=20/> -->
<!-- 		<tr height=45> -->
<!-- 			<td width=240 style="text-align:center;" id="tdcolor">주문번호</td> -->
<!-- 			<td width=140 style="text-align:center;" id="tdcolor">수령인</td> -->
<!-- 			<td width=140 style="text-align:center;" id="tdcolor">주문금액</td> -->
<!-- 			<td width=140 style="text-align:center;" id="tdcolor">적립포인트</td> -->
<!-- 			<td width=240 style="text-align:center;" id="tdcolor">주문상태</td> -->
<!-- 			<td width=540 style="text-align:center;" id="tdcolor">요청사항</td> -->
<!-- 			<td width=540 style="text-align:center;" id="tdcolor">상세보기</td> -->
<!-- 			<td width=540 style="text-align:center;" id="tdcolor">주문취소</td> -->
<!-- 		</tr> -->
<!-- 		<tr height=1><td style="border-bottom:2px solid #5055B1;" colspan=8/></tr> -->
	
<%-- 		<c:set var="i" value="${0 }"/> --%>
<%-- 		<c:forEach var="list" items="${v7 }">		 --%>
<!-- 		<tr height=80> -->
<%-- 			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${list.od_id }</td> --%>
<%-- 			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${list.od_b_name }</td> --%>
<%-- 			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${list.od_price }</td> --%>
<%-- 			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${list.od_point }</td> --%>
<%-- 			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${list.od_status }</td> --%>
<%-- 			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${list.require1 }	</td> --%>
<%-- 			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;<a href="/order/orderViewDetail?od_id=${list.od_id }&order_option=a">상세보기</a></td> --%>
<%-- 			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;<c:if test="${list.od_status eq '주문' }"><a href="/order/cancel?od_id=${list.od_id }&order_option=a">주문취소</a></c:if></td> --%>
			<div width=1200 id="A" name="order_result" style="display:block;"></td>
					
<!-- 		</tr>	 -->
<%-- 		<c:set var="i" value="${i + 1 }"/> --%>
<%-- 		</c:forEach> --%>
							
</td>
</tr>
</table>

<table>
<tr>
<td name="useddd" id="useddd" style="display:none;">
	<table border=0 width=1200 align=center>
		<tr>			
			<td width=900>
			<c:if test="${count>0 }">
			<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
			<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
			<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
			<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
		
			<!-- 2개의 변수 초기화 -->
			<c:set var="startPage" value="${1 }" />
			<c:set var="pageBlock" value="${5 }" />	
		
			<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분-->
			<c:if test="${pageNum > pageBlock }">
				<!-- 결과를 정수형으로 리턴 받아야 하기 때문에 fmt -->
				<fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
				<c:set var="startPage" value="${result * pageBlock + 1 }" />
			</c:if>	
		
			<!-- endPage 값 설정 부분 -->
			<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
			<c:if test="${endPage > pageCount }">
				<c:set var="endPage" value="${pageCount }" />
			</c:if>
			
			<!-- 이전 링크 -->
			<td width=75 style="text-align:center">
			<c:if test="${startPage > pageBlock }">
				<a href="my_page?pageNum=${startPage - pageBlock }">[이전] </a>
			</c:if>
			</td>
			
			<!-- 페이징 링크 -->
			<td width=100 style="text-align:center;font-size:25px;">
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum == i }">
						<a href="my_page?pageNum=${i }" target="_self"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
						<a href="javascript:callFunction('mileage','new',${i });"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
						<a href="javascript:callFunction2(${i },'orderUsed');"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
					</c:when>
					<c:otherwise>
						<a href="my_page?pageNum=${i }" target="_self"><span style="padding:0px 4px;">${i }</span></a>
						<a href="javascript:callFunction('mileage','new',${i });"><span style="padding:0px 4px;">${i }</span></a>
						<a href="javascript:callFunction2(${i },'orderUsed');"><span style="padding:0px 4px;">${i }</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</td>			
			<!-- 다음 링크 -->
			
			<td width=75 style="text-align:center">
			<c:if test="${endPage < pageCount }">
				<a href="my_page?pageNum=${startPage + pageBlock }">[다음] </a>
			</c:if>	
			</c:if>
			</td>
		<tr>
	</table>
	<div width=1200 id="B" name="orderUsed_result" style="display:block;"></td>
	
</td>
</tr>
</table>