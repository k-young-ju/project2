<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
var left = {
	pageSubmitFn : function(menu){
		 if(menu === "home"){
			$("#frm").attr("action", "/"); //form 의 action 값을 /로 변경
			$("#pageName").val("home");
		}else if(menu==="profile"){
			$("#frm").attr("action", "home2"); //form 의 action 값을 home2로 변경
			$("#pageName").val("profile");
		}
		$("#frm").submit();
	}
}


$(function(){
	$(".nav-item").removeClass("active");
	var pageName = "<c:out value='${param.pageName}' />";	
	$("#"+pageName).addClass("active"); 	
	$(".nav-item").click(function(){
		var menu = $(this).attr("id");		
		left.pageSubmitFn(menu);
	})
}) 
</script>
	<title>Home1</title>
</head>
<body>
	<ul class="nav nav-pills">
		<li role="presentation" id="home" class="nav-item active">
			<a href="#">Home</a>
		</li>
		<li role="presentation" id="profile" class="nav-item active">
			<a href="#">Profile</a>
		</li>
	</ul>

	<form id="frm" method="get" action="">
     	<input type="hidden" name="pageName" id="pageName">
    </form>
</body>
</html>