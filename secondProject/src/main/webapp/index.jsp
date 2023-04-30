<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>    
  
<style>
/* 슬라이드쇼시작*/

/* Slideshow container */
.slideshow-container {
  max-width: 1850px;
  max-height: 400px;
  position: relative;
  margin: auto;
}
.slideshow-container .mySlides img {
/*    height: 200px;  */
}

.slideshow-container .mySlides {
  height: 400px;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: relative;
  width: auto;
  margin-top: 10px;
  padding: 15px;
  color: black;
  font-weight: bold;
  font-size: 18px;
/*   transition: 0.6s ease; */
/*   transition: all ease 2s 0s; */
  border-radius: 0 3px 3px 0;
  user-select: none;
  
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(F,F,F,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #black;
  font-size: 16px;
  padding: 3px 6px;
/*   position: absolute; */
  font-weight:bold;
/*   top: 0; */
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
  
}

@-webkit-keyframes fade {
  from {opacity: 0.4}
  to {opacity: 1}
  
}

@keyframes fade {
  from {opacity: 0.4}
  to {opacity: 1}
}	
/* 슬라이드쇼끝*/	


/* 슬라이드쇼시작2*/

/* Slideshow container */
.slideshow-container_b {
  max-width: 1850px;
  max-height: 400px;
  position: relative;
  margin: auto;
}
.slideshow-container_b .mySlides_b img {
/*   height: 200px; */
}

.slideshow-container_b .mySlides_b {
  height: 400px;
}

/* Hide the images by default */
.mySlides_b {
  display: none;
}

/* Next & previous buttons */
.prev_b, .next_b {
  cursor: pointer;
  position: relative;
  width: auto;
  margin-top: 10px;
  padding: 15px;
  color: black;
  font-weight: bold;
  font-size: 18px;
/*   transition: 0.6s ease; */
/*   transition: all ease 2s 0s; */
  border-radius: 0 3px 3px 0;
  user-select: none;
  
}

/* Position the "next button" to the right */
.next_b {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev_b:hover, .next_b:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text_b {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext_b {
  color: #black;
  font-size: 16px;
  padding: 3px 6px;
/*   position: absolute; */
  font-weight:bold;
/*   top: 0; */
}

/* The dots/bullets/indicators */
.dot_b {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade_b {
  -webkit-animation-name: fade_b;
  -webkit-animation-duration: 1.5s;
  animation-name: fade_b;
  animation-duration: 1.5s;
  
}

@-webkit-keyframes fade_b {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade_b {
  from {opacity: .4}
  to {opacity: 1}
}	


/* 슬라이드쇼끝2*/	

/* 슬라이드쇼시작3*/

/* Slideshow container */
.slideshow-container_c {
  max-width: 1850px;
  max-height: 400px;
  position: relative;
  margin: auto;
}
.slideshow-container_c .mySlides_c img {
/*    height: 200px;  */
}

.slideshow-container_c .mySlides_c {
  height: 400px;
}

/* Hide the images by default */
.mySlides_c {
  display: none;
}

/* Next & previous buttons */
.prev_c, .next_c {
  cursor: pointer;
  position: relative;
  width: auto;
  margin-top: 10px;
  padding: 15px;
  color: black;
  font-weight: bold;
  font-size: 18px;
/*   transition: 0.6s ease; */
/*   transition: all ease 2s 0s; */
  border-radius: 0 3px 3px 0;
  user-select: none;
  
}

/* Position the "next button" to the right */
.next_c {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev_c:hover, .next_c:hover {
  background-color: rgba(F,F,F,0.8);
}

/* Caption text */
.text_c {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext_c {
  color: #black;
  font-size: 16px;
  padding: 3px 6px;
/*   position: absolute; */
  font-weight:bold;
/*   top: 0; */
}

/* The dots/bullets/indicators */
.dot_c {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active_c, .dot_c:hover {
  background-color: #717171;
}

/* Fading animation */
.fade_c {
  -webkit-animation-name: fade_c;
  -webkit-animation-duration: 1.5s;
  animation-name: fade_c;
  animation-duration: 1.5s;
  
}

@-webkit-keyframes fade_c {
  from {opacity: 0.4}
  to {opacity: 1}
  
}

@keyframes fade_c {
  from {opacity: 0.4}
  to {opacity: 1}
}	


/* 슬라이드쇼끝3*/	

</style>
<script>
// 슬라이드쇼 시작
var slideIndex = 0; //slide index

// HTML 로드가 끝난 후 동작
$(document).ready(function(){
	showSlides_c(slideIndex_c);
});


window.onload=function(){
showSlides_b(slideIndex_b);

var sec = 3000;
setInterval(function(){
 slideIndex++;
 showSlides(slideIndex);

}, sec);
}
// window.addEventListener('load', function() {
// 	  alert(2);
// 	});
 $(window).load( function() {
	 showSlides(slideIndex);
})



// //Auto Move Slide
// var sec_b= 3000;
// setInterval_b(function(){
//  slideIndex_b++;
//  showSlides_b(slideIndex_b);

// }, sec_b);
// }


//Next/previous controls
function moveSlides(n) {
slideIndex = slideIndex + n
showSlides(slideIndex);
}

//Thumbnail image controls
function currentSlide(n) {
slideIndex = n;
showSlides(slideIndex);
}

function showSlides(n) {

var slides = document.getElementsByClassName("mySlides");
var dots = document.getElementsByClassName("dot");
var size = slides.length;

if ((n+1) > size) {
 slideIndex = 0; n = 0;
}else if (n < 0) {
 slideIndex = (size-1);
 n = (size-1);
}

for (i = 0; i < slides.length; i++) {
   slides[i].style.display = "none";
}
for (i = 0; i < dots.length; i++) {
   dots[i].className = dots[i].className.replace(" active", "");
}

slides[n].style.display = "block";
dots[n].className += " active";
}
// 슬라이드쇼 끝



// 주간슬라이드쇼 시작
var slideIndex_b = 0; //slide index


//HTML 로드가 끝난 후 동작
// window.onload=function(){
// showSlides2(slideIndex2);


// // Auto Move Slide
// var sec2= 3000;
// setInterval2(function(){
//  slideIndex2++;
//  showSlides2(slideIndex2);

// }, sec2);
// }


//Next/previous controls
function moveSlides_b(j) {
slideIndex_b = slideIndex_b + j
showSlides_b(slideIndex_b);
}

//Thumbnail image controls
function currentSlide_b(j) {
slideIndex_b = j;
showSlides_b(slideIndex_b);
}

function showSlides_b(j) {

var slides_b = document.getElementsByClassName("mySlides_b");
var dots_b = document.getElementsByClassName("dot_b");
var size_b = slides_b.length;

if ((j+1) > size_b) {
 slideIndex_b = 0; j = 0;
}else if (j < 0) {
 slideIndex_b = (size_b-1);
 j = (size_b-1);
}

for (k = 0; k < slides_b.length; k++) {
   slides_b[k].style.display = "none";
}
for (k = 0; k < dots_b.length; k++) {
   dots_b[k].className = dots_b[k].className.replace(" active", "");
}

slides_b[j].style.display = "block";
dots_b[j].className += " active";
}
// 주간슬라이드쇼 끝



// 주간독서 시작
var slideIndex_c = 0; //slide index


//Next/previous controls
function moveSlides_c(q) {
slideIndex_c = slideIndex_c + q
showSlides_c(slideIndex_c);
}

//Thumbnail image controls
function currentSlide_c(q) {
slideIndex_c = q;
showSlides_c(slideIndex_c);
}

function showSlides_c(q) {

var slides_c = document.getElementsByClassName("mySlides_c");
var dots_c = document.getElementsByClassName("dot_c");
var size_c = slides_c.length;

if ((q+1) > size_c) {
 slideIndex_c = 0; q = 0;
}else if (q < 0) {
 slideIndex_c = (size_c-1);
 q = (size_c-1);
}

for (w = 0; w < slides_c.length; w++) {
   slides_c[w].style.display = "none";
}
for (w = 0; w < dots_c.length; w++) {
   dots_c[w].className = dots_c[w].className.replace(" active", "");
}

slides_c[q].style.display = "block";
dots_c[q].className += " active";
}
// 주간독서 끝
</script>
  
  


<table height=100><tr><td></td></tr></table>

<table border=0>
	<tr height=150></tr>
	<tr height=50>
		<td width=110></td>
		<td style="text-align:left;color:#3E5F40;vertical-align:bottom;">베스트 셀러</td>
	</tr>
</table>
<!-- <table width=100% height=30 style="border-top:2px solid #9A9A9A"><tr><td></td></tr></table> -->



<table width="1800" border=0 class="slideshow-container">
	<tr height=400>
		<td height=350 width=50 style="vertical-align:middle;">
			<a class="prev" onclick="moveSlides(-1)" style="font-size: 30px;">&#10094;</a>
		</td>
		<td height=450 style="border:0px solid #3E5F40">
			<table border=0 class="mySlides fade">
				<tr height=15></tr>
				<tr>
					<td class="numbertext" style="vertical-align: top;">1/3</td>
					<td>
						<table border=0 width=1600>
							<tr>
								<c:forEach var="list" items="${b1 }">
									<td width=20></td>
									<td width=250 height=300 style="font-size:18px;"><a href="/board/view?uid=${list.uid }&list_option=1"><img src="/upload/${list.image }" style="width:250px;height:300px;font-size:15px;"><br>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) >= 15 }"> ${fn:substring(list.n_book,0,15) }...</a></c:if></font>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) < 15 }">${list.n_book }</a></c:if></font>
									<br>작가 : ${list.n_writer }
									<br><fmt:formatNumber value="${list.price1 }"/>원</td>
								</c:forEach>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border=0 class="mySlides fade">
				<tr height=15></tr>
				<tr>
					<td class="numbertext" style="vertical-align: top;">2/3</td>
					<td>
						<table border=0 width=1600>
							<tr>
								<c:forEach var="list" items="${b2 }">
									<td width=20></td>
									<td width=250 height=300><a href="/board/view?uid=${list.uid }&list_option=1"><img src="/upload/${list.image }" style="width:250px;height:300px"><br>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) >= 15 }"> ${fn:substring(list.n_book,0,15) }...</a></c:if></font>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) < 15 }">${list.n_book }</a></c:if></font>
									<br>작가 : ${list.n_writer }
									<br><fmt:formatNumber value="${list.price1 }"/>원</td>
								</c:forEach>
							</tr>
						</table>
											
					</td>
				</tr>
			</table>
			<table border=0 class="mySlides fade">
				<tr height=15></tr>
				<tr>
					<td class="numbertext" style="vertical-align: top;">3/3</td>
					<td>
						<table border=0 width=1600>
							<tr>
								<c:forEach var="list" items="${b3 }">
									<td width=20></td>
									<td width=250 height=300><a href="/board/view?uid=${list.uid }&list_option=1"><img src="/upload/${list.image }" style="width:250px;height:300px"><br>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) >= 15 }"> ${fn:substring(list.n_book,0,15) }...</a></c:if></font>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) < 15 }">${list.n_book }</a></c:if></font>
									<br>작가 : ${list.n_writer }
									<br><fmt:formatNumber value="${list.price1 }"/>원</td>
								</c:forEach>
							</tr>
						</table>
											
					</td>
				</tr>
			</table>			
									
		</td>
		<td height=350 width=50>
		<a class="next" onclick="moveSlides(1)" style="font-size: 30px;">&#10095;</a>
		</td>
	</tr>  	
</table>
<!-- 월간 베스트셀러-->

<table><tr height=50></tr></table>


<table>
	<tr height=50>
		<td width=110></td>
		<td style="text-align:left;">신간 도서</td>
	</tr>
</table>
<!-- <table width=100% height=30 style="border-top:2px solid #374D9A;vertical-align:bottom;"><tr><td></td></tr></table> -->

<!-- 신간도서 -->
<table width=1800 border=0 class="slideshow-container_b">
	<tr height=400>
		<td height=350 width=50><a style="font-size: 30px;" class="prev_b" onclick="moveSlides_b(-1)">&#10094;</a></td>
		<td height=450 style="border:0px solid #3E5F40">
			<table border=0 class="mySlides_b fade_b">
				<tr>
					<td class="numbertext_b" style="vertical-align: top;">1/3</td>
					<td>
						<table border=0 width=1600>
							<tr>
								<c:forEach var="list" items="${n1 }">
									<td width=20></td>
									<td width=250 height=300><a href="/board/view?uid=${list.uid }&list_option=1"><img src="/upload/${list.image }" style="width:250px;height:300px"><br> 
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) >= 15 }"> ${fn:substring(list.n_book,0,15) }...</a></c:if></font>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) < 15 }">${list.n_book }</a></c:if></font>
									<br>작가 : ${list.n_writer }
									<br><fmt:formatNumber value="${list.price1 }"/>원</td>
								</c:forEach>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border=0 class="mySlides_b fade_b">
				<tr height=15></tr>
				<tr>
					<td class="numbertext_b" style="vertical-align: top;">2/3</td>
					<td>
						<table border=0 width=1600>
							<tr>
								<c:forEach var="list" items="${n2 }">
									<td width=20></td>
									<td width=250 height=300><a href="/board/view?uid=${list.uid }&list_option=1"><img src="/upload/${list.image }" style="width:250px;height:300px"><br>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) >= 15 }"> ${fn:substring(list.n_book,0,15) }...</a></c:if></font>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) < 15 }">${list.n_book }</a></c:if></font>
									<br>작가 : ${list.n_writer }
									<br><fmt:formatNumber value="${list.price1 }"/>원</td>
								</c:forEach>
							</tr>
						</table>
											
					</td>
				</tr>
			</table>
			<table border=0 class="mySlides_b fade_b">
				<tr height=15></tr>
				<tr>
					<td class="numbertext_b" style="vertical-align: top;">3/3</td>
					<td>
						<table border=0 width=1600>
							<tr>
								<c:forEach var="list" items="${n3 }">
									<td width=20></td>
									<td width=250 height=300><a href="/board/view?uid=${list.uid }&list_option=1"><img src="/upload/${list.image }" style="width:250px;height:300px"><br> 
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) >= 15 }"> ${fn:substring(list.n_book,0,15) }...</a></c:if></font>
									<font size="4em" color="black"><c:if test="${fn:length(list.n_book) < 15 }">${list.n_book }</a></c:if></font>
									<br>작가 : ${list.n_writer }
									<br><fmt:formatNumber value="${list.price1 }"/>원</td>
								</c:forEach>
							</tr>
						</table>
											
					</td>
				</tr>
			</table>			
									
		</td>
		<td height=350 width=50>
		<a style="font-size: 30px;" class="next_b" onclick="moveSlides_b(1)">&#10095;</a>
		</td>
	</tr>  	
