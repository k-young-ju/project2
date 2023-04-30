<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>    
<style>
table{
 	
	border-spacing : 0; 

}
.itd{
width:2px;
height:2px;
display:none;
}

</style>
<center>

<table><tr height=240></tr></table>

<!-- 검색어 및 페이징처리 시작 -->
<table width=1400 height=100 border=0>
	<tr>
		<c:if test="${list_option eq 3 }">
		<td width=800 style="height:45px;brder:none;font-size:24px;font-weight:800;color:#5055B1">중고 거래</td>
		</c:if>
		<c:if test="${list_option eq 1 }">
		<td width=800 style="height:45px;brder:none;font-size:24px;font-weight:800;color:#5055B1">베스트 셀러</td>
		</c:if>
		<c:if test="${list_option eq 2 }">
		<td width=800 style="height:45px;brder:none;font-size:24px;font-weight:800;color:#5055B1">신간 도서</td>
		</c:if>
		<td>
			<table border=0 width=300 align=right>
				<tr>			
				<c:if test="${count>0 }">
				<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
				<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
				<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
			
				<!-- 2개의 변수 초기화 -->
				<c:set var="startPage" value="${1 }" />
				<c:set var="pageBlock" value="${4 }" />	
			
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
					<a href="list?pageNum=${startPage - pageBlock }&list_option=${list_option}&code_middle=${code_middle}&code_small=${code_small}">[이전] </a>
				</c:if>
				<c:choose>
					<c:when test="">
					
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				
				</c:choose>
				</td>
				
				
				<!-- 페이징 링크 -->
				<td width=150 style="text-align:center;font-size:25px;">
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
							<a href="list?pageNum=${i }&list_option=${list_option}&code_middle=${code_middle}&code_small=${code_small}"><span style="padding:0px 4px;"><font color=#F69CCF><b>${i }</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="list?pageNum=${i }&list_option=${list_option}&code_middle=${code_middle}&code_small=${code_small}"><span style="padding:0px 4px;">${i }</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</td>			
				<!-- 다음 링크 -->
				
				<td width=75 style="text-align:center">
				<c:if test="${endPage < pageCount }">
					<a href="list?pageNum=${startPage + pageBlock }&&list_option=${list_option}&code_middle=${code_middle}&code_small=${code_small}">[다음] </a>
				</c:if>
				</td>
			</c:if>
				<tr>
			</table>
		</td>
	</tr>
</table>

