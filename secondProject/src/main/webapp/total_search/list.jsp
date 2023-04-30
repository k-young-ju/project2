<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header2.jsp" %>
<style>
	.title_font{
	font-size: 25px;
	font-weight: bold;
	
	}
	.itd{
	width:2px;
	height:2px;
	display:none;
	}
</style>
<center>
<table border=0 width="1800">
	<tr height=20/>
	<tr>
		<td class="title_font">신간 상품 검색 결과</td>
	</tr>
	<tr height=20/>
</table>

<table width=1800 border=0>
		<c:choose>
		<c:when test="${countNewItem ==0 }">
			<tr>
				<td style="text-align: center;height:50px;">검색 결과가 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
		<tr>
			<td>
			
				<c:set var="number" value="${1 }" />	
				<c:forEach var="a" items="${v }">
					<table style="border-top:1px solid #5055B1;" width=1800>	
						<tr>
							<td width=10></td>
							<td width=30 style="color:#5055B1;">${number }</td>
							<td width=20></td>
							<td style="text-align:center">
								<c:choose>
								<c:when test="${a.image != null}">
									<a href="/board/view?uid=${a.uid }&list_option=${list_option }">
										<img src="/upload/${a.image }" width=140 height=200>
									</a>
								
								</c:when>
								<c:otherwise>
									<a href="/board/view?uid=${a.uid }&list_option=${list_option }">
										<img src="/img/noimage.png" width=140 height=200>
									</a>
								</c:otherwise>					
								</c:choose>
							</td>
							<td width=20></td>
							<td>
								<table border=0 style="border:0px solid green;" width=400 height=206>
									<tr height=20/>
									<tr><td class=td2 height=50>&nbsp;&nbsp;<a href="/board/view?uid=${a.uid }" style="color:black;">${a.n_book }  (${a.n_writer })</a></td></tr>
									<tr><td class=td2 height=50>&nbsp;&nbsp;${a.n_publisher } · ${fn:substring(a.pudate,0,4) }년 ${fn:substring(a.pudate,5,7) }월 ${fn:substring(a.pudate,8,10) }일</td></tr>
									<tr><td class=td2 height=86 style="font-size:15px;">&nbsp;&nbsp;&nbsp;${fn:substring(a.comment,0,24) } <br> &nbsp;&nbsp;&nbsp;${fn:substring(a.comment,25,48) }<c:if test="${fn:length(a.comment) > 50 }">  ...</c:if></td></tr>
								</table>
							</td>
							
							<td width=200>가격 : <fmt:formatNumber value="${a.price1 }"/>원 <br><br> <h6>적립 P : ${a.mileage }</h6></td>
							<td width=200><c:if test="${a. qty > 0}">재고 : ${a.qty }</c:if><c:if test="${a.qty <= 0}">재고 : 품절</c:if> <br><br> <h6>판매량 : ${a.sellqty }</h6></td>
							<td width=130 style="text-align:right">
								<table width=130 border=0 height=206>
								<form name ="list" action="/board/list" method="post" onsubmit="return cart_go('c')">
									<tr height=35/>
									<tr height=10>
										<td>
											<input class="itd" type="hidden" name="uid" value="${a.uid }">
											<br>
											<input class="itd" type="hidden"  name="id" value="${a.id }">
											<input class="itd" type="hidden" name="price1" value="${a.price1 }">
											<input class="itd" type="hidden" name="subject" value="${a.n_book }">
											<input class="itd" type="hidden" name="image" value="${a.image }">
											<input type="hidden" name="mileage" value="${a.mileage }">
											<input type="hidden" name="order" value="c">
											<input class="itd" type="hidden" id="option" name ="option">
										</td>
									</tr>
									<tr height=50>
									<td style="width:75px;height:30px;background-color:#767676;color:#FEFEFE;border-radius:15px;border:0px;font-size:16px;text-align:center;">
										<button style="width:100%;height:44px;background-color:#767676;color:#FEFEFE;border-radius:15px;border:0px;font-size:16px;">장바구니</button>
									</td>
								</form>
								<form name ="list" action="/board/list" method="post" onsubmit="return cart_go('d')">
															
									<tr height=10/>
									<tr height=50>
									<td style="width:75px;height:30px;background-color:#5055B1;color:#FEFEFE;border-radius:15px;border:0px;font-size:16px;text-align:center;">
									<button style="width:100%;height:44px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:16px;">바로구매</button>
									</td>
									</tr>
									<tr height=10>
										<input class="itd" type="hidden" name="uid" value="${a.uid }"><br>
										<input class="itd" type="hidden"  name="id" value="${a.id }">
										<input class="itd" type="hidden" name="price1" value="${a.price1 }">
										<input class="itd" type="hidden" name="subject" value="${a.n_book }">
										<input class="itd" type="hidden" name="image" value="${a.image }">
										<input type="hidden" name="mileage" value="${a.mileage }">
										<input type="hidden" name="order" value="d">
										<input class="itd" type="hidden" id="option" name ="option" >
									</tr>
									<tr height=35/>
								</form>
							</table>					
						</td>
						<td width=50>
							<table width=50>
								<tr>
								
								<td width=50></td>
								</tr>
								
							</table>
						</td>
					</tr>
					<tr height=2 style="border-bottom:1px solid #5055B1;"><td></td></tr>
					<c:set var="number" value="${number +1 }"/>
				</table>	
			</c:forEach>			
		
			</td>
			
			<td width=220/>
		</tr>
		</c:otherwise>
		</c:choose>
		</table>
		<table width=800 border=0 align=center>
			<tr>
				<td align=center>
				<c:if test="${countNewItem>0 }">
				<c:set var="pageCountNew" value="${countNewItem / pageSize + (countNewItem % pageSize == 0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCountNew" value="${pageCountNew }" integerOnly="true" />
				<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
				<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
			
				<!-- 2개의 변수 초기화 -->
				<c:set var="startPageNew" value="${1 }" />
				<c:set var="pageBlockNew" value="${3 }" />	
			
				<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분--> 
				<c:if test="${pageNum > pageBlockNew }">
					<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
					<fmt:parseNumber var="resultNew" value="${pageNum / pageBlockNew - (pageNum % pageBlockNew == 0 ? 1:0) }" integerOnly="true"/>
					<c:set var="startPageNew" value="${resultNew * pageBlockNew + 1 }" />
				</c:if>
			
				<!-- endPage 값 설정 부분 -->
				<c:set var="endPageNew" value="${startPageNew + pageBlockNew - 1 }" />
				<c:if test="${endPageNew > pageCountNew }">
					<c:set var="endPageNew" value="${pageCountNew }" />
				</c:if>
			
				<!-- 이전 링크 -->
				<c:if test="${startPageNew > pageBlockNew }">
					<a href="/t_search?pageNum=${startPageNew - pageBlockNew }&pageNum2=${pageNum2 }&pageNum3=${pageNum3 }&pageNum4=${pageNum4 }&t_search=${t_search}">[이전] </a>
				</c:if>
			
				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPageNew }" end="${endPageNew }">
					<c:choose>
						<c:when test="${pageNum == i }">
							<a href="/t_search?pageNum=${i }&pageNum2=${pageNum2 }&pageNum3=${pageNum3 }&pageNum4=${pageNum4 }&t_search=${t_search}"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="/t_search?pageNum=${i }&pageNum2=${pageNum2}&pageNum3=${pageNum3 }&pageNum4=${pageNum4}&t_search=${t_search}"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<!-- 다음 링크 -->
				<c:if test="${endPageNew < pageCountNew }">
					<a href="/t_search?pageNum=${startPageNew + pageBlockNew }&pageNum2=${pageNum2}&pageNum3=${pageNum3 }&pageNum4=${pageNum4}&t_search=${t_search}">[다음] </a>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>
