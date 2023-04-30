<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp"%>
<style>
	.main_font{
		font-size:40px;
	}
	.font_title{
	font-size:30px;
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
<table>
	<tr>
		<td height=80></td>
	</tr>
</table>
<table width=1200> 
	<tr>
		<td style="text-align: left" class="main_font" colspan="3">
			무엇을 도와드릴까요?<br><b>책판다 고객센터</b>입니다.
		</td>
	</tr>
	<tr><td height=50></td></tr>
	<tr>
		<td class="font_title">자주 묻는 질문</td><td></td><td style="text-align: right"><a href="list?gongji=3">더보기</a></td>
	</tr>
</table>
<form action="list" method="get">
<input type="hidden" name="gongji" value="3">
<table width=1200 height=100 align="center" style="background-color: #F5F5FA;border-radius: 15px;" border=0 >
	<tr>
		<td width=350></td>
		<td width=390 height=50><input name="search" placeholder="질문을 검색해보세요" style="width:95%;height:50px;border-radius: 10px;padding-left: 15px;"></td>
		<td width=10></td>
		<td width=100><button style="width:100%;height:50px;background-color: #5055B1;color: white;border-radius: 10px;font-size: 20px;font-weight: bold;">검색</button></td>
		<td width=350></td>
		
	</tr>
</table>
</form>
<table height=30/>
<table width=1200 height=100 border=0 style="border:1px solid black;text-align: center;border-radius: 15px;" >
	<tr>
		<td width=240><a href="list?gongji=3&option=member">회원</a>	</td>
		<td width=240><a href="list?gongji=3&option=order">주문/결제</a></td>
		<td width=240><a href="list?gongji=3&option=delivery">배송/수령일 안내</a></td>
		<td width=240><a href="list?gongji=3&option=item">도서/상품정보</a></td>
		<td width=240><a href="list?gongji=3&option=used">중고거래</a>	</td>
		
	</tr>
</table>

<table height=30/>
<table width=1200>
	<tr>
		<td class="font_title">1:1문의</td>
	</tr>
</table>
<table height=30/>
<p style="height:10px;"></p>
<table width=1200>
	<tr>
		<td class="personel" style="border-radius: 15px 0px 0px 15px;">
			<a href="write"><img src ="/img/personel_question.png" style="border-radius: 50%"><br>1:1 문의 접수</a>
		</td>
		<td class="personel" style="border-radius: 0px 15px 15px 0px;">
			<a href="list?gongji=2"><img src ="/img/question_list.png" style="border-radius: 50%"><br>1:1 문의 내역</a>
		</td>
		<td width=15></td>
		<td style="width:400px;height:200px;border:1px solid gray;border-radius: 15px;" >
			<table style="padding-left:20px;">
				<tr>
					<td>전화상담</td>
				</tr>
				<tr>
					<td height=15></td>
				</tr>
				<tr>
					<td>xxxx-xxxx</td>
				</tr>
				<tr>
					<td height=15></td>
				</tr>
				<tr>
					<td>평일 09:00~18:00(주말 및 공휴일 휴무)</td>
				</tr>
			</table>
		</td>
		<td></td>
	</tr>
</table>
<table height=30/>
<table width=1200>
	<tr>
		<td class="font_title">공지사항</td><td></td><td style="text-align: right"><a href="list?gongji=1">더보기</a></td>
	</tr>
</table>
<table width=1200 height=20 style="border-bottom: 1px solid black">
</table>

	<c:set var="numbering" value="${1 }" />
	<c:forEach var="list" items="${v }">
	<table width=1200 height=50 style="border-bottom: 1px solid gray">
		<tr >
			<td width=150  style="text-align: center;">${numbering }</td>
			
			<td width=750 style="padding-left: 20px;">
				<a href="view?uid=${list.uid }">${list.subject }</a>
			</td>
			<td width=100>${list.name }</td>
			<td width=200 style="text-align: center;">${list.signdate }</td>
		</tr>
	</table>	
		<c:set var="numbering" value="${numbering +1 }"/>
	</c:forEach>
<table height=30/>
<table width=1200>
	<tr>
		<td class="font_title">서비스 바로가기</td><td></td><td style="text-align: right"></td>
	</tr>
</table>
<table height=30/>
<table width=1200 border=0>
	<tr>
		<td width=250>
		<a href="/member/modify">
			<table>
				<tr>
					<td><img src="/img/mem_modify.png"></td><td>회원정보 수정</td>
				</tr>
			</table>
		</a>
		</td>
		<td width=300>
		<a href="/member/find">
			<table>
				<tr>
					<td><img src="/img/find_inp.png"></td><td>아이디/비밀번호 찾기</td>
				</tr>
			</table>
			</a>
		</td>
		<td width=200>
		<!-- <a href="map">
			<table>
				<tr>
					<td><img src="/img/gps.png"></td><td>매장안내</td>
				</tr>
			</table>
		</a> -->
		</td>
		<td></td>
		
	</tr>
</table>
<table height=100 />
</center>

<%@ include file ="/include/footer.jsp"%>