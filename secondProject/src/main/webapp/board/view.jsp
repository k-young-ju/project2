<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header2.jsp" %>  

<style>
	.td2{
		border-bottom:2px solid #D5D5D5;
	}
	.td3{
		border-top:2px solid #D5D5D5;
	}
	table{
		border-spacing:0;
	}
	r{
		font-size:17px;
	}

    .test{
    position: fixed;
    right:100px;
    bottom:100px;
    }
    
    body {
        margin:0;
        padding:0;
    }
    
/*     상품정보,리뷰,교환/환불 만날시 고정 시작*/
    .header {
    position:sticky;
    width:1200;
    height:50px;
    top:0;
    background:white;
    text-align:center;
	}
    .content1 {
    background:white;
    width:1200px;
    }
/*     상품정보,리뷰,교환/환불 만날시 고정 끝 */

/* 스크롤만날떄 색상주기(sticky헤더) */

#first {
/*     background: none repeat scroll 0 0 white ; */
    text-align:center;
    padding-top:20px;
    font-size:22px;
}

#second {
/*     background: none repeat scroll 0 0 white; */
}
a{
	text-decoration: none;
 	color:black;
}

/* 리뷰 별점적용 */


#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
    text-align: center;
}

textarea::placeholder {
  color: #5055B1;
}

#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 23px;
    color: transparent;
    text-shadow: 0 0 0 #5055B1;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
/*     width: 100%; */
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px white;
    border-radius: 15px;
    font-size: 16px;
    resize: none;
}
/* 리뷰 벌점적용 끝 */

/* 중고거래 이미지크기 찜버튼 */
	.button{
	width:250px;
	height:70px;
	color:white;
	font-size: 30px;
	}
	
	.img_style{
		width:200px;
		height:200px;
	}
</style>


<script>

function cart_go(str){
// 	var num = parseInt(Math.random() * 100000);
// 	cart.num.value = num;
	if(str=="c"){
		result = confirm("장바구니로 이동하시겠습니까?");
		if(result == true){
			view.option.value =1;
			order.value = str;
			document.view.submit();
			
		}else{
			view.option.value=2;
			order.value = str;
			document.view.submit();
		}
	}else{
			view.option.value =1;
			order.value = str;
			document.view.submit();
	}
}			


//상품정보 만날시 변환
function checkVisible3( element, check3 = 'above' ) {
    var viewportHeight3 = $(window).height(); // Viewport Height
   	var scrolltop3 = $(window).scrollTop(); // Scroll Top
    var y3 = $(element).offset().top;
    var elementHeight3 = $(element).height();
    
    
//	    // 반드시 요소가 화면에 보여야 할경우
//	    if (check3 == "visible") 
//	      return ((y3 < (viewportHeight2 + scrolltop2)) && (y2 > (scrolltop2 - elementHeight2)));
        
    // 화면에 안보여도 요소가 위에만 있으면 (페이지를 로드할때 스크롤이 밑으로 내려가 요소를 지나쳐 버릴경우)
    if (check3 == "above") 
      return ((y3 < (viewportHeight3 + scrolltop3)));
}

// 리소스가 로드 되면 함수 실행을 멈출지 말지 정하는 변수
let isVisible3 = false;

// 이벤트에 등록할 함수
var func3 = function () {
    if ( !isVisible3 && checkVisible3('#first') ) {
        isVisible3 = true;
        onco.style.color='red';
        seco.style.color='black';
        thco.style.color='black';
    }

    // 만일 리소스가 로드가 되면 더이상 이벤트 스크립트가 있을 필요가 없으니 삭제
    
//     isVisible3 && window.removeEventListener('scroll', func3);
}
window.addEventListener('scroll', func3)
// 스크롤 이벤트 등록



//상품정보 만날시 변환 끝


//리뷰만날시 변환 시작
function checkVisible( element, check = 'above' ) {
    const viewportHeight = $(window).height(); // Viewport Height
    const scrolltop = $(window).scrollTop(); // Scroll Top
    const y = $(element).offset().top;
    const elementHeight = $(element).height();   
    
//     // 반드시 요소가 화면에 보여야 할경우
//     if (check == "visible") 
//       return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
        
    // 화면에 안보여도 요소가 위에만 있으면 (페이지를 로드할때 스크롤이 밑으로 내려가 요소를 지나쳐 버릴경우)
    if (check == "above") 
      return ((y < (viewportHeight + scrolltop)));
}