<hr>




<table border=0 width="1800">
	<tr height=20/>
	<tr>
		<td class="title_font">중고 상품 검색 결과</td>
	</tr>
</table>



<table width="1800" border=0>
	<c:choose>	
		<c:when test="${countUsedItem ==0 }">
			<tr>
				<td style="text-align: center;height:50px;">검색 결과가 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:set var="numbering" value="${1 }"/>
			<c:forEach var="list" items="${v2 }">
			<tr>
				<td width=10></td>
				<td width=30 style="color:#5055B1;">${numbering }</td>
				<td width=20></td>
				<td style="text-align:center;" width=280>
					<a href="/board/view?uid=${list.uid }&list_option=3" >
						<img src="/upload/${list.image }" style="width:140px;height:200px;">
					</a>
				</td>
				<td width=40></td>
				<td >
					<table valign="top">
						<tr height=20/>
						<tr>
							<td ><a href="/board/view?uid=${list.uid }&list_option=2" >상품명 : ${list.n_book }</a>
							</td>
						</tr>
						<tr>
							<td>가격: <fmt:formatNumber value="${list.price1 }" />원</td>
						</tr>
					</table>
				</td>
				<td width=200 align="center">
					<form name ="list" action="/board/list" method="post" onsubmit="return cart_go(str)">
						<table>							
							<tr height=10/>
							<tr height=50>
							<td style="width:125px;height:30px;background-color:#5055B1;color:#FEFEFE;border-radius:15px;border:0px;font-size:16px;text-align:center;border:1px solid black">
							<button style="width:100%;height:44px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:16px;">바로구매</button>
							</td>
							</tr>
							<tr height=10>
								<input class="itd" type="hidden" name="uid" value="${list.uid }"><br>
								<input class="itd" type="hidden"  name="id" value="${list.id }">
								<input class="itd" type="hidden" name="price1" value="${list.price1 }">
								<input class="itd" type="hidden" name="subject" value="${list.n_book }">
								<input class="itd" type="hidden" name="image" value="${list.image }">
								<input type="hidden" name="mileage" value="${list.mileage }">
								<input type="hidden" name="order" value="d">
								<input class="itd" type="hidden" name ="option">
							</tr>
							<tr height=35/>
						</table>	
					</form>
				</td>
			</tr>
			<tr height=5 style="border:5px solid #5055B1;"><td></td></tr>
			<c:set var="numbering" value="${numbering +1 }"/>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<!-- 페이징 -->
