<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function division_click(str){
	//alert(str);
		
	$.ajax({
		url: "/item/item_ch", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "option="+str, //데이터 전달

		success:function(result){ //성공일 경우
			callFunction2(1,"buyUsed");
			if(result=='new'){
				$("td[name=new]").show();
				$("td[name=used]").hide();
				document.getElementById('diviA').style.color= 'white';
				document.getElementById('diviA').style.background='#88C7E0';
				document.getElementById('diviB').style.color= '#F76300';
				document.getElementById('diviB').style.background='white';
			}else{
				$("td[name=new]").hide();
				$("td[name=used]").show();
				document.getElementById('diviB').style.color= 'white';
				document.getElementById('diviB').style.background='#F76300';
				document.getElementById('diviA').style.color= '#5288C9';
				document.getElementById('diviA').style.background='white'
			}
			
		}
	
	});
}

function callFunction2(as,str){
	$.ajax({
		url: "/pageMove/pagemove", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "pageNum="+as+"&option="+str, //데이터 전달
		success:function(result){ //성공일 경우
			if(str == "buy"){
				$("div[name=buy_result]").html(result);
			}else if(str == "buyUsed"){
				$("div[name=buyUsed_result]").html(result);
			}
		},
		error:function(result){
			alert("실패");
			
		}	
	});
}

// callFunction2(1,"buy");
</script>
	<table width="1200" border=0>	
		<tr>
			<td align=left style="color:#5288C9;width:65px;height:20px;border:1px solid #88C7E0;border-radius: 10px;cursor:pointer;text-align:center;background-color:#88C7E0;color:white;" onClick="division_click('new')" id="diviA" style="background-color:#88C7E0;color:white">신품</td>
			<td width=10/>
			<td align=left style="color:#F76300;width:65px;height:20px;border:1px solid #F76300;border-radius: 10px;cursor:pointer;text-align:center;" onClick="division_click('used')" id="diviB">중고</td>
			<td width=230/>
			<td style="text-align:center;color:#5055B1"><h2>구매내역</h2></td>
			<td width=200/>
			<td align=right width=200>
			</td>						
		</tr>
	</table>
	
	
<table>
<tr>
<td name="used" id="used" style="display:none;">
	<table width=1200 border=0>
		<tr height=20/>
		<tr height=45>
			<td width=240 style="text-align:center;" id="tdcolor">상품</td>
			<td width=240 style="text-align:center;" id="tdcolor">상품명</td>
			<td width=240 style="text-align:center;" id="tdcolor">개수</td>
			<td width=240 style="text-align:center;" id="tdcolor">판매가</td>
			<td width=240 style="text-align:center;" id="tdcolor">합계</td>
		</tr>
		<tr height=1><td style="border-bottom:2px solid #5055B1;" colspan=7/></tr>
	
		<c:set var="i" value="${0 }"/>
		<c:forEach var="list" items="${v5 }">		
		<tr height=80>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;"><img src="/upload/${list.image }" style="width:90px;height:80px;vertical-align:middle;"></td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${list.subject }</td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">${list.qty }</td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;"><fmt:formatNumber  value="${list.price1 }"/></td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;"><fmt:formatNumber  value="${list.qty * list.price1 }"/>원</td>							
		</tr>	
		<c:set var="i" value="${i + 1 }"/>
		</c:forEach>					
	</table>
</td>
</tr>
</table>

<table>
<tr>
<td name="new" id="new" style="display:block;">
	<table width=1200 border=0>
		<tr height=20/>
		<tr height=45>
			<td width=240 style="text-align:center;" id="tdcolor">상품</td>
			<td width=240 style="text-align:center;" id="tdcolor">상품명</td>
			<td width=240 style="text-align:center;" id="tdcolor">개수</td>
			<td width=240 style="text-align:center;" id="tdcolor">판매가</td>
			<td width=240 style="text-align:center;" id="tdcolor">합계</td>
		</tr>
		<tr height=1><td style="border-bottom:2px solid #5055B1;" colspan=7/></tr>
	
		<c:set var="i" value="${0 }"/>
		<c:forEach var="lists" items="${v4 }">		
		<tr height=80>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;"><img src="/upload/${lists.image }" style="width:90px;height:80px;vertical-align:middle;"></td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${lists.subject }</td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;">${lists.qty }</td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;"><fmt:formatNumber  value="${lists.price1 }"/></td>
			<td width=240 style="text-align:center;border-bottom:1px solid #5055B1;"><fmt:formatNumber  value="${lists.qty * lists.price1 }"/>원</td>							
		</tr>	
		<c:set var="i" value="${i + 1 }"/>
		</c:forEach>					
	</table>	
</td>
</tr>
</table>
