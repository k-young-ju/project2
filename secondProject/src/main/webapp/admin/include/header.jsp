<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<link rel="stylesheet" href="/css/basic.css">
<body>

<style>

.custom-choice {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

.btn-choice {
  background: rgb(6,14,131);
  background: linear-gradient(0deg, rgba(6,14,131,1) 0%, rgba(12,25,180,1) 100%);
  border: none;
}
.btn-choice:hover {
   background: rgb(0,3,255);
background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
}

.custom-cate {
  width: 130px;
  height: 30px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

.btn-cate {
  background: #663dff;
  border: none;
  z-index: 1;
}
.btn-cate:after {
  position: absolute;
  content: "";
  width: 0;
  height: 100%;
  top: 0;
  right: 0;
  z-index: -1;
  background-color: #b621fe;
  border-radius: 5px;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  transition: all 0.3s ease;
}
.btn-cate:hover {
  color: #fff;
}
.btn-cate:hover:after {
  left: 0;
  width: 100%;
}
.btn-cate:active {
  top: 2px;
}


	a{
		text-decoration: none;
		text-align:center;
		color:balck;
		
	}	
	body{
		font-family: 'BookkMyungjo-Bd';
		font-size:18px;
	}
	.td{
	  border: 1px solid #C1A2CC; 
	  background-color: #C1A2CC; 
	  border-radius: 16px;
	  box-shadow: inset 0 0 8px #B464EB;
	  width: 25px; height: 40px;
	  text-align:center;
	}	
</style>

<script>
	
	function no_admin(){
// 		alert("asdf");
		$.ajax({		
			url: "/admin/noamin",
			type: "post",
			dataType: "script",
			success:function(result){	
				if(result != 10){
					alert("올바른 경로가 아닙니다.");
					location.href = "/";
				}
			}
		});
	}
	no_admin();


	function move(str){
		   if(str=='category'){
		      location.href="/admin/category/list";
		   }else if(str=='member'){
		      location.href="/admin/member/list";
		   }else if(str=='item'){
		      location.href="/admin/item/list";
		   }else if(str=='order'){
		      location.href="/admin/order/list";
		   }else if(str=='gongji1'){
		      location.href="/admin/notice/list?gongji=1";
		   }else if(str=='gongji3'){
		      location.href="/admin/notice/list?gongji=3";
		   }else if(str=='reply'){
		      location.href="/admin/reply/list";
		   }else{
		      location.href="/admin/account/list";
		   }
		}   
</script>

<center>
<table width =1500 border=0>

	<tr>
		<td>
			<a href="/"><img src="/img/Logo5.png" style="width:555px;height:100px"></a><br>
<%-- 			session_id : ${sessionScope.m_id }<br> --%>
<%-- 			session_name : ${sessionScope.m_name }<br> --%>
<%-- 			session_level : ${sessionScope.m_level } --%>
		</td>
		<c:choose>
			<c:when test="${sessionScope.m_id != null && sessionScope.m_id != '' }">
				<c:if test="${sessionScope.m_level eq 10 }">
					<td width=130 style="text-align:center;"><a href="/admin">[관리자페이지]</a></td>
				</c:if>
				
				<td width=130 style="text-align:center;"><a href="/member/my_page">[마이페이지]</a></td>
				<td width=130 style="text-align:center;"><a href="/member/logout">[로그아웃]</a></td>
			</c:when>
			<c:otherwise>
				<td width=150 style="text-align:center;"><a href="/">[메인페이지]</a></td>
			</c:otherwise>
		</c:choose>
	</tr>
</table>
<table width=1500 border=0>
   <tr>
      <td width=300></td>
      <td class="custom-cate btn-cate" style="width:150px;font-size:20px;text-align:center;color:white;" onclick="move('category')">카테고리 관리</td>
      <td width=5 />
      <td class="custom-cate btn-cate" style="width:150px;font-size:20px;text-align:center;color:white;" onclick="move('member')">회원 관리</td>
      <td width=5 />
      <td class="custom-cate btn-cate" style="width:150px;font-size:20px;text-align:center;color:white;" onclick="move('item')">상품 관리</td>
      <td width=5 />
      <td class="custom-cate btn-cate" style="width:150px;font-size:20px;text-align:center;color:white;" onclick="move('order')">주문 관리</td>
      <td width=300></td>
   </tr>   
   <tr height=10/>
</table>

<table width=1500>
   <tr>
      <td width=300></td>
      <td class="custom-cate btn-cate" style="width:150px;font-size:20px;text-align:center;color:white;" onclick="move('gongji1')">공지사항 관리</td>
      <td width=5 />
      <td class="custom-cate btn-cate" style="width:150px;font-size:17px;text-align:center;color:white;" onclick="move('gongji3')">자주묻는질문 관리</td>
      <td width=5 />
      <td class="custom-cate btn-cate" style="width:150px;font-size:20px;text-align:center;color:white;" onclick="move('reply')">고객 문의 답변</td>
      <td width=5 />
      <td class="custom-cate btn-cate" style="width:150px;font-size:20px;text-align:center;color:white;" onclick="move('account')">손익계산서</td>   
      <td width=300></td>
   </tr>
</table>

</center>
