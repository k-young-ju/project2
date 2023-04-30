<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header.jsp"%>

<style>

.fix1{
/* 	position: fixed; */
}
#tdback{
	background-color:#5055B1;
}
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


<center>
<table width=1110 border=0><tr height=240></tr></table>

<table>
	<tr>
		<td>
		
		
		
		</td>
	</tr>

</table>


<form name="orderView" id="orderView" action="list" method="post">

<table width=1400 border=0>
	<tr>
		<td width=100></td>
		<td colspan=6 width=500 style="color:#8D0837;font-weight:bold;font-size:23px;">주문 번호 : &nbsp;&nbsp;${od_id }</td>
		<td width=70 style="text-align:center;"></td>
	</tr>
	<tr height=40/>
	<tr height=50>
		<td width=100></td>
		<td colspan=6 width=800 style="color:#8D0837;font-weight:bold;font-size:23px;">주문 내역</td>
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
		<td width=100 style="text-align:center;" id="tdcolor">작가</td>
		<td width=100 style="text-align:center;" id="tdcolor">도서</td>
		<td width=220 style="text-align:center;" id="tdcolor">도서명</td>
		<td width=60 style="text-align:center;" id="tdcolor">개수</td>
		<td width=110 style="text-align:center;" id="tdcolor">판매가</td>
		<td width=110 style="text-align:center;" id="tdcolor">합계</td>
		<td width=70 style="text-align:center;" id="tdcolor"></td>
	</tr>
	<tr height=15><td/><td style="border-bottom:2px solid #5055B1;" colspan=7/></tr>
	<c:set var="i" value="${0 }"/>
	<c:forEach var="list" items="${v }">	
	<tr height=10/>		
	<tr height=80>
		<td width=100 style="text-align:center;"></td>
		<td width=100 style="text-align:center;border-bottom:1px solid #5055B1;">${list.n_writer }</td>
		<td width=100 style="text-align:center;border-bottom:1px solid #5055B1;"><img src="/upload/${list.image }" style="width:80px;height:80px;"></td>
		<td width=220 style="text-align:center;border-bottom:1px solid #5055B1;">&nbsp;&nbsp;${list.subject }</td>
		<td width=60 style="text-align:center;border-bottom:1px solid #5055B1;"><fmt:formatNumber  value="${list.qty }"/></td>
		<td width=110 style="text-align:center;border-bottom:1px solid #5055B1;"><fmt:formatNumber  value="${list.price1 }"/></td>
		<td width=110 style="text-align:center;border-bottom:1px solid #5055B1;"><fmt:formatNumber  value="${list.qty * list.price1 }"/>원</td>
		<td width=100 style="text-align:center;border-bottom:1px solid #5055B1;"></td>
	
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
	<tr height=70>
	
		<td width=100></td>
		<td width=600 style="vertical-align:bottom;color:#8D0837;font-weight:bold;font-size:23px;">주문 정보</td>
		<td width=20></td>
		<td width=250></td>
	</tr>
	<tr>
		<td width=100></td>
		<td width=600 rowspan=3 style="vertical-align:top;">
			<table height=30/>
			<table style="background-color: white;border:2px solid #8D0837;border-radius: 15px;vertical-align:top;" border=0>
				<tr height=20/>

				<tr height=20><td width=20></td><td colspan=4>구매자</td></tr>
				<tr height=15/>
				<tr height=5 style="border-top:1px solid #8D0837;"></tr>
				<tr height=20/>
				<tr height=20>
					<td width=20></td>
					<td width=100>이름</td>
					<td width=20></td>
					<td width=500>${o.od_name }</td>
					<td width=200></td>
				</tr>
			
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>전화번호</td>
					<td width=20></td>
					<td width=500>
						<c:set var="hi" value="-" />
						${o.od_phone }		
					</td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>주소</td>
					<td width=20></td>
					<td width=500>
		 				${o.od_addr1 } ${o.od_addr4 } ${o.od_addr3 }			
					</td>
					<td width=200></td>
				</tr>			
				<tr height=20></tr>
			
			</table>
			<table height=50></table>
<!-- 			수령인부분	    -->
			<table style="background-color: white;border:2px solid #8D0837;border-radius: 15px;" border=0>
				
				<tr height=20></tr>
				<tr height=20><td width=20></td><td colspan=4>수령인</td></tr>
				<tr height=15/>
				<tr height=5 style="border-top:1px solid #8D0837;"></tr>
				<tr height=20/>
				<tr height=20>
					<td width=20></td>
					<td width=100>이름</td>
					<td width=20></td>
					<td width=500>${o.od_b_name }	</td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>전화번호</td>
					<td width=20></td>
					<td width=500>
					<c:set var="hi" value="-" />
						${o.od_b_phone }
					</td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>

				<tr height=20>
					<td width=20></td>
					<td width=100>주소</td>
					<td width=20></td>
					<td width=500>
		 				${o.od_b_addr1 } ${o.od_b_addr4 } ${o.od_b_addr3 }				
					</td>
					<td width=200></td>
				</tr>			
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>요청사항</td>
					<td width=20></td>
					<td width=500>