// 리소스가 로드 되면 함수 실행을 멈출지 말지 정하는 변수
let isVisible = false;

// 이벤트에 등록할 함수
const func = function () {
    if ( !isVisible && checkVisible('#second') ) {
//	        alert("리뷰 보임 !!");

        isVisible = true;
        onco.style.color='black';
        seco.style.color='red';
        thco.style.color='black';
    }

    // 만일 리소스가 로드가 되면 더이상 이벤트 스크립트가 있을 필요가 없으니 삭제
//     isVisible && window.removeEventListener('scroll', func);
}

// 스크롤 이벤트 등록
window.addEventListener('scroll', func)
//리뷰만날시 변환 끝

// 교환만날시 변환
	function checkVisible2( element, check2 = 'above' ) {
	    var viewportHeight2 = $(window).height(); // Viewport Height
	   	var scrolltop2 = $(window).scrollTop(); // Scroll Top
	    var y2 = $(element).offset().top;
	    var elementHeight2 = $(element).height();   
	    
// 	    // 반드시 요소가 화면에 보여야 할경우
// 	    if (check2 == "visible") 
// 	      return ((y2 < (viewportHeight2 + scrolltop2)) && (y2 > (scrolltop2 - elementHeight2)));
	        
	    // 화면에 안보여도 요소가 위에만 있으면 (페이지를 로드할때 스크롤이 밑으로 내려가 요소를 지나쳐 버릴경우)
	    if (check2 == "above") 
	      return ((y2 < (viewportHeight2 + scrolltop2)));
	}
	
	// 리소스가 로드 되면 함수 실행을 멈출지 말지 정하는 변수
	let isVisible2 = false;
	
	// 이벤트에 등록할 함수
	var func2 = function () {
	    if ( !isVisible2 && checkVisible2('#third') ) {
	        isVisible2 = true;
	        onco.style.color='black';
	        seco.style.color='black';
	        thco.style.color='red';
	    }
	
	    // 만일 리소스가 로드가 되면 더이상 이벤트 스크립트가 있을 필요가 없으니 삭제
// 	    isVisible2 && window.removeEventListener('scroll', func2);
	}
	
	// 스크롤 이벤트 등록
	window.addEventListener('scroll', func2)
// 교환만날시 변환 끝


//수량 증가,감소 처리

function qty_num(str){
	var num = parseInt(view.qty.value);
	
	if(str == "-"){ //차감
		if(num == 1){
			alert("주문 최소 수량은 1개입니다.");
		}else{
			view.qty.value = num - 1;
		}		
	}else{ //증가
		view.qty.value = num + 1;
	}
}
	
function jjim_go(){
	var m_id ="${m_id}";
	//alert(m_id);
	var uid = "${mList.uid}";
	var list_option="${list_option}";
	if(m_id != ""){
		location.href="jjim_insert?uid="+uid+"&path=view&list_option="+list_option+"";
	}else{
		var result =confirm(
`회원만 이용가능합니다. 
회원가입 페이지로 이동하시겠습니까?`
		);
		if(result == true){
			location.href="/member/join";
		}
	}
	
	
}	
</script>

<center>