</table>
<!-- 신간 도서 -->


<table><tr height=50></tr></table>

<table>
	<tr height=50>
		<td width=110></td>
		<td style="text-align:left;">중고 거래</td>
	</tr>
</table>
<!-- <table width=100% height=30 style="border-top:2px solid #374D9A;vertical-align:bottom;"><tr><td></td></tr></table> -->

<!-- 주간도서 -->
<table width=1800 border=0 class="slideshow-container_c">
	<tr height=400>
		
		<td height=350 width=50><a style="font-size: 30px;" class="prev_c" onclick="moveSlides_c(-1)">&#10094;</a></td>
		<td height=350 style="border:0px solid #374D9A">
			<table border=0 class="mySlides_c fade_c">
				<tr>
					<td class="numbertext_c" style="vertical-align: top;">1/3</td>
					<td>
						<table border=0>
							<tr>
								<c:forEach var="list" items="${u1 }">
								<td width=20></td>
								<td width=250 height=300><a href="/board/view?uid=${list.uid }&list_option=3"><img src="/upload/${list.image }" style="width:250px;height:300px"><br>
								<font size="4em" color="black"><c:if test="${fn:length(list.n_book) >= 15 }"> ${fn:substring(list.n_book,0,15) }...</a></c:if></font>
								<font size="4em" color="black"><c:if test="${fn:length(list.n_book) < 15 }">${list.n_book }</a></c:if></font>
								<br><fmt:formatNumber value="${list.price1 }"/>원</td>
								</c:forEach>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border=0 class="mySlides_c fade_c">
				<tr>
					<td class="numbertext_c" style="vertical-align: top;">2/3</td>
					<td>
						<table border=0>
							<tr>
								<c:forEach var="list" items="${u2 }">
								<td width=20></td>
								<td width=250 height=300><a href="/board/view?uid=${list.uid }&list_option=3"><img src="/upload/${list.image }" style="width:250px;height:300px"><br>
								<font size="4em" color="black"><c:if test="${fn:length(list.n_book) >= 15 }"> ${fn:substring(list.n_book,0,15) }...</a></c:if></font>
								<font size="4em" color="black"><c:if test="${fn:length(list.n_book) < 15 }">${list.n_book }</a></c:if></font>
								<br><fmt:formatNumber value="${list.price1 }"/>원</td>
								</c:forEach>							
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border=0 class="mySlides_c fade_c">
				<tr>
					<td class="numbertext_c" style="vertical-align: top;">3/3</td>
					<td>
						<table border=0>
							<tr>
								<c:forEach var="list" items="${u3 }">
								<td width=20></td>
								<td width=250 height=300><a href="/board/view?uid=${list.uid }&list_option=3"><img src="/upload/${list.image }" style="width:250px;height:300px"><br>
								<font size="4em" color="black"><c:if test="${fn:length(list.n_book) >= 15 }"> ${fn:substring(list.n_book,0,15) }...</a></c:if></font>
								<font size="4em" color="black"><c:if test="${fn:length(list.n_book) < 15 }">${list.n_book }</a></c:if></font>
								<br><fmt:formatNumber value="${list.price1 }"/>원</td>
								
								
								</c:forEach>
							</tr>
						</table>
					</td>
				</tr>
			</table>					
					
		</td>
		<td height=350 width=50>
		<a style="font-size: 30px;" class="next_c" onclick="moveSlides_c(1)">&#10095;</a>
		</td>
	</tr>  	
</table>
<!-- 주간 도서 -->


<%@ include file="/include/footer.jsp" %>