<table width=800 border=0 align=center>
			<tr>
				<td align=center>
				<c:if test="${countUsedItem>0 }">
				<c:set var="pageCountUsed" value="${countUsedItem / pageSize + (countUsedItem % pageSize == 0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCountUsed" value="${pageCountUsed }" integerOnly="true" />
				<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
				<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
			
				<!-- 2개의 변수 초기화 -->
				<c:set var="startPageUsed" value="${1 }" />
				<c:set var="pageBlockUsed" value="${3 }" />	
			
				<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분--> 
				<c:if test="${pageNum2 > pageBlockUsed }">
					<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
					<fmt:parseNumber var="resultUsed" value="${pageNum2 / pageBlockUsed - (pageNum2 % pageBlockUsed == 0 ? 1:0) }" integerOnly="true"/>
					<c:set var="startPageUsed" value="${resultUsed * pageBlockUsed + 1 }" />
				</c:if>
			
				<!-- endPage 값 설정 부분 -->
				<c:set var="endPageUsed" value="${startPageUsed + pageBlockUsed - 1 }" />
				<c:if test="${endPageUsed > pageCountUsed }">
					<c:set var="endPageUsed" value="${pageCountUsed }" />
				</c:if>
			
				<!-- 이전 링크 -->
				<c:if test="${startPageUsed > pageBlockUsed }">
					<a href="/t_search?pageNum=${pageNum }&pageNum2=${startPageUsed - pageBlockUsed }&pageNum3=${pageNum3 }&pageNum4=${pageNum4 }&t_search=${t_search}&list_option=3">[이전] </a>
				</c:if>
			
				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPageUsed }" end="${endPageUsed }">
					<c:choose>
						<c:when test="${pageNum2 == i }">
							<a href="/t_search?pageNum=${pageNum}&pageNum2=${i }&pageNum3=${pageNum3}&pageNum4=${pageNum4 }&t_search=${t_search}&list_option=3"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="/t_search?pageNum=${pageNum }&pageNum2=${i }&pageNum3=${pageNum3 }&pageNum4=${pageNum4 }&t_search=${t_search}&list_option=3"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<!-- 다음 링크 -->
				<c:if test="${endPageUsed < pageCountUsed }">
					<a href="/t_search?pageNum=${pageNum }&pageNum2=${startPageUsed + pageBlockUsed }&pageNum3=${pageNum3}&pageNum4=${pageNum4}&t_search=${t_search}&list_option=3">[다음] </a>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>