<c:choose>
	<c:when test="${list_option eq 3 }">
		<table height=50/>
		<form name="view" action="" method="post">
		<input type="hidden" name="order" value="d">
		<input type="hidden" name="option" value="3">
		<input type="hidden"  name="uid" value="${mList.uid }">
		<input type="hidden" name="list_option" value="${list_option }">
		<input type="hidden"  name="subject" value="${mList.n_book}">
		<input type="hidden"  name="id" value="${mList.id }">
		<input type="hidden" name= qty value="1">
		<input type="hidden" name="price1" value="${mList.price1 }">
		<input type="hidden" name="image" value="${mList.image }"> 
		
			<table width=1200 border=0>
				<tr>
					<td width=500 valign="top"><img src = "/upload/${mList.image }" style="width:100%;height:530px;padding-bottom: 0px;margin: 0px;border:1px solid black"></td>
					<td width=30></td>
					<td valign=top style="padding-left:50px;">
						<table width=525 valign="top" border=0>
							<tr>
								<td style="font-size:25px;">${mList.n_book }</td>
								<td align=right style="text-align:15px;"><a href="list?list_option=3&pageNum=${pageNum }">목록 이동</a></td>
							</tr>
							<tr height=20></tr>
							<tr>
								<td style="font-size:25px;border-bottom: 1px solid black;" >
								<fmt:formatNumber  value="${mList.price1 }"/>원
								<table height=10></table>
								</td>
								<td style="font-size:30px;border-bottom: 1px solid black;"/>
							</tr>
							<tr height=20></tr>
						</table>
						<table width=100% border=0>
							<tr>
								<td width=25><img src="/img/jjimimg.png"></td><td width=20>${jjimNum }</td>
								<td width=25><img src="/img/ref.png"></td><td width=20>${mList.ref }</td>
								<td width=25><img src="/img/time.png"></td><td width=100>${diffTimeMessage }</td>
								<td width=300></td>
							</tr>
							<tr height=10></tr>
							<tr>
							<td style="font-size: 25px;width:375px;" colspan=7>상품정보</td>
							</tr>
							<tr>	
								<td colspan=7><textarea style="width:525px;height:250px;font-size:16px;border-radius:14px;padding-left:15px;" readonly>${mList.comment}</textarea></td>
							</tr>
						</table>
						<table width=100% border=0>
							<tr>
								<c:choose>
									<c:when test="${jjimcount ==0 }">
										<td id="jjim" class="button" style="vertical-align:middle;border-radius:15px;background-color: #F87B1F;text-align: center" onclick="jjim_go()">
										♥
										<input type="button" name="jjim" value="찜" style="background-color: #F87B1F;border:0px;color:white;font-size: 24px;" >
										${jjimNum }
										</td>
									</c:when>
									<c:otherwise>
										<td class="button" style="background-color:black;text-align:center;vertical-align:middle;border-radius:15px;" onclick="location.href='jjim_insert?uid=${mList.uid}&path=view&list_option=${list_option }'">
										<font color="red">♥</font>
										<input type="button" name="jjim" value="찜" style="background-color: black;border:0px;color:white;font-size: 24px;" >
										${jjimNum }
										</td>
									</c:otherwise>
								</c:choose>
								<td width=20></td>
								<td>
									<button class="button" style="background-color:#5055B1;border:0px;color:white;font-size:24px;border-radius:15px">바로구매</button>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table height=15/>
			<table width=1200>
				<tr>
					<td><img src="/upload/${mList.image2 }" class="img_style"></td><td><img src="/upload/${mList.image3 }" class="img_style"></td><td><img src="/upload/${mList.image4 }" class="img_style"></td><td><img src="/upload/${mList.image5 }" class="img_style"></td>
				</tr>
			</table>
			<table height=40/>
		</form>
	</c:when>
	


