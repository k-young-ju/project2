<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>    

<style>
table{
	border-collapse: collapse;
}
.fix1{
/* 	position: fixed; */
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

<table width=1400 border=0>
	<tr height=50>
		<td width=100></td>
		<td colspan=6 width=770>주문 리스트</td>
	</tr>
	<tr>
		<td width=100></td>
		<td colspan=5 width=700 style="border-top:1px solid black"></td>
		<td width=70 style="text-align:center;border-top:1px solid black"></td>
	</tr>
	<tr height=15><td colspan=7></td></tr>
	<tr height=45>
		<td width=100 style="text-align:center;"></td>
		<td width=100 style="text-align:center;">작가</td>
		<td width=320 style="text-align:center;">도서</td>
		<td width=60 style="text-align:center;">개수</td>
		<td width=110 style="text-align:center;">판매가</td>
		<td width=110 style="text-align:center;">합계</td>
		<td width=70 style="text-align:center;"></td>
	</tr>
	<tr height=15></tr>
<%-- 	<c:set var="i" value="${0 }"/> --%>
<%-- 	<c:forEach var="lists" items="${f }"> --%>
<%-- 	${lists.n_writer } --%>
<%-- 	</c:forEach> --%>
	<c:forEach var="lists" items="${ff }">	
	${lists }
	</c:forEach>
	<c:forEach var="list" items="${v }">	
	
	<tr height=50>
		<td width=100 style="text-align:center;"></td>
		<td width=100 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${list.n_writer }</td>
		<td width=320 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;"><img src="/upload/${list.image }" style="width:25px;height:25px;">${c.subject }</td>
		<td width=60 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${list.qty }</td>
		<td width=110 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${list.price1 }</td>
		<td width=110 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${list.qty * list.price1 }</td>
		<td width=100 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${list.mileage }</td>
		<td width=70></td>		
	</tr>	
	<c:set var="i" value="${i + 1 }"/>
	</c:forEach>
	<c:choose>
		<c:when test="${v != null }">
			
		</c:when>
		<c:otherwise>
			<tr height=50>
			<td width=100 style="text-align:center;"></td>
			<td width=320 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;"><img src="/upload/${c.image }" style="width:25px;height:25px;">${c.subject }</td>
			<td width=60 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${c.qty }</td>
			<td width=110 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${c.price1 }</td>
			<td width=110 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${c.qty * c.price1 }</td>
			<td width=100 style="text-align:center;border-top:2px solid #D5D5D5;border-bottom:2px solid #D5D5D5;">${c.mileage }</td>
			<td width=70 style="text-align:center;"></td>	
			</tr>
		</c:otherwise>	
	</c:choose>
</table>




<table width=1400 border=0>
	<tr height=100>
		<td width=100></td>
		<td width=600>결제 페이지 ${uid } ${uid2 }</td>
		<td width=20></td>
		<td width=250></td>
	</tr>
	<tr>
		<td width=100></td>
		<td width=600>
			<table style="background-color: #F7F7F7;border:2px solid #D5D5D5;border-radius: 15px;" border=0>
				<tr height=20></tr>
				<tr height=20><td width=20></td><td colspan=4>구매자</td></tr>
				<tr height=20></tr>
				<tr height=10 style="border-top:1px solid #5055B1;"></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>이름</td>
					<td width=20></td>
					<td width=300><input style="width:100;height:20px;" placeholder="이름을 작성해주세요"></td>
					<td width=400></td>
				</tr>
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>전화번호</td>
					<td width=20></td>
					<td width=300><input style="width:100;height:20px;" placeholder=""></td>
					<td width=400></td>
				</tr>
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>?</td>
					<td width=20></td>
					<td width=300><input style="width:100;height:20px;" placeholder=""></td>
					<td width=400></td>
				</tr>
				<tr height=20></tr>
				<tr height=40>
					<td width=20></td>
					<td width=100>주소</td>
					<td width=20></td>
					<td width=300>
		 				<input type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호" style="height:30px;width:48%">
           			 	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:30px;;width:48%">						
					</td>
					<td width=400></td>
				</tr>			
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=300>
 						<input type="text" id="sample4_roadAddress" name="zipcode1" placeholder="도로명주소" style="height:30px;;width:48%">					
					</td>
					<td width=400></td>
				</tr>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=300>
			 			<input type="text" id="sample4_jibunAddress" name="zipcode2" placeholder="지번주소" style="height:30px;;width:48%">
						<span id="guide" style="color:#999;display:none"></span>
					</td>
					<td width=400></td>
				</tr>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=300>
					<input type="text" id="sample4_extraAddress" name="zipcode4" placeholder="참고항목" style="height:30px;;width:48%">
					</td>
					<td width=400></td>
				</tr>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=300>
			 			<input type="text" id="sample4_detailAddress" name="zipcode3" placeholder="상세주소" style="height:30px;;width:48%">
					</td>
					<td width=400></td>
				</tr>
				<tr height=20></tr>
			
			</table>		   
		</td>
		<td width=20 rowspan=3></td>
		<td width=250 rowspan=3 border=0 class="fix1">
			<table border=0 style="border:2px solid #D5D5D5" height=150 width=350>
				<tr>
					<td>
						<table border=0 width=350 height=150>
							<tr>
								<td style="width:33.3%;border:2px solid #D5D5D5">주문</td>
								<td style="width:33.3%;border:2px solid #D5D5D5">배송비</td>
								<td style="width:33.3%;border:2px solid #D5D5D5">사용 포인트</td>
							</tr>
							<tr style="border:2px solid #D5D5D5">
								<td style="width:33.3%">적립 포인트</td>
								<td style="width:33.3%"></td>
								<td style="width:33.3%">1%</td>
							</tr>
							<tr style="border:2px solid #D5D5D5">
								<td style="width:33.3%">총계</td>
								<td style="width:33.3%"></td>
								<td style="width:33.3%">10000원</td>
							</tr>			
						</table>
					
					</td>
				</tr>
			</table>
			<table border=0 height=20 width=350>
				<tr>
					<td></td>
				</tr>
			</table>

			<table border:2px solid #D5D5D5 height=50 width=350>
				<tr>
					<td>배송비</td>
					<td></td>
					<td style="text-align:right;">10000원</td>
				</tr>
				<tr height=10></tr>
				<tr>
					<td>보유 포인트</td>
					<td></td>
					<td style="text-align:right;">3151 &nbsp;포인트</td>				
				</tr>
				<tr height=10></tr>
				<tr>
					<td>사용 포인트</td>
					<td></td>
					<td style="text-align:right;"><input style="width:100px;">&nbsp;포인트</td>
				</tr>
				
			</table>			
			<table border=0 height=20 width=350>
				<tr>
					<td></td>
				</tr>
			</table>
			<table border=0 height=50 width=350 style="background-color:#E4DDFA;border:2px solid #D5D5D5">
				<tr>
					<td>총 주문금액</td>
					<td></td>
					<td style="text-align:right;">120000원</td>
				</tr>
			</table>
			<table border=0 height=20 width=350>
				<tr>
					<td></td>
				</tr>
			</table>
			<table border=0 height=50 width=350 style="border:2px solid #D5D5D5">
				<tr>
					<td style="text-align:center;" colspan=3>결제수단</td>
				</tr>
				<tr height=20></tr>
				<tr>
					<td width=10></td>
					<td style="border:1px solid #D5D5D5;text-align:center;" width=150 height=30>무통장입금</td>
					<td></td>
				</tr>
				<tr height=20></tr>
			</table>
			<table border=0 height=20 width=350>
				<tr>
					<td></td>
				</tr>
			</table>
			<table style="" height=50 width=350>
				<tr height=10></tr>
				<tr>
					<td width=175 style="text-align:center;">
					<input style="width:94%;height:40px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:18px;" type="button" value="결제하기">
					</td>
					<td width=175>
					<input style="width:94%;height:40px;background-color:#767676;color:#FEFEFE;border-radius:15px;border:0px;font-size:18px;" type="button" value="취소하기" onClick="location.href='view?uid=${uid2 }'">
					</td>
				</tr>
				<tr height=10></tr>		
			</table>			
						
			<table border=0 height=440 width=350>
				<tr>
					<td>ㄱ</td>
				</tr>
			</table>
			
			 
						
		</td>
	</tr>
	<tr height=20>
		<td width=100></td>
		<td width=600></td>
<!-- 		<td width=20></td> -->
<!-- 		<td width=250></td> -->
	</tr>
	<tr>
		<td width=100></td>
				<td width=600>
			<table style="background-color: #F7F7F7;border:2px solid #D5D5D5;border-radius: 15px;" border=0>
				
				<tr height=20></tr>
				<tr height=20><td width=20></td><td colspan=4>수령인</td></tr>
				<tr height=20></tr>
				<tr height=10 style="border-top:1px solid #5055B1;"></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>이름</td>
					<td width=20></td>
					<td width=400><input style="width:100;height:20px;" placeholder="이름을 작성해주세요"></td>
					<td width=300></td>
				</tr>
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>전화번호</td>
					<td width=20></td>
					<td width=400><input style="width:100;height:20px;" placeholder=""></td>
					<td width=300></td>
				</tr>
				<tr height=20></tr>
				<tr height=20>
					<td width=20></td>
					<td width=100>?</td>
					<td width=20></td>
					<td width=400><input style="width:100;height:20px;" placeholder=""></td>
					<td width=300></td>
				</tr>
				<tr height=20></tr>
				<tr height=40>
					<td width=20></td>
					<td width=100>주소</td>
					<td width=20></td>
					<td width=400>
		 				<input type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호" style="height:30px;width:48%">
           			 	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:30px;;width:48%">						
					</td>
					<td width=300></td>
				</tr>			
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=400>
 						<input type="text" id="sample4_roadAddress" name="zipcode1" placeholder="도로명주소" style="height:30px;;width:48%">					
					</td>
					<td width=300></td>
				</tr>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=400>
			 			<input type="text" id="sample4_jibunAddress" name="zipcode2" placeholder="지번주소" style="height:30px;;width:48%">
						<span id="guide" style="color:#999;display:none"></span>
					</td>
					<td width=300></td>
				</tr>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=400>
					<input type="text" id="sample4_extraAddress" name="zipcode4" placeholder="참고항목" style="height:30px;;width:48%">
					</td>
					<td width=300></td>
				</tr>
				<tr height=40>
					<td width=20></td>
					<td width=100></td>
					<td width=20></td>
					<td width=400>
			 			<input type="text" id="sample4_detailAddress" name="zipcode3" placeholder="상세주소" style="height:30px;;width:48%">
					</td>
					<td width=300></td>
				</tr>
				<tr height=20></tr>
				<tr height=40>
					<td width=20></td>
					<td width=100>요청사항</td>
					<td width=20></td>
					<td width=400>
			 			<textarea style="height:80px;width:400px;"></textarea>
					</td>
					<td width=300></td>
				</tr>
				<tr height=20></tr>				
			
			</table>		   
		</td>
<!-- 		<td width=20></td> -->
<!-- 		<td width=250></td> -->
	</tr>
</table>


<table><tr height=20></tr></table>

</center>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    
    function abcd(){
    	//총 상품금액
    	var nums = ${i}; //상품 갯수
    	var order_total = 0; //총 금액
    	var delivery = 0;
    	var pre_price = 0;
    	var point = 0;
    	for(i=0;i<nums;i++){
    		var one_price = $("input[name=price1]:eq("+i+")").val(); //1개 가격
    		var one_qty = $("input[name=qty]:eq("+i+")").val(); //수량
    		order_total += one_price * one_qty; //총 가격
    		//$("input[name=total_price]:eq("+i+")").val(total_number);
    	}
    	$("#total").val(order_total);
    	
    	if(total.value < 30000){
    		delivery = 3000;
    	}
    	$("#delivery").val(delivery);
    	
    		
    	pre_price = order_total+delivery;

    	
    	$("#pre_price").val(pre_price);
    	
    	point = Math.ceil(order_total*0.01);
    	$("#point").val(point);

//     	콤마처리
    	const input = document.querySelector('#pre_price');
    	input.addEventListener('keyup', function(e) {
    	  let value = e.target.value;
    	  value = Number(value.replaceAll(',', ''));
    	  if(isNaN(value)) {
    	    input.value = 0;
    	  }else {
    	    const formatValue = value.toLocaleString('ko-KR');
    	    input.value = formatValue;
    	  }
    	})
    }
    abcd();    
</script>