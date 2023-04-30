<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function divisions_click(str){
	//alert(str);
		
	$.ajax({
		url: "/item/item_ch", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "option="+str, //데이터 전달

		success:function(result){ //성공일 경우
// 			alert(result);
			if(result=='new'){
				$("td[name=neww]").show();
				$("td[name=usedd]").hide();
				document.getElementById('diviAA').style.color= 'white';
				document.getElementById('diviAA').style.background='#88C7E0';
				document.getElementById('diviBB').style.color= '#F76300';
				document.getElementById('diviBB').style.background='white';
			}else{
				callFunction4(1,'sellUsed');
				$("td[name=neww]").hide();
				$("td[name=usedd]").show();
				document.getElementById('diviBB').style.color= 'white';
				document.getElementById('diviBB').style.background='#F76300';
				document.getElementById('diviAA').style.color= '#5288C9';
				document.getElementById('diviAA').style.background='white'
			}
			
		}
	
	});
}

function callFunction4(as,str){
// 	alert(str);
	$.ajax({
		url: "/pageMove/pagemove", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "pageNum="+as+"&option="+str, //데이터 전달
		success:function(result){ //성공일 경우
			if(str == "sell"){
				$("div[name=sell_result]").html(result);
			}else if(str == "sellUsed"){
				$("div[name=sellUsed_result]").html(result);
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
			<td align=left style="color:#5288C9;width:65px;height:20px;border:1px solid #88C7E0;border-radius: 10px;cursor:pointer;text-align:center;background-color:#88C7E0;color:white;" onClick="divisions_click('new')" id="diviAA">신품</td>
			<td width=10/>
			<td align=left style="color:#F76300;width:65px;height:20px;border:1px solid #F76300;border-radius: 10px;cursor:pointer;text-align:center;" onClick="divisions_click('used')" id="diviBB">중고</td>
			<td width=230/>
			<td style="text-align:center;color:#5055B1"><h2>판매내역</h2></td>
			<td width=200/>
			<td align=right width=200>
			</td>						
		</tr>
	</table>
	
<table>
<tr>
<td name="neww" id="neww" style="display:block;">
<div width=1200 id="A" name="sell_result" style="display:block;"></td>	
</td>
</tr>
</table>


<table>
<tr>
<td name="usedd" id="usedd" style="display:none;">
<div width=1200 id="B" name="sellUsed_result" style="display:block;"></td>
</td>
</tr>
</table>