<c:otherwise>
<r>
<form name ="view" action="view" method="post" onsubmit="return cart_go(str)">
<input type="hidden" name ="option">
<!-- <input type="text" id="num" name="num"> -->
<input type="hidden" name="uid" value="${mList.uid }"><br>
<input type="hidden"  name="id" value="${mList.id }">
<input type="hidden" name="list_option" value="${list_option }">
<table width=1200 height=800 border=0>
	<tr>
		<td width=330>	
			<table width=330 height=540 border=0>
				<tr height=60></tr>
				<tr height=40 class="td2">
					
					<td width=80 style="text-align:left;vertical-align:top;font-size:17px;" >${mList.n_writer } 저자(글)</td>
				</tr>
				<tr height=50>
					<td style="text-align:left;font-size:17px;">${mList.n_publisher } · ${fn:substring(mList.pudate,0,4) } 년 ${fn:substring(mList.pudate,5,7) } 월 ${fn:substring(mList.pudate,8,10) } 일</td>
				</tr>
				<tr height=20></tr>
				
				<tr height=100>
					<td style="border:1px solid #D5D5D5;text-align:center">
						<table width="100%" border=0>
							<tr>
								<td style="text-align:center;font-weight:bold;color:#5055B1;font-size:18px;">
									<c:if test="${count > 0 }"><fmt:formatNumber value="${sum / count}" pattern="#.#"/> / 5 점</c:if>
									<c:if test="${count == 0 }">리뷰가 없습니다</c:if>
								</td>
							</tr>
							<tr>
								<td style="text-align:center;font-weight:bold;color:#5055B1;font-size:22px;">
									<c:if test="${sum / count == 5.0}">★★★★★</c:if>
									<c:if test="${(sum / count < 5.0 && sum / count >= 4.0) || sum / count == 4.0}">★★★★☆</c:if>
									<c:if test="${(sum / count < 4.0 && sum / count >= 3.0) || sum / count == 3.0}">★★★☆☆</c:if>
									<c:if test="${(sum / count < 3.0 && sum / count >= 2.0) || sum / count == 2.0}">★★☆☆☆</c:if>
									<c:if test="${(sum / count < 2.0 && sum / count >= 1.0) || sum / count == 1.0}">★★☆☆☆</c:if>
									<c:if test="${(sum / count == 0.0)}">☆☆☆☆☆</c:if>
								</td>
							</tr>
							<tr>
								<td style="text-align:center;font-weight:bold;color:#5055B1;font-size:16px;">(${count }개의 리뷰)</td>
							</tr>							
						</table>
					</td>
				</tr>
				<tr height=15>
				<tr>
					<td width=330 height=150 style="text-align:center">
						<textarea cols="15" rows="8" style="width:330px;height:150px;border:1px solid #D5D5D5;" name="comment" readonly><c:out value="${mList.comment}" /></textarea>
					</td>
				</tr>				
				
				
				<tr></tr>
			</table>
		</td>
		
		<td width=20></td>
		
		<td width=350 height=750 style="text-align:center">
			<table border=0 height=700>
				<tr height=50></tr>
				<tr>
					<td style="font-size:30px;font-weight:heavy;color:#5055B1;">${mList.n_book }
						<input type="hidden"  name="subject" value="${mList.n_book}">
					</td>
				</tr>
				<tr height=10></tr>	
				<tr>
					<td style="color:#5055B1;">${mList.n_writer } 저자(글)</td>
				</tr>
				<tr>
					<td><img src="/upload/${mList.image }" width=350 height=500>
						<input type="hidden" name="image" value="${mList.image }">
					</td>
				</tr>
			
			</table>
		
			
		
		</td>
		
		<td width=20></td>
		
		<td width=330 height=540>
			<table width=330 height=540 border=0>
				<tr height=60 ></tr>
				<tr height=20 class="">
					<td width=20></td>
					<td width=80 style="text-align:left" class="">가격</td>
					<td width=210 style="text-align:right"><fmt:formatNumber value="${mList.price1 }"/>원
						<input type="hidden" name="price1" value="${mList.price1 }">
					</td>
					<td width=20></td>
				</tr>
				<tr height=8></tr><tr height=7 class="td2"></tr><tr height=15></tr>
				<tr height=20 class="">
					<td width=20></td>	
					<td width=80 style="text-align:left">적립혜택</td>
					<td width=210 style="text-align:right"><fmt:formatNumber value="${mList.mileage }"/>P
						<input type="hidden"  name="mileage" value="${mList.mileage }">
					</td>
					<td width=20></td>
				</tr>
				<tr height=8></tr><tr height=7 class="td2"></tr><tr height=15></tr>
				<tr height=20 class="">
					<td width=20></td>
					<td width=80 style="text-align:left">재고</td>
					<td width=210 style="text-align:right"><fmt:formatNumber value="${mList.qty }"/></td>
					<td width=20></td>
				</tr>
				<tr height=8></tr><tr height=7 class="td2"></tr><tr height=15></tr>				
				<tr height=20 class="">
					<td width=20></td>
					<td width=80 style="text-align:left">주문 수량</td>
					<td width=210 style="text-align:right">
					
					<input type="button" value="-" onclick="qty_num('-')" style="width:22px;height:22px;">
					<input id="qty" name="qty" value="1" style="width:20px;height:20px;border:1px solid blue;text-align:center">
					<input type="button" value="+" onclick="qty_num('+')" style="width:22px;height:22px;">

					</td>
					<td width=20></td>
				</tr>					
				<tr height=8></tr><tr height=7 class="td2"></tr><tr height=15></tr>
				<tr height=20 class="">
					<td width=20></td>
					<td width=80 style="text-align:left">배송</td>
					<td width=210 style="text-align:right">30,000원 이상 무료 배송</td>
					<td width=20></td>
				</tr>
				<tr height=8></tr><tr height=7 class="td2"></tr><tr height=15></tr>
				<tr height=100>
					<td colspan=4 style="text-align:center;vertical-align:bottom;">
						<table width=330 height=50 style="text-align:center;" border=0>
							<tr height=30>
								<td width=20></td>
								<c:choose>
									<c:when test="${jjimcount ==0 }">
										<td width=110 id="jjim" style="vertical-align:middle;border-radius:15px;background-color: #F87B1F;text-align: center" onclick="jjim_go()">
										<font color="white">♥</font>
										<input type="button" name="jjim" value="찜 ${jjimNum } " style="background-color: #F87B1F;border:0px;color:white;font-size: 17px;" >
										</td>
									</c:when>
									<c:otherwise>
										<td width=110 style="vertical-align:middle;border-radius:15px;background-color: black;text-align: center" onclick="location.href='jjim_insert?uid=${mList.uid}&path=view&list_option=${list_option }'">
										<font color="red">♥</font>
										<input type="button" name="jjim" value="찜 ${jjimNum }" style="background-color: black;border:0px;color:white;font-size: 17px;" >	
										</td>
									</c:otherwise>
								</c:choose>
								<td width=20></td>
								
								
