<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <script>
 function item_ch(str){
		//alert(str);
		
		if(str=='new'){
			$("div[name=new]").show();
			$("div[name=used]").hide();
			document.getElementById('diviC').style.color= 'white';
			document.getElementById('diviC').style.background='#88C7E0';
			document.getElementById('diviD').style.color= '#F76300';
			document.getElementById('diviD').style.background='white';
		}else{
			callFunction(1,'productUsed');
			$("div[name=new]").hide();
			$("div[name=used]").show();
			document.getElementById('diviD').style.color= 'white';
			document.getElementById('diviD').style.background='#F76300';
			document.getElementById('diviC').style.color= '#5288C9';
			document.getElementById('diviC').style.background='white'
		}	
			
		
	}
	function callFunction(as,str){
//	 	alert(str);
		$.ajax({
			url: "/pageMove/pagemove", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "pageNum="+as+"&option="+str, //데이터 전달
			success:function(result){ //성공일 경우
				if(str == "product"){
					$("div[name=product_result]").html(result);
				}else if(str == "productUsed"){
					$("div[name=productUsed_result]").html(result);
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
						<td align=left style="color:#5288C9;width:65px;height:20px;border:1px solid #88C7E0;border-radius: 10px;cursor:pointer;text-align:center;" id="diviC" onclick="item_ch('new')">신품</td>
						<td width=10/>
						<td align=left style="color:#F76300;width:65px;height:20px;border:1px solid #F76300;border-radius: 10px;cursor:pointer;text-align:center;" id="diviD" onclick="item_ch('used')">중고</td>
						<td width=230/>
						<td style="text-align:center;color:#5055B1"><h2>상품목록</h2></td>
						<td width=200/>
						<td align=right>
							<a href="/item/sell">상품등록</a>
						</td>						
					</tr>
				</table>
				<p style="height:25px"></p>
				<div id = "new" name="new">
					<div width=1200 id="A" name="product_result" style="display:block;"></div>	
				</div>
				<div id ="used" name="used" style="display: none;">
					<div width=1200 id=B" name="productUsed_result" style="display:block;"></div>	
				</div>