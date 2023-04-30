<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
function divisionss_click(str){
	//alert(str);
			if(str=='new'){
				$("td[name=newww]").show();
				$("td[name=useddd]").hide();
				document.getElementById('diviCC').style.color= 'white';
				document.getElementById('diviCC').style.background='#88C7E0';
				document.getElementById('diviDD').style.color= '#F76300';
				document.getElementById('diviDD').style.background='white';
			}else{
				callFunction2(1,"orderUsed");
				$("td[name=newww]").hide();
				$("td[name=useddd]").show();
				document.getElementById('diviDD').style.color= 'white';
				document.getElementById('diviDD').style.background='#F76300';
				document.getElementById('diviCC').style.color= '#5288C9';
				document.getElementById('diviCC').style.background='white'
			}
			
}

function callFunction2(as,str){
	$.ajax({
		url: "/pageMove/pagemove", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "pageNum="+as+"&option="+str, //데이터 전달
		success:function(result){ //성공일 경우
			if(str == "order"){
				$("div[name=order_result]").html(result);
			}else if(str == "orderUsed"){
				$("div[name=orderUsed_result]").html(result);
			}
		
		},
		error:function(result){
			alert("실패");
			
		}	
	});
}

//페이지처음들어왔을떄 바로표기용
// callFunction2(1,"order");


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
			<div width=1200 id="A" name="order_result" style="display:block;"></td>
</td>
</tr>
</table>

<table>
<tr>
<td name="useddd" id="useddd" style="display:none;">

	<div width=1200 id="B" name="orderUsed_result" style="display:block;"></td>
	
</td>
</tr>
</table>