<!-- 								<form name ="cart" action="cart" method="post" onsubmit="return cart_go()"> -->
<%-- 								<input type="hidden"  name="subject" value="${mList.n_book}"> --%>
<%-- 								<input type="hidden" name="image" value="${mList.image }"> --%>
<%-- 								<input type="hidden" name="price1" value="${mList.price1 }"> --%>
<%-- 								<input type="hidden"  name="mileage" value="${mList.mileage }">					 --%>
<!-- 								<input type="hidden" name="qty" value="1"> -->
								
								<td width=110 style="text-align:center;">
<!-- 								<button style="background-color:#767676;color:#FEFEFE;border-radius:15px;" width=100% height=30>장바구니</button> -->
								<input style="width:100%;height:44px;background-color:#767676;color:#FEFEFE;border-radius:15px;border:0px;font-size:16px;" type="button" value="장바구니" onclick="cart_go('c')">
								</td>
<!-- 								</form> -->
								
<!-- 								<form name ="buy" action="buy" method="post"> -->
<!-- 								<input type="hidden" name = "option"> -->
<!-- 								<input type="hidden" id="num" name="num"> -->
<%-- 								<input type="hidden" name="uid" value="${mList.uid }"><br> --%>
<%-- 								<input type="hidden" name="id" value="${mList.id }"> --%>
<%-- 								<input type="hidden" name="subject" value="${mList.n_book}"> --%>
<%-- 								<input type="hidden" name="image" value="${mList.image }"> --%>
<%-- 								<input type="hidden" name="price1" value="${mList.price1 }"> --%>
<%-- 								<input type="hidden" name="mileage" value="${mList.mileage }">					 --%>
<!-- 								<input type="hidden" name="qty" value="1"> -->
								<td width=10></td>
								<td width=110 style="text-align:center;">
<!-- 								<button style="width:100%;height:44px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:18px;">바로구매</button> -->
								<input style="width:100%;height:44px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:16px;" type="button" value="바로구매" onclick="cart_go('d')">
								</td>
								<input type="hidden" id="order" name="order" value="">
								<input type="hidden" id="total" name="total" value="${mList.price1 * view.qty.value }">
								<td width=10></td>
<!-- 								</form> -->
							</tr>
							<tr height=10/>
							<tr>
							<td align=center style="text-align:17px;" colspan=7><a href="list?list_option=${list_option }&pageNum=${pageNum}">목록 이동</a></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr></tr>
			</table>	
		</td>
	</tr>	
</table>
</form>

<!-- 상펌정보 리뷰 교환 시작 -->

<table class="content1">
    	<tr>
	    	<td style="vertical-align:top;">
		        <table width=1200 class="header" style="vertical-align:top;border-bottom: 1px solid #5055B1" border=0>
		            <tr>
