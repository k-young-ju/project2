<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function division_click(str){
		
	$.ajax({
		url: "/item/item_ch", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "option="+str, //데이터 전달

		success:function(result){ //성공일 경우
			if(result=='new'){
				$("td[name=newww]").show();
				$("td[name=useddd]").hide();
				document.getElementById('diviA').style.color= 'white';
				document.getElementById('diviA').style.background='#88C7E0';
				document.getElementById('diviB').style.color= '#F76300';
				document.getElementById('diviB').style.background='white';
			}else{
				callFunction3(1,"buyUsed");
				$("td[name=newww]").hide();
				$("td[name=useddd]").show();
				document.getElementById('diviB').style.color= 'white';
				document.getElementById('diviB').style.background='#F76300';
				document.getElementById('diviA').style.color= '#5288C9';
				document.getElementById('diviA').style.background='white'
			}
			
		}
	
	});
}

function callFunction3(as,str){
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
<td name="newww" id="newww" style="display:block;">
	<div width=1200 id="A" name="buy_result" style="display:block;"></td>
</td>
</tr>
</table>
	
	
<table>
<tr>
<td name="useddd" id="useddd" style="display:none;">
	<div width=1200 id="B" name="buyUsed_result" style="display:block;"></td>
</td>
</tr>
</table>


