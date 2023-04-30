<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header.jsp"%>

<style>

table,td,tr{
	margin:0px;
	padding:0px;
	border-collpase:collapse;
}
.menu{
	width:180px;
	height:500px;
	margin: 0 auto;
	position: fixed;
	left: 135px;
	padding: 0;
	text-align: center;
	border:1px solid black;
	cursor: pointer;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 15px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 2px 2px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-gra1 {
    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    color: white;
}

.w-btn-gra-anim {
    background-size: 400% 400%;
    animation: gradient1 5s ease infinite;
}

.td1{
	background-color:#5055B1;
	color:white;
	border:0px;
}
.td2{
	border:1px solid #5055B1;

}

</style>

<script>


function tab_click(str){
	
	if(str=='member'){//내정보 관리 클릭시
		
		document.getElementById('member_info').style.display='inline';
		document.getElementById('product_info').style.display='none';
		document.getElementById('sell_info').style.display='none';
		document.getElementById('buy_info').style.display='none';
		document.getElementById('mileage_info').style.display='none';
		

		document.getElementById('member').style.color='white';
		document.getElementById('member').style.background='#5055B1';
		document.getElementById('product').style.color='#000000';
		document.getElementById('product').style.background='white';
		document.getElementById('sell').style.color='#000000';
		document.getElementById('sell').style.background='white';
		document.getElementById('buy').style.color='#000000';
		document.getElementById('buy').style.background='white';
		document.getElementById('mileage').style.color='#000000';
		document.getElementById('mileage').style.background='white';
		
	}else	if (str=='product'){// 상품관리 클릭시
		callFunction(1,'product');
		document.getElementById('member_info').style.display='none';
		document.getElementById('product_info').style.display='inline';
		document.getElementById('sell_info').style.display='none';
		document.getElementById('buy_info').style.display='none';
		document.getElementById('mileage_info').style.display='none';
		

		document.getElementById('member').style.color='#000000';
		document.getElementById('member').style.background='white';
		document.getElementById('product').style.color='white';
		document.getElementById('product').style.background='#5055B1';
		document.getElementById('sell').style.color='#000000';
		document.getElementById('sell').style.background='white';
		document.getElementById('buy').style.color='#000000';
		document.getElementById('buy').style.background='white';
		document.getElementById('mileage').style.color='#000000';
		document.getElementById('mileage').style.background='white';
		
		
			
	}else if(str=='sell'){
		callFunction4(1,'sell');
		document.getElementById('member_info').style.display='none';
		document.getElementById('product_info').style.display='none';
		document.getElementById('sell_info').style.display='inline';
		document.getElementById('buy_info').style.display='none';
		document.getElementById('mileage_info').style.display='none';
		

		document.getElementById('member').style.color='#000000';
		document.getElementById('member').style.background='white';
		document.getElementById('product').style.color='#000000';
		document.getElementById('product').style.background='white';
		document.getElementById('sell').style.color='white';
		document.getElementById('sell').style.background='#5055B1';
		document.getElementById('buy').style.color='#000000';
		document.getElementById('buy').style.background='white';
		document.getElementById('mileage').style.color='#000000';
		document.getElementById('mileage').style.background='white';
		
		
		
		
	}else if(str == 'buy'){
		callFunction3(1,"buy");
		document.getElementById('member_info').style.display='none';
		document.getElementById('product_info').style.display='none';
		document.getElementById('sell_info').style.display='none';
		document.getElementById('buy_info').style.display='inline';
		document.getElementById('mileage_info').style.display='none';
		

		document.getElementById('member').style.color='#000000';
		document.getElementById('member').style.background='white';
		document.getElementById('product').style.color='#000000';
		document.getElementById('product').style.background='white';
		document.getElementById('sell').style.color='#000000';
		document.getElementById('sell').style.background='white';
		document.getElementById('buy').style.color='white';
		document.getElementById('buy').style.background='#5055B1';
		document.getElementById('mileage').style.color='#000000';
		document.getElementById('mileage').style.background='white';
		
		
		
	}else if(str == 'mileage'){
		callFunction2(1,"order");
		document.getElementById('member_info').style.display='none';
		document.getElementById('product_info').style.display='none';
		document.getElementById('sell_info').style.display='none';
		document.getElementById('buy_info').style.display='none';
		document.getElementById('mileage_info').style.display='inline';
		
		document.getElementById('member').style.color='#000000';
		document.getElementById('member').style.background='white';
		document.getElementById('product').style.color='#000000';
		document.getElementById('product').style.background='white';
		document.getElementById('sell').style.color='#000000';
		document.getElementById('sell').style.background='white';
		document.getElementById('buy').style.color='#000000';
		document.getElementById('buy').style.background='white';
		document.getElementById('mileage').style.color='white';
		document.getElementById('mileage').style.background='#5055B1';
	}else{
		document.getElementById('member_info').style.display='none';
		document.getElementById('product_info').style.display='none';
		document.getElementById('sell_info').style.display='none';
		document.getElementById('buy_info').style.display='none';
		document.getElementById('mileage_info').style.display='none';
		

		document.getElementById('member').style.color='#000000';
		document.getElementById('member').style.background='white';
		document.getElementById('product').style.color='#000000';
		document.getElementById('product').style.background='white';
		document.getElementById('sell').style.color='#000000';
		document.getElementById('sell').style.background='white';
		document.getElementById('buy').style.color='#000000';
		document.getElementById('buy').style.background='white';
		document.getElementById('mileage').style.color='#000000';
		document.getElementById('mileage').style.background='white';	
	}
}

	
</script>

<table>
	<tr>
		<td height=300></td>
	</tr>
</table>
<table class="menu" border=0>
	<tr>
		<td id="member" onclick="tab_click('member')" style="color:white;background-color: #5055B1">
			<span >내정보관리</span>
		</td>
	</tr>
	<tr>
		<td id="product" onclick="tab_click('product')">
			<span >상품관리</span>
		</td>
	</tr>
	<tr>
		<td id="sell" onclick="tab_click('sell')" >
			<span >판매내역</span>
		</td>
	</tr>
	<tr>
		<td id="buy" onclick="tab_click('buy')">
			<!-- 구매내역 안에 배송현황 -->
			<span >구매내역</span>
		</td>
	</tr>
	<tr>
		<td id="mileage" onclick="tab_click('mileage')">
			<span >주문내역</span>
		</td>
	</tr>

</table>
<center>
<table width=1400 border=0>
	<tr>
		<td width=150></td>
		<td style="vertical-align: top">
		
				<table width="1200" id="member_info" border=0>
				
					<tr>
						<td width=1200>
							<table width=1200>
								<tr>
									<td width=300/>
									<td width=112 style="text-align:center;"><a href="modify">회원수정</a></td>	
									<td width=50/>
									<td width=112 style="text-align:center;"><a onclick="delete_id()" style="cursor: pointer">회원탈퇴</a></td>
									<td width=50/>
									<td width=112 style="text-align:center;"><a href="/cart/list">장바구니</a></td>
									<td width=50/>			
									<td width=112 style="text-align:center;"><a href="/cart/jjim">찜 목록</a></td>
									<td width=300/>
									
								</tr>
								<tr height=15/>
								<tr>
									<td width=300/>
									<td style="text-align:center;"><a href="modify"><img src ="/img/update_member.png" style="width:100px;height:70px;"></a></td>
									<td width=50/>			
									<td style="text-align:center;"><a onclick="delete_id()" style="cursor: pointer"><img src ="/img/out_member.png" style="width:100px;height:70px;"></a></td>
									<td width=50/>		
									<td style="text-align:center;"><a href="/cart/list"><img src ="/img/cartLogo.png" style="width:100px;height:70px;"></a></td>
									<td width=50/>				
									<td style="text-align:center;"><a href="/cart/jjim"><img src ="/img/jjimLogo.png" style="width:100px;height:70px;"></a></td>
									<td width=300/>
								</tr>
							</table>
							<table height=80/>
							<table width=1200 border=0>
								<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;아이디</td>
									<td class="td2">&nbsp;&nbsp;${sessionScope.m_id }</td>
									<td width=300></td>
								</tr>
								<tr height=10/>
								<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;이름</td>
									<td class="td2">&nbsp;&nbsp;${sessionScope.m_name }</td>
									<td width=300></td>
								</tr>
								<tr height=10/>
								<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;생년원일</td>
									<td class="td2">&nbsp;&nbsp;${m.birth1 }년 ${m.birth2 }월 ${m.birth3 }일</td>
									<td width=300></td>
								</tr>	
								<tr height=10/>								
								<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;성별</td>
									
									<c:if test="${m.gender eq 'M' }"><td class="td2">&nbsp;&nbsp;남자</td></c:if>
									<c:if test="${m.gender eq 'F' }"><td class="td2">&nbsp;&nbsp;여자</td></c:if>
									<td width=300></td>
								</tr>	
								<tr height=10/>							
								<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;회원등급</td>
									<td class="td2">&nbsp;&nbsp;${sessionScope.m_level }</td>
									<td width=300></td>
								</tr>
								<tr height=10/>
								<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;이메일</td>
									<td class="td2">&nbsp;&nbsp;${m.email1 } @ ${m.email2 }</td>
									<td width=300></td>
								</tr>
								<tr height=10/>
								<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;번호</td>
									<td class="td2">&nbsp;&nbsp;${m.phone1 } - ${m.phone2 } - ${m.phone3 }</td>
									<td width=300></td>
								</tr>
								<tr height=10/>	
								<tr>																																			<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;주소</td>
									<td class="td2">&nbsp;&nbsp;${m.zipcode1 } ${m.zipcode3 } ${m.zipcode4 }</td>
									<td width=300></td>
								</tr>
								<tr height=10/>
								<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;마일리지</td>
									<td class="td2">&nbsp;&nbsp;${m.mileage }</td>
									<td width=300></td>
								</tr>
								<tr height=10/>
								<tr>
									<td width=300></td>
									<td class="td1">&nbsp;&nbsp;판매수익</td>
									<td class="td2">&nbsp;&nbsp;${m.income }</td>
									<td width=300></td>
								</tr>
								<tr height=10/>									
							</table>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td></td>
					</tr>
				</table>
			<div id="product_info" style="display:none;">
				
			<%@ include file="/member/my_page_product.jsp"%>
			
			</div>
				<table width="1200" id="sell_info" style="display:none;" border=0>
					<tr>
					<td width="1200" border=0>						
						<%@ include file="/member/my_page_sell.jsp"%>
					</td>
					</tr>
					
				</table>
				
				<table width="1200" id="buy_info" style="display:none;" border=0>
					<tr>
					<td width="1200" border=0>
						<%@ include file = "/member/my_page_buy.jsp"%>
					</td>
					</tr>			
				</table>
				<table width="1200" id="mileage_info" style="display:none;" border=0>
					<tr>
					<td>
						<%@ include file = "/member/my_page_order.jsp"%>
					</td>
					</tr>				
				</table>

			
		</td>
	</tr>
</table>
</center>
<script>
function delete_id(){
	
	result = confirm("탈퇴하시면 같은 아이디로 재가입이 불가합니다 \n정말 삭제하시겠습니까?");
	if(result == true){
		location.href="/member/delete";
	}
}

//서블릿 갔다가 왔을때 : 아이디찾기, 비밀번호 찾기 탭위치
var tab_choose = "${option}";
//alert(tab_choose);
if(tab_choose == "product"){
	//alert(2);
	tab_click('product');
}else if(tab_choose == "mileage"){
	tab_click('mileage');
}

var tab_choose2 = "${option2}";

if(tab_choose2 == "used"){
	item_ch('used');
	divisionss_click('used');
}else{
	item_ch('new');
	divisionss_click('new');
}

page_num();
function page_num(){
	var pageNum = "${pageNum}";
	var pageName = "${pageName}";
	if(pageName == "product" || pageName == "productUsed"){
	callFunction(pageNum,pageName);	
	}else if(pageName == "order" || pageName == "orderUsed"){
	callFunction2(pageNum,pageName);	
	}
}
</script>
<%-- <%@ include file = "/include/footer.jsp"%> --%>