<hr>
<table width="1800">
	<tr height=20/>
	<tr>
		<td class="title_font">공지사항 검색 결과<br></td>
	</tr>
</table>

<c:choose>

	
		<c:when test="${countgongji1Notice ==0 }">
		<table width="1800">	
			<tr>
				<td style="text-align: center;height:50px;">검색 결과가 없습니다.</td>
			</tr>
		</table>		
		</c:when>
		<c:otherwise>
		<table width="1800">	
		<c:forEach var="list" items="${v3 }">
		<tr>
			<td>
				<a href="/notice/view?uid=${list.uid }&gongji=1">
					<c:if test="${list.subject  != null }">
						<c:set var="titles">
							<font color="red">${t_search }</font>
						</c:set>
							<c:out escapeXml="false" value="${fn:replace(list.subject,t_search,titles)}"/>
					</c:if>
				</a>
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${list.comment  != null }">
						<c:set var="titles">
							<font color="red">${t_search }</font>
						</c:set>
							<c:out escapeXml="false" value="${fn:replace(list.comment,t_search,titles)}" />
				</c:if>
			</td>
		</tr>
		</c:forEach>
</table>
<!-- 페이징 -->
<table width=800 border=0 align=center>
			<tr>
				<td align=center>
				<c:if test="${countgongji1Notice>0 }">
				<c:set var="pageCountNoticeg1" value="${countgongji1Notice / pageSize + (countgongji1Notice % pageSize == 0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCountNoticeg1" value="${pageCountNoticeg1 }" integerOnly="true" />
				<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
				<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
			
				<!-- 2개의 변수 초기화 -->
				<c:set var="startPageNoticeg1" value="${1 }" />
				<c:set var="pageBlockNoticeg1" value="${3 }" />	
			
				<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분--> 
				<c:if test="${pageNum3 > pageBlockNoticeg1 }">
					<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
					<fmt:parseNumber var="resultNoticeg1" value="${pageNum3 / pageBlockNoticeg1 - (pageNum3 % pageBlockNoticeg1 == 0 ? 1:0) }" integerOnly="true"/>
					<c:set var="startPageNoticeg1" value="${resultNoticeg1 * pageBlockNoticeg1 + 1 }" />
				</c:if>
			
				<!-- endPage 값 설정 부분 -->
				<c:set var="endPageNoticeg1" value="${startPageNoticeg1 + pageBlockNoticeg1 - 1 }" />
				<c:if test="${endPageNoticeg1 > pageCountNoticeg1 }">
					<c:set var="endPageNoticeg1" value="${pageCountNoticeg1 }" />
				</c:if>
			
				<!-- 이전 링크 -->
				<c:if test="${startPageNoticeg1 > pageBlockNoticeg1 }">
					<a href="/t_search?pageNum=${pageNum }&pageNum2=${pageNum2}&pageNum3=${startPageNoticeg1 - pageBlockNoticeg1 }&pageNum4=${pageNum4 }">[이전] </a>
				</c:if>
			
				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPageNoticeg1 }" end="${endPageNoticeg1 }">
					<c:choose>
						<c:when test="${pageNum3 == i }">
							<a href="/t_search?pageNum=${pageNum }&pageNum2=${pageNum2 }&pageNum3=${i }&pageNum4=${pageNum4 }&t_search=${t_search}"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="/t_search?pageNum=${pageNum }&pageNum2=${pageNum2 }&pageNum3=${i }&pageNum4=${pageNum4 }&t_search=${t_search}"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<!-- 다음 링크 -->
				<c:if test="${endPageNoticeg1 < pageCountNoticeg1 }">
					<a href="/t_search?pageNum=${pageNum }&pageNum2=${pageNum2 }&pageNum3=${startPageNoticeg1 + pageBlockNoticeg1 }&pageNum4=${pageNum4 }">[다음] </a>
				</c:if>
			</c:if>
		</td>
	</tr>
	
	
</table>
	</c:otherwise>
</c:choose>
<hr>
<table width="1800">
	<tr height=20/>
	<tr>
		<td class="title_font">자주 묻는 질문 검색 결과 <br></td>
	</tr>
