<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp" %>
<style>
.title{
font-size: 20px;
width:500px;
}
	.math{
	text-align: right;
	font-size:20px;
	}
</style>
<center>
<table width=1000 border=0>
	<tr>
		<td style="text-align:center;color:#B464EB;vertical-align:bottom;"><h2>손익계산서</h2></td>
	</tr>
</table>
<form action="list" method="post">
<table	width=1000 border=0>
	<tr>
		<td width=150>
			<select id="yearAccount" name = "yearAccount" style="height:25px;width:150px" >
				<option value="${year }">${year }년</option>
				<c:set var="j" value="${year-1 }"/>
				<c:forEach var="i" begin="1" end="5">
					<option value="${j }">${j }년</option>
					<c:set var="j" value="${j-1 }"/>
				</c:forEach>
			</select>
		</td>
		<td>
		<select id="monthAccount" name="monthAccount" style="height:25px;width:150px">
			<option value="${month }">${month }월</option>
			<c:forEach var="i" begin="1" end="12">
				<option value="${i }">${i }월</option>
			</c:forEach>
		</select>
		</td>
		<td width=150 style="text-align:right;"><button  style="cursor:pointer;font-size:17px;margin:auto;" class="custom-choice btn-choice">조회</button></td>
	</tr>
</table>
</form>
<table height=30/>
<table width=1000 border=0 style="border-bottom: 1px solid black" >	
	<tr>
		<td class="title">매출액</td>
		<td class="math">
			<fmt:formatNumber value="${totalSales }" pattern="#,###"/>원
		</td>
	</tr>
</table>
<table width=1000 style="border-bottom: 1px solid black">	
	<tr>
		<td class="title">총지출</td>
		<td class="math">
			<fmt:formatNumber value="${totalSaless }" pattern="#,###"/>원
		</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;판매자 정산금</td>
		<td class="math">
			<fmt:formatNumber value="${totalIncome }" pattern="#,###"/>원
		</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;배송비</td>
		<td class="math">
			<fmt:formatNumber value="${deliveryFee }" pattern="#,###"/>원
		</td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>&nbsp;&nbsp;구매자 포인트 지급</td> -->
<!-- 		<td class="math"> -->
<%-- 			<fmt:formatNumber value="${totalMileage }" pattern="#,###"/>원 --%>
<!-- 		</td> -->
<!-- 	</tr> -->
	<tr>
		<td>&nbsp;&nbsp;구매자 포인트 사용</td>
		<td class="math">
			<fmt:formatNumber value="${usePoint}" pattern="#,###"/>원
		</td>
	</tr>
</table>

<table width=1000 border=0>
	<tr>
		<td class="title">순수익</td>
		<td class="math">
			<fmt:formatNumber value="${pureSales }" pattern="#,###"/>원
		</td>
	</tr>
</table>
</center>
<script>

</script>