<!-- 			 			<textarea name="require1" style="height:80px;width:400px;"></textarea> -->
						${o.require1 }
					</td>
					<td width=200></td>
				</tr>
				<tr height=20></tr>				
			
			</table>	
		</td>
		<td width=20 rowspan=3></td>
		<td width=250 rowspan=3 border=0 class="fix1">
					
			<table border=0 height=150 width=350 style="vertical-align:top;">
				<tr height=28/>
				<tr>
					<td style="vertical-align:top;">
						<table border=0 width=350 style="border:2px solid #8D0837;vertical-align:top;" height=150>
						
							<tr height=80>
							<c:choose>
							<c:when test="${m_id eq null }">
								<td style="width:350px;border:2px solid #8D0837;text-align:center;" colspan=3>주문금액<br><fmt:formatNumber  value="${totals_before }"/></td>
							</c:when>
							<c:otherwise>
								<td style="width:175px;border:2px solid #8D0837;text-align:center;" colspan=2>주문금액<br><fmt:formatNumber  value="${totals_before }"/></td>
								<td style="width:175px;border:2px solid #8D0837;text-align:center;">사용한 포인트<br><fmt:formatNumber  value="${point1 }"/>P</td>
							</c:otherwise>
							</c:choose>
							
								
							</tr>
							<tr height=15/>

							<tr>
								<td >&nbsp;&nbsp;주문</td>
								<td ></td>
								<td style="text-align:right;"><fmt:formatNumber  value="${totals_before }"/>원&nbsp;&nbsp;</td>
							</tr>		
							<tr height=15/>
							<tr>
								<td>&nbsp;&nbsp;배송비</td>
								<td></td>
								<td style="text-align:right;">
								<c:if test="${totals_before <= 29999 && totals >=1 }"><fmt:formatNumber  value="${3000 }"/>원 &nbsp;&nbsp;</c:if>		
								<c:if test="${totals_before >= 30000}">무료&nbsp;&nbsp;</c:if>
								
								
								
								<input id ="total" name="total" type="hidden" value="<fmt:formatNumber  value="${totals_before }"/>원">
							
								</td>
							</tr>
							<tr height=15/>
							<c:choose>
								<c:when test="${m_id eq null }">
								
								</c:when>
								<c:otherwise>
									<tr>
										<td>&nbsp;&nbsp;적립 포인트</td>
										<td></td>
										<td style="text-align:right;">&nbsp;
											<fmt:formatNumber  value="${totals_before / 100}"/>
										P&nbsp;&nbsp;
										</td>
									</tr>
								<tr height=20/>
								</c:otherwise>
							</c:choose>
								
						</table>
					
					</td>
				</tr>
			</table>
						
			
			<table border=0 height=50 width=350 style="border:2px solid #8D0837">
				<tr>
					<td width=140>&nbsp;&nbsp;총 주문금액</td>
					<td width=10></td>
					<td width=200 style="text-align:right;">		
					<fmt:formatNumber value="${totals }"/> 원&nbsp;&nbsp;
					<input type ="hidden" name="od_price" value="${totals }">
					</td>
				</tr>
			</table>

			
			<table style="" height=50 width=350>
				<tr height=10></tr>
				<tr>
					<td width=175 style="text-align:center;">
					<input style="width:94%;height:40px;background-color:#767676;color:#FEFEFE;border-radius:15px;border:0px;font-size:18px;" type="button" value="취소하기" onClick="order_cancel()">
					</td>
					<td width=175>
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
<!-- 		<td width=600></td> -->
<!-- 		<td width=20></td> -->
<!-- 		<td width=250></td> -->
	</tr>
	<tr>
		<td width=100></td>
<!-- 				<td width=600> -->
	   
<!-- 		</td> -->
<!-- 		<td width=20></td> -->
<!-- 		<td width=250></td> -->
	</tr>
</table>


<table><tr height=20></tr></table>
</form>
</center>
<script>
function order_cancel(){
	var od_id = "${od_id }";
	//alert(od_id);
	var result=confirm("주문을 취소하시겠습니까?");
	if(result==true){
		location.href="/order/cancel?od_id="+od_id+"&order_option=a";
		
	}
}
</script>