<!-- 		            color:#8B7676 -->
						<td width=200 id="AA" style="text-align:left;"><a href="#information" id="onco">상품정보</a></td>
						<td width=200 id="BB" style="text-align:left;"><a href="#review" id="seco">리뷰( ${count } )</a></td>
						<td width=200 id="CC" style="text-align:left;"><a href="#trade" id="thco">교환/반품/품절</a></td>
						<td width=60 style="background-color:white;border-radius:15px;border:1px solid white;" class="test"></td>
					</tr>
		        </table>
				<!-- 상품정보 시작 -->
				<table border=0>
					<tr height=70>
					<tr>
						<td id="information" style="text-align:center;"><img src="/upload/${mList.image2 }" width=800 ></td>
					</tr>
					<tr height=40></tr>
		       		<tr><td style="color:#000000;font-size:22px;">책소개</td></tr>
		       		<tr height=25></tr>
		       		<tr>
			       		<td id="first" style="color:#000000;font-size:15px;font-weight:bold;">
			       		<b><% pageContext.setAttribute("main", "\n"); //개행처리 %>
						${fn:replace(mList.cmt_main, main, "<br>") }</b>
						</td>
					</tr>
		       		<tr height=10></tr>
		       		<tr>
			       		<td style="color:#6D7887;font-size:15px;">
			       		<% pageContext.setAttribute("sub", "\n"); //개행처리 %>
						${fn:replace(mList.cmt_sub, sub, "<br>") }
						</td>
		       		<tr height=40></tr>
		       		
		       		<tr>
		       		<td style="color:#000000;font-size:22px;">작가 정보</td>
		       		</tr>
		       		<tr height=20></tr>
		       		
		       		<tr>
		       			<td>
		       				<table width="850px" style="background-color: #F7F7F7;border:2px solid #D5D5D5;border-radius: 15px;">
		       					<tr height=20></tr>
		       					<tr><td width=20px></td><td width=80px>저자(글)</td><td width=720px style="color:#000;font-size:22px;"> ${mList.n_writer }</td><td width=10px></td></tr>
		       					<tr height=20></tr>
		       					<tr>
		       						<td width=20px></td>
		       						<td style="color:#675959" width=800px colspan=2>
						       			<% pageContext.setAttribute("writer", "\n"); //개행처리 %>
										${fn:replace(mList.cmt_sub, writer, "<br>") }
		       						</td>
		       						<td width=10px></td>
		       					</tr>
		       					<tr height=20></tr>
		       				</table>		       			
		       			</td>
		       		</tr>
		       		<tr height=40></tr>
		       		
		       		<tr><td style="color:#000000;font-size:22px;">목차</td></tr>
		       		<tr height=20></tr>
		       		<tr>
		       			<td style="color:#6D7887;font-size:15px;">
		       			<% pageContext.setAttribute("index", "\n"); //개행처리 %>
						${fn:replace(mList.cmt_index, index, "<br>") }
		       			</td>
		       		</tr>
				</table>
				<!-- 상품정보 끝 -->

		        
				<!-- 리뷰시작 -->
				<form name="myform" id="myform" action="review?#review" method="post">
				<input type="hidden" name="tb_uid" value="${mList.uid }">
				<input type="hidden" name="tb_id" value="${sessionScope.m_id }">
				<input type="hidden" name="tb_name" value="${sessionScope.m_name }">
				<input type="hidden" name="order" value="e">
				<table id="second" border=0>
				
					<tr height=40 id="review"></tr>
					<tr height=10></tr>
						<tr style="vertical-align:top;">
						<td style="color:#000000;font-size:22px;">리뷰 ( ${count } )</td>
						<td width=900></td>
						<td width=100>
						<button style="width:100px;height:40px;background-color:#5055B1;color:#FEFEFE;border-radius:6px;text-align:center;vertical-align:middle;font-size:16px;border:1px solid #5055B1" name="jam">리뷰 작성</button>