</table>

<table width="1800">	
	<c:choose>
		<c:when test="${countgongji3Notice ==0 }">
			<tr>
				<td style="text-align: center;height:50px;">찾으시는 검색 내용이 없습니다. </td>
			</tr>		
		</c:when>
		<c:otherwise>
		<table height=20 />
			<c:set var="i" value="${0 }" />
		<c:forEach var="list" items="${v4 }">
		<table width=1800 height=80 style="border-bottom: 1px solid black" border=0 >
			<tr>
				<td width=100 align="center"><img src="/img/question_mark.png" style="width:35px;height:35px;"></td>
				<td width=1700 style="text-align: left" onclick="drop_down(${i},${list.fid })">[${list.option }]${list.subject }
				</td>
			</tr>
		</table>
		<div id="abc" name = "drop" style="display:none;background-color:#F7F7F7 ;width:1800px;text-align:left" >${fn:replace(list.comment, LF, '<br>')}</div>
		<c:set var="i" value="${i +1 }"/>
		</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<!-- 페이징 -->
<table width=800 border=0 align=center>
			<tr>
				<td align=center>
				<c:if test="${countgongji3Notice>0 }">
				<c:set var="pageCountNoticeg3" value="${countgongji3Notice / pageSize + (countgongji3Notice % pageSize == 0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCountNoticeg3" value="${pageCountNoticeg3 }" integerOnly="true" />
				<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
				<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
			
				<!-- 2개의 변수 초기화 -->
				<c:set var="startPageNoticeg3" value="${1 }" />
				<c:set var="pageBlockNoticeg3" value="${3 }" />	
			
				<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분--> 
				<c:if test="${pageNum4 > pageBlockNoticeg3 }">
					<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
					<fmt:parseNumber var="resultNoticeg3" value="${pageNum4 / pageBlockNoticeg3 - (pageNum4 % pageBlockNoticeg3 == 0 ? 1:0) }" integerOnly="true"/>
					<c:set var="startPageNoticeg3" value="${resultNoticeg3 * pageBlockNoticeg3 + 1 }" />
				</c:if>
			
				<!-- endPage 값 설정 부분 -->
				<c:set var="endPageNoticeg3" value="${startPageNoticeg3 + pageBlockNoticeg3 - 1 }" />
				<c:if test="${endPageNoticeg3 > pageCountNoticeg3 }">
					<c:set var="endPageNoticeg3" value="${pageCountNoticeg3 }" />
				</c:if>
			
				<!-- 이전 링크 -->
				<c:if test="${startPageNoticeg3 > pageBlockNoticeg3 }">
					<a href="/t_search?pageNum=${pageNum }&pageNum2=${pageNum2 }&pageNum3=${pageNum3 }&pageNum4=${startPageNoticeg3 - pageBlockNoticeg3 }">[이전] </a>
				</c:if>
			
				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPageNoticeg3 }" end="${endPageNoticeg3 }">
					<c:choose>
						<c:when test="${pageNum4 == i }">
							<a href="/t_search?pageNum=${pageNum }&pageNum2=${pageNum2}&pageNum3=${pageNum3 }&pageNum4=${i }&t_search=${t_search}"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="/t_search?pageNum=${pageNum }&pageNum2=${pageNum2}&pageNum3=${pageNum3 }&pageNum4=${i }&t_search=${t_search}"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<!-- 다음 링크 -->
				<c:if test="${endPageNoticeg3 < pageCountNoticeg3 }">
					<a href="/t_search?pageNum=${pageNum }&pageNum2=${pageNum2 }&pageNum3=${pageNum3 }&pageNum4=${startPageNoticeg3 + pageBlockNoticeg3 }">[다음] </a>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>
<table  height=50/>
</center>
<%@ include file = "/include/footer.jsp" %>
<script>
function drop_down(num,str){
	//alert(num);
	//alert(str);
	if($("div[name=drop]:eq("+num+")").css("display") == "none"){
		$("div[name=drop]:eq("+num+")").show();	
		$("div[name=reply]:eq("+num+")").show();
	
	}else{
		$("div[name=drop]:eq("+num+")").hide();
		$("div[name=reply]:eq("+num+")").hide();
	}

}

function cart_go(str){
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