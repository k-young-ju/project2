<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>    


<center>




<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset{
    text-align: center;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 23px;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
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
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}


/* 스크롤만날떄처리 */

#first {
    height: 1000;
    background: none repeat scroll 0 0 white ;
    text-align:center;
    padding-top:20px;
    font-size:22px;
}

#second {
/*     padding-top:1200px;     */
/*     height: 600px; */
    background: none repeat scroll 0 0 blue;
    border: 5px solid black;
}

</style>

<script>

function checkVisible( element, check = 'above' ) {
    const viewportHeight = $(window).height(); // Viewport Height
    const scrolltop = $(window).scrollTop(); // Scroll Top
    const y = $(element).offset().top;
    const elementHeight = $(element).height();   
    
    // 반드시 요소가 화면에 보여야 할경우
    if (check == "visible") 
      return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
        
    // 화면에 안보여도 요소가 위에만 있으면 (페이지를 로드할때 스크롤이 밑으로 내려가 요소를 지나쳐 버릴경우)
    if (check == "above") 
      return ((y < (viewportHeight + scrolltop)));
}

// 리소스가 로드 되면 함수 실행을 멈출지 말지 정하는 변수
let isVisible = false;

// 이벤트에 등록할 함수
const func = function () {
    if ( !isVisible && checkVisible('#second') ) {
        alert("엘리먼트 보임 !!");
//         document.getElementById('second').style.color='black';
        isVisible = true;
        second.style.color='green';
    }
    
    // 만일 리소스가 로드가 되면 더이상 이벤트 스크립트가 있을 필요가 없으니 삭제
    isVisible && window.removeEventListener('scroll', func);
}

// 스크롤 이벤트 등록
window.addEventListener('scroll', func)

</script>



<table id="first" height=1500 style="color:black"><tr><td height=1500>
    스크롤 내려서 파랑 영역이 나올때까지 내려보세요</td></tr></table>

<table width=1400 border=1><tr><td style="color:white;" id="second">안녕엉엉</td></tr></table>



 	<form name="myform" id="myform" method="post">
	<fieldset>
		<table style="width:200;" border=1>
			<tr><td width=200 colspan=2>별점을 선택해주세요</td></tr>
			<tr>
				<td width=10></td>
				<td width=180>
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
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
				<td width=10></td>
			</tr>
		</table>	
	</fieldset>
	
	<table>
		<tr>
			<td>
				<textarea type="text" id="reviewContents" placeholder="리뷰를 남겨주시면  감사합니다" style="width:1200px;"></textarea>
			</td>
		</tr>
	</table>
</form>	















</center>


</body>
</html>