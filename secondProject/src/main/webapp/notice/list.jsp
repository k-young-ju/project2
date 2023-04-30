<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp"%>
<style>
	.main_font{
		font-size:30px;
		text-align: left;
	}
	.font_title{
	
	font-weight: bold;
	
	}
	.personel{
	width:200px;
	height:200px;
	background-color: #F7F7F7;
	text-align: center;
	border:1px solid gray;
	}
</style>

<center>
<c:choose>
	<c:when test="${gongji eq '1' }"> <!-- 공지글 -->
		<table height=80 />
		<table width=1200>
			<tr>
				<td style="text-align: left;font-size: 20px;font-weight: bold;">공지사항</td>
				<td align=right style="font-size:20px;font-weight:bold;">
				<c:if test="${sessionScope.m_level eq '10'}"><a href="/admin/notice/write">글쓰기</a></c:if>
				
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td height=50></td>
			</tr>
		</table>
		<table width=1200 border=1>
			<tr>
				<td width=100>NO</td>
				<td width=800>공지 제목</td>
				<td width=100>작성자</td>
				<td width=200>등록일</td>
			</tr>
		</table>
		<c:set var="numbering" value="${1 }"/>
		<c:forEach var="list" items="${v }">
		<table width=1200 height=50 style="border-bottom: 1px solid gray">
			<tr>
				<td width=100>${numbering }</td>
				<td width=800><a href="view?uid=${list.uid }">${list.subject }</a></td>
				<td width=100>${list.name }</td>
				<td width=200>${list.signdate }</td>
			</tr>
		</table>
		<c:set var="numbering" value="${numbering+1 }" />
		</c:forEach>
	</c:when>

	<c:when test="${gongji eq '3' }"> <!-- 자주묻는질문 -->
	<table height=80 />
	<table width=1200>
		<tr>
			<td style="text-align: left;font-size: 35px;">자주 묻는 질문</td>
		</tr>
		<tr>
			<td style="height:25px;"></td>
		</tr>
		<tr>
			<td style="text-align: left;font-size: 25px;">질문 검색</td>
		</tr>
	</table>
<form action="list" method="get">
<input type="hidden" name="gongji" value="${param.gongji }"> 
<table width=1200 height=100 align="center" style="background-color: #F5F5FA;border-radius: 15px;" border=0 >
	<tr>
		<td width=350></td>
		<td width=390 height=50><input name="search" placeholder="질문을 검색해보세요" style="width:95%;height:50px;border-radius: 10px;padding-left: 15px;" value="${search }"></td>
		<td width=10></td>
		<td width=100><button style="width:100%;height:50px;background-color: #5055B1;color: white;border-radius: 10px;font-size: 20px;font-weight: bold;">검색</button></td>
		<td width=350></td>
		
	</tr>
</table>
<table height=20 />
</form>
<table width=1200 height=70>
	<tr>
		<td id="all" width=240 style="border:1px solid black;text-align: center;cursor:pointer;border-radius:15px 0px 0px 15px;<c:if test="${option eq ''}">color:white;background-color: #5055B1</c:if>" onClick="tab_click('all')" >전체</td>
		<td id="member" width=240 style="border:1px solid black;text-align: center;cursor:pointer;<c:if test="${option eq 'member'}">color:white;background-color: #5055B1</c:if>" onClick="tab_click('member')" >회원</td>
		<td id="order" width=240 style="border:1px solid black;text-align: center;cursor:pointer;<c:if test="${option eq 'order'}">color:white;background-color: #5055B1</c:if>" onClick="tab_click('order')">주문/결제</td>
		<td id="delivey" width=240 style="border:1px solid black;text-align: center;cursor:pointer;<c:if test="${option eq 'delivery'}">color:white;background-color: #5055B1</c:if>" onClick="tab_click('delivery')">배송/수령일 안내</td>
		<td id="item" width=240 style="border:1px solid black;text-align: center;cursor:pointer;<c:if test="${option eq 'item'}">color:white;background-color: #5055B1</c:if>" onClick="tab_click('item')">도서/상품정보</td>
		<td id ="used" width=240 style="border:1px solid black;text-align: center;cursor:pointer;border-radius:0px 15px 15px 0px;<c:if test="${option eq 'used'}">color:white;background-color: #5055B1</c:if>" onClick="tab_click('used')">중고거래</td>
		
	</tr>
</table>
<table height=20 />
			<c:set var="i" value="${0 }" />
		<c:forEach var="list" items="${v }">
		<table width=1200 height=80 style="text-align: center;border-bottom: 1px solid black" border=0 >
			<tr>
				<td width=100 align="center"><img src="/img/question_mark.png" style="width:35px;height:35px;"></td>
				<td width=800 style="text-align: left" onclick="drop_down(${i},${list.fid })">[${list.option }]${list.subject }
				</td>
				<td width=200>${list.signdate }</td>
					
			</tr>
		</table>
		<div id="abc" name = "drop" style="display:none;background-color:#F7F7F7 ;width:1200px;text-align:left" >${fn:replace(list.comment, LF, '<br>')}</div>
		<c:set var="i" value="${i +1 }"/>
		</c:forEach>
	</c:when>
	<c:otherwise> <!-- 일반글 -->
		<table height=80></table>
		<table width=1200 height=50>
			<tr>
				<td class="main_font">문의 내역</td>
				<td align=right width=100><a href="main">고객센터</a></td>
				<td align=right width=100><a href="write">글쓰기</a></td>
			</tr>
		</table>
		<p style="height:15px;" />
		<table width=1200 border=1 style="text-align: center">
			<tr>
				<td width=50>번호</td>
				<td width=200>문의유형</td>
				<td width=350>제목</td>
				<td width=200>등록일자</td>
				<td width=200>처리일자</td>
				<td width=100>상태</td>
				<td width=100>Mode</td>
			</tr>
		</table>
		<!-- 반복문 시작 -->
		<c:set var="numbering" value="${1 }" />
		<c:set var="i" value="${0 }"/>
		<c:forEach var="list" items="${v }">
		<table width=1200 style="text-align: center">
			<tr>
				<td width=50>${numbering }</td>
				<td width=200>${list.option }</td>
				<td width=350 onclick="drop_down(${i},${list.fid })">${list.subject }</td>
				<td width=200>${list.signdate }</td>
				<td width=200>${list.re_date }</td>
				<td width=100>${list.status }</td>
				<td>
					<a href="delete?gongji=2&uid=${list.uid }">삭제</a>
				</td>
			</tr>
		</table>
		<div id="abc" name = "drop" style="display:none;background-color:#F7F7F7 ;width:1200px;text-align:left;" >${fn:replace(list.comment, LF, '<br>')}</div>
		<div id="reply" name="reply" style="display:none;background-color:#B9D9E6;width:1200px;text-align:left;" ></div>
		 
		<c:set var="numbering" value="${numbering +1 }"/>
		<c:set var="i" value="${i+1 }"/>
		</c:forEach>
		<c:if test="${count == 0 }">
		<table width=1200 style="text-align: center">
			<tr>
				<td colspan="7">작성하신 문의가 없습니다.</td>
			</tr>
		</table>
		</c:if>
</c:otherwise>
</c:choose>

<table width=800 border=0 align=center>
	<tr>
		<td align=center>
			<c:if test="${count>0 }">
				<c:set var="pageCount" value="${count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
				<!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
				<!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
			
				<!-- 2개의 변수 초기화 -->
				<c:set var="startPage" value="${1 }" />
				<c:set var="pageBlock" value="${3 }" />	
			
				<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분--> 
				<c:if test="${pageNum > pageBlock }">
					<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
					<fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
					<c:set var="startPage" value="${result * pageBlock + 1 }" />
				</c:if>
			
				<!-- endPage 값 설정 부분 -->
				<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
				<c:if test="${endPage > pageCount }">
					<c:set var="endPage" value="${pageCount }" />
				</c:if>
			
				<!-- 이전 링크 -->
				<c:if test="${startPage > pageBlock }">
					<a href="list?pageNum=${startPage - pageBlock }&gongji=${gongji}&option=${option}">[이전] </a>
				</c:if>
			
				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
							<a href="list?pageNum=${i }&search=${search}&gongji=${gongji}&option=${option}"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="list?pageNum=${i }&search=${search}&gongji=${gongji}&option=${option}"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<!-- 다음 링크 -->
				<c:if test="${endPage < pageCount }">
					<a href="list?pageNum=${startPage + pageBlock }&gongji=${gongji}&option=${option}">[다음] </a>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>
</center>
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
	
	$.ajax({
		url: "notice_reply", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "fid="+str, //데이터 전달
		error:function(){ //실패일 경우
			//alert("실패");
		},
		success:function(result){ //성공일 경우
			//alert(result);
			$("div[name=reply]:eq("+num+")").html(result+"\n");
				
		}
	});

}

function tab_click(str){

	if (str=='all'){
		
		location.href="list?gongji=3";
		
			
	}else if(str =='member'){
		
		location.href="list?gongji=3&option=member";
		
	
	}else if(str =='order'){
		
		location.href="list?gongji=3&option=order";
		
	}else if(str =='delivery'){
		
		location.href="list?gongji=3&option=delivery";
		
	}else if(str=='item'){	

		location.href="list?gongji=3&option=item";
		
	}else{
				
		location.href="list?gongji=3&option=used";
		
	}
}
</script>