<!-- 검색어 및 페이징처리 끝 -->
<c:choose>
	<c:when test="${list_option eq 3 }">
		<table width=1400 style="border-bottom:1px solid #5055B1" border=0><tr><td></td></tr></table>
		<table height=20/>
		
		<table width=1400 border=0>
			<c:set var="num" value="${0 }" />
			<c:forEach var="list" items="${list }">
					<c:if test="${list.qty > 0}">
				<c:if test="${num % 4 == 0 }"><tr></c:if>
					<td width = 300 align=center height=250 onclick="location.href='view?uid=${list.uid}&list_option=${list_option }&pageNum=${pageNum }'" >
						<table border=0>
							<tr>
								<td colspan=2><img src="/upload/${list.image }" class="comment_img" style="width:300px;height:270px"></td>
							</tr>
							<tr>
								<td colspan=2 >${fn:substring(list.n_book,0,17) }<br>${fn:substring(list.n_book,18,35) }
								<c:if test="${fn:length(list.n_book) > 35 }">...</c:if>
								</td>
							</tr>
							<tr>
								<td style="font-weight: bold;"><fmt:formatNumber value="${list.price1 }"/>원</td>
								<td style="font-size:15px;text-align:right;">${list.time_message }</td>
							</tr>
							<tr height=20></tr>	
						</table>
					</td>
					<td width=40></td>
			 	<c:if test="${num % 4 == 3 }"></tr></c:if>
			 		</c:if>
				<c:set var="num" value="${num+1 }"/>
			</c:forEach>
		</table>
	</c:when>
	
	<c:otherwise>
		<table width=1400 border=0>
		<tr>

			
			<td>
				<table border=0 width=1000 border=0>
					<tr height=5 >
						<td>
						</td>
					</tr>
				</table>	
					<c:set var="number" value="${number }" />	
					<c:forEach var="a" items="${list }">
				<table style="border-top:1px solid #5055B1;width:1400px;" border=0>	
					<tr>
						<td width=10></td>
						<td width=30 style="color:#5055B1;">${number }</td>
						<td width=20></td>
						<td style="text-align:center">
						<c:choose>
							<c:when test="${a.image != null}">
								<a href="view?uid=${a.uid }&list_option=${list_option }&pageNum=${pageNum}"><img src="/upload/${a.image }" width=140 height=200></a>
								
							</c:when>
							<c:otherwise>
								<a href="view?uid=${a.uid }&list_option=${list_option }&pageNum=${pageNum}"><img src="/img/noimage.png" width=140 height=200></a>
							</c:otherwise>					
						</c:choose>
						</td>
						<td width=20></td>
						<td>
							<table border=0 style="border:0px solid green;" width=600 height=206>
								<tr height=20/>
								<tr><td class=td2 width=600 height=50>&nbsp;&nbsp;<a href="view?uid=${a.uid }&list_option=${list_option }&pageNum=${pageNum}" style="color:black;">${a.n_book }  (${a.n_writer })</a></td></tr>
								<tr><td class=td2 width=600 height=50>&nbsp;&nbsp;${a.n_publisher } · ${fn:substring(a.pudate,0,4) }. ${fn:substring(a.pudate,5,7) }. ${fn:substring(a.pudate,8,10) }일</td></tr>
								<tr><td class=td2 width=600 height=86 style="font-size:15px;">&nbsp;&nbsp;&nbsp;${fn:substring(a.comment,0,24) } <br> &nbsp;&nbsp;&nbsp;${fn:substring(a.comment,25,48) }<c:if test="${fn:length(a.comment) > 50 }">  ...</c:if></td></tr>
							</table>
						</td>
						
						<td width=200>가격 : <fmt:formatNumber  value="${a.price1 }"/> <br><br> <h6>적립 P : <fmt:formatNumber  value="${a.mileage }"/></h6></td>
						<td width=200>
						<c:choose>
						<c:when test="${a.qty > 0}">
						재고 : <fmt:formatNumber  value="${a.qty }"/>
						</c:when>
						<c:otherwise>
						재고 : 품절
						</c:otherwise>
						</c:choose> <br><br> <h6>
						판매량 : <fmt:formatNumber value="${a.sellqty }"/></h6></td>
						
						
						<td width=130 style="text-align:right">
							<table width=130 border=0 height=206>
							<form name ="list" action="list" method="post" onsubmit="return cart_go('c')">
								<tr height=35/>
								<tr height=10>
									<td>
										<input type="hidden" name="list_option" value="${list_option }">
										<input class="itd" type="text" name="uid" value="${a.uid }"><br>
										<input class="itd" type="text"  name="id" value="${a.id }">
										<input class="itd" type="text" name="price1" value="${a.price1 }">
										<input class="itd" type="hidden" name="subject" value="${a.n_book }">
										<input class="itd" type="hidden" name="image" value="${a.image }">
										<input type="hidden" name="mileage" value="${a.mileage }">
										<input type="hidden" name="order" value="c">
										<input class="hidden" type="hidden"  id="option" name ="option">
										
									</td>
									</tr>
								<tr height=50>
								<td style="width:75px;height:30px;background-color:#767676;color:#FEFEFE;border-radius:15px;border:0px;font-size:16px;text-align:center;">
								<button style="width:100%;height:44px;background-color:#767676;color:#FEFEFE;border-radius:15px;border:0px;font-size:16px;">장바구니</button>
								</td>
							</form>
							<form name ="list" action="list" method="post" onsubmit="return cart_go('d')">
											
								<tr height=10/>
								<tr height=50>
									<td style="width:75px;height:30px;background-color:#5055B1;color:#FEFEFE;border-radius:15px;border:0px;font-size:16px;text-align:center;">
									<button style="width:100%;height:44px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:16px;">바로구매</button>
								</td>
								</tr>
								<tr height=10>
									<td>
										<input class="itd" type="hidden" name="uid" value="${a.uid }"><br>
										<input class="itd" type="hidden"  name="id" value="${a.id }">
										<input class="itd" type="hidden" name="price1" value="${a.price1 }">
										<input class="itd" type="hidden" name="subject" value="${a.n_book }">
										<input class="itd" type="hidden" name="image" value="${a.image }">
										<input type="hidden" name="mileage" value="${a.mileage }">
										<input type="hidden" name="order" value="d">
										<input class="itd" type="hidden" id="option" name ="option" ></tr>
									</td>
								<tr height=35/>
							</form>
							</table>					
						</td>
						<td width=50></td>
					</tr>
					<tr height=2 style="border-bottom:1px solid #5055B1;"><td colspan=10></td></tr>
					<c:set var="number" value="${number -1 }"/>
				</table>	
			</c:forEach>			
		
			</td>
			
			
		</tr>
		</table>
	</c:otherwise>
</c:choose>
</center>

</body>
</html>
<script>
function cart_go(str){
// 	var num = parseInt(Math.random() * 100000);
// 	cart.num.value = num;

	if(str=='c'){
		result = confirm("상품이 장바구니에 담겼습니다. \n장바구니로 이동하시겠습니까?");
		if(result == true){
			$("input[name=option]").val(1);
			document.list.submit();
			
		}else{

			$("input[name=option]").val(2);
			document.list.submit();
			 
		}
	}else{
			$("input[name=option]").val(1);
		 	document.view.submit();
	}
}

</script>