<!-- 						<input type="button" value="리뷰작성" onclick="myform_ok()" class=button style="font-size:24px;"> -->
						</td>
											
					</tr>
					<tr height=10></tr>
				</table>
				<table style="background-color: #F7F7F7;border:2px solid #D5D5D5;border-radius: 15px;width:1110px;height:200px;">
					<tr>
						<td width=300 height=200>
							<table width=300 height=200 border=0>
								<tr height=20></tr>
								<tr>
									<td width=50></td><td width=200 style="text-align:center;font-weight:bold;color:black;font-size:18px;">사용자 총점</td><td width=50></td>
								</tr>
								<tr>
									<td></td>
									<td style="text-align:center;font-weight:bold;color:#5055B1;font-size:22px;">
									<c:if test="${sum / count == 5.0}">★★★★★</c:if>
									<c:if test="${(sum / count < 5.0 && sum / count >= 4.0) || sum / count == 4.0}">★★★★☆</c:if>
									<c:if test="${(sum / count < 4.0 && sum / count >= 3.0) || sum / count == 3.0}">★★★☆☆</c:if>
									<c:if test="${(sum / count < 3.0 && sum / count >= 2.0) || sum / count == 2.0}">★★☆☆☆</c:if>
									<c:if test="${(sum / count < 2.0 && sum / count >= 1.0) || sum / count == 1.0}">★★☆☆☆</c:if>
									<c:if test="${(sum / count == 0.0)}">☆☆☆☆☆</c:if>
									</td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td width=200 style="text-align:center;color:#5055B1;">
									<c:if test="${count > 0 }"><fmt:formatNumber value="${sum / count}" pattern="#.#"/> / 5</c:if>
									<c:if test="${count == 0 }">리뷰가 없습니다</c:if>
									</td>						
									<td></td>
								</tr>
								<tr height=20></tr>
								
							</table>
						</td>
						<td width=600>					
						
							<fieldset>
								<table style="width:600;" border=0>
									<tr>
										<td width=10></td>
										<td width=180>
								<input type="radio" name="reviewStar" value="5" id="rate1" checked><label
									for="rate1">★</label>
								<input type="radio" name="reviewStar" value="4" id="rate2"><label
									for="rate2">★</label>
								<input type="radio" name="reviewStar" value="3" id="rate3"><label
									for="rate3">★</label>
								<input type="radio" name="reviewStar" value="2" id="rate4"><label
									for="rate4">★</label>
								<input type="radio" name="reviewStar" value="1" id="rate5"><label
									for="rate5">★</label>
										</td>
										<td width=160 style="text-align:left;color:#5055B1;font-weight:bold;">별점을 선택해주세요</td>
									</tr>
								</table>	
							</fieldset>
							
							<table>
								<tr>
									<td>
										<textarea name="reviewContents" type="text" id="reviewContents" placeholder="리뷰를 남겨주시면  감사합니다" style="width:800px;"></textarea>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					
				</table>
		        <table width=1110 class="" style="vertical-align:top;border-bottom: 1px solid #D5D5D5" border=0>
		        	<tr height=30></tr>
		            <tr>
						<td width=200 style="text-align:left;color:#8B7676">리뷰</td>
						<td width=60 style="background-color:white;border-radius:15px;border:1px solid white;" class="test"><a href="#"><img src="/img/top_move.png" width=50 height=50></a></td>
		
					</tr>
					<tr height=20></tr>
		        </table>
		        <table border=0 width=1110 >
		        <c:set var="number" value="${number }" />
		        <c:forEach var="a" items="${rvList }">
					<tr height=10><td colspan=6></td></tr>
					<tr>
						<td width=100>${a.tb_id }</td>
						<td width=500>${a.tb_review }</td>

						<td width=100 style="color:#F9D107;">
						<c:if test="${a.tb_review_score == 5}">★★★★★</c:if>
						<c:if test="${a.tb_review_score == 4}">★★★★</c:if>
						<c:if test="${a.tb_review_score == 3}">★★★</c:if>
						<c:if test="${a.tb_review_score == 2}">★★</c:if>
						<c:if test="${a.tb_review_score == 1}">★</c:if>
						
						</td>
						<td width=100>${a.tb_date }</td>	
					</tr>
					<tr height=15><td style="border-bottom:1px solid #D5D5D5;" colspan=6></td></tr>
					</c:forEach>
					<c:set var="number" value="${number -1 }"/>
		        
		        </table>
		        <table width=1110 style="text-align:center;">
		        	<tr height=20></tr>
		        	<tr>
		        		<td>
			        		<table border=0 width=1100 style="text-align:center;">
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
								<td width=485 style="text-align:right">
								<c:if test="${startPage > pageBlock }">
									<a href="view?pageNum=${startPage - pageBlock }&uid=${uid}#review">[이전] </a>
								</c:if>
								<c:choose>
									<c:when test="">									
									</c:when>
									<c:otherwise>									
									</c:otherwise>								
								</c:choose>
								</td>
																
								<!-- 페이징 링크 -->
								<td style="text-align:center">
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:choose>
										<c:when test="${pageNum == i }">
											<a href="view?pageNum=${i }&uid=${uid}#review"><span style="padding:0px 4px;"><font color=red><b>${i }</b></font></span></a>
										</c:when>
										<c:otherwise>
											<a href="view?pageNum=${i }&uid=${uid}#review"><span style="padding:0px 4px;">${i }</span></a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</td>			
								<!-- 다음 링크 -->
								
								<td width=485 style="text-align:left">
								<c:if test="${endPage < pageCount }">
									<a href="view?pageNum=${startPage + pageBlock }&uid=${uid}#review">[다음] </a>
								</c:if>
								</td>
							</c:if>
								<tr>
							</table>
		        		
		        		</td>
		        	</tr>
		        </table>
				</form>
		    
				<!-- 리뷰끝 -->     		   
				<!--   교환시작  -->
	       		<table>
	       			<tr height=40 id="trade"></tr>
	       			<tr height=20></tr>
		       		<tr>
		       		<td>교환/반품/품절 안내</td><td></td>
		       		<td>반품/교환 신청</td><td width=20></td>
		       		<td>1:1문의</td>
		       		</tr>
		       		<tr height=20 style="border-bottom:1px solid black"></tr>
		       		<tr height=30></tr>
		       		
		       		<tr><td>반품/교환 방법</td></tr>
		       		<tr height=10></tr>
		       		<tr><td><br>마이룸 > 주문관리 > 주문/배송내역 > 주문조회 > 반품/교환 신청, [1:1 상담 > 반품/교환/환불] 또는 고객센터 (1544-1900)<br>* 오픈마켓, 해외배송 주문, 기프트 주문시 [1:1 상담>반품/교환/환불] 또는 고객센터 (1544-1900)</td></tr>
		       		<tr height=20></tr><tr height=5 class="td2"></tr><tr height=25></tr>
		       		
		       		<tr><td>반품/교환 비용</td></tr>
		       		<tr height=10></tr>
		       		<tr><td><br>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td></tr>
		       		<tr height=20></tr><tr height=5 class="td2"></tr><tr height=25></tr>
		       		
		       		<tr><td>반품/교환가능 기간</td></tr>
		       		<tr height=10></tr>
		       		<tr><td><br>변심반품의 경우 수령 후 7일 이내,<br>상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내</td></tr>
		       		<tr height=20></tr><tr height=5 class="td2"></tr><tr height=25></tr>
		       		
		       		<tr><td>반품/교환 불가 사유</td></tr>
		       		<tr height=20></tr>
		       		<tr>
		       		<td>
		       		1) 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br>
					&nbsp;&nbsp;&nbsp;(단지 확인을 위한 포장 훼손은 제외)<br><br>
					2) 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br>
					&nbsp;&nbsp;&nbsp;예) 화장품, 식품, 가전제품(악세서리 포함) 등<br><br>
					3) 복제가 가능한 상품 등의 포장을 훼손한 경우<br>
					&nbsp;&nbsp;&nbsp;예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집<br><br>
					4) 소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 <br><br>
					5) 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우<br><br>
					6) 시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우<br><br>
					7) 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우<br>
		       		
		       		</td>
		       		<td height=40></td>
		       		<td id="third"></td>
		       		
		       		</tr>
		       		<tr height=20></tr><tr height=5 class="td2"></tr><tr height=25></tr>		       				       				       		
		       		
	       		</table>
	       		<table><tr><td></td></tr></table>
			<!-- 교환끝 -->
			</td>
        </tr>
</table>

<table height=1200><tr><td></td></tr></table>
</r>
</c:otherwise>
</c:choose>
</center>
</body>
</html>