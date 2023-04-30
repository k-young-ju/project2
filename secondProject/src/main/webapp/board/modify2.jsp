<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>    

<style>
table{
	border-collapse: collapse;
	border-spacing : 0;

}

/* 첨부파일디자인변경 */
.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}
/* 첨부파일디자인변경완료*/

/* 첨부파일디자인변경2 */
.filebox2 input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox2 label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox2 .upload-name2 {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}
/* 첨부파일디자인변경완료2*/

	.button{
	width:250px;
	height:70px;
	color:white;
	font-size: 30px;
	}
</style>

<script>



$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	  fileTarget.on('change', function(){  // 값이 변경되면
	    if(window.FileReader){  // modern browser
	      var filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name').val(filename);
	  });
	});

$(document).ready(function(){
	  var fileTarget = $('.filebox2 .upload-hidden');

	  fileTarget.on('change', function(){  // 값이 변경되면
	    if(window.FileReader){  // modern browser
	      var filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name2').val(filename);
	  });
	});

</script>


<center>



<table><tr height=240></tr></table>


<form action="modify" method="post" enctype="multipart/form-data">
<input type="hidden" name="uid" value="${mList.uid }">
<table width=1400 border=1>
	<tr height=350>
	
	
		<td width=250 style="text-align:center"><img src="/upload/${mList.image }" width=250 height=280></td>
		<td width=650>
			<table border=0>
				<tr>
					<td width=20></td><td>출판일</td><td width=20></td>
					<td>
						<input id="pudate1" name="pudate1" value="${fn:substring(mList.pudate,0,4) }">&nbsp;&nbsp;
					
						<select id="pudate2" name = "pudate2">
						<option value="${fn:substring(mList.pudate,6,7) }">${fn:substring(mList.pudate,6,7) }월</option>
						<c:forEach var="i" begin="1" end="12">
							<option value="${i }">${i }월</option>
						</c:forEach>
						</select>					
						&nbsp;&nbsp;
						<input id="pudate3" name="pudate3" value="${fn:substring(mList.pudate,8,10) }">
					</td>		

				</tr>
				
				<tr>
					<td width=20></td><td>도서명</td><td width=20></td>
					<td><input name="n_book" value="${mList.n_book }"></td>
				</tr>
				<tr>
					<td width=20></td><td>작가명</td><td width=20></td>
					<td><input name="n_writer" value="${mList.n_writer }"></td>
				</tr>
				<tr>
					<td width=20></td><td>출판사명</td><td width=20></td>
					<td><input name="n_publisher" value="${mList.n_publisher }"></td>
				</tr>
				<tr>
					<td width=20></td><td>가격</td><td width=20></td>
					<td><input name="price1" value="${mList.price1 }"></td>
				</tr>

				<tr>
					<td width=20></td><td>재고</td><td width=20></td>
					<td><input name="qty" value="${mList.qty }"></td>
				</tr>
				<tr>
					<td width=20></td><td>사용여부</td><td width=20></td>
					<td>
					<input type="radio" id="useyn" name="useyn" value="y" checked>Y
					<input type="radio" id="useyn" name="useyn" value="n">N
					</td>
					
				</tr>
				<tr>
					<td width=20></td><td>대분류</td><td width=20></td>
					<td><input name="kind_big" value="${mList.kind_big }"></td>
				</tr>				
				<tr>
					<td width=20></td><td>중분류</td><td width=20></td>
					<td><input name="kind_middle" value="${mList.kind_middle }"></td>
				</tr>
				<tr>
					<td width=20></td><td>소분류</td><td width=20></td>
					<td><input name="kind_small" value="${mList.kind_small }"></td>
				</tr>								


				
				<tr>
					<td colspan=4>
						<table border=0>
							<tr>
								<td width=15></td>
								<td width=95 height=40>&nbsp;제품img</td>
								
								<td width=400 height=40 class="filebox" style="font-size:15px;">
								<input class="upload-name" value="${mList.image }" disabled="disabled">
								<label for="ex_filename">파일찾기</label>
								<input type="file" id="ex_filename" name="image" class="upload-hidden"> 
								</td>		
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td width=450 border=0>
		상품 설명<br>
		<textarea name="comment" id="comment" style="width:400px;height:180px;">${mList.comment }</textarea>
		
			<table border=0>
				<tr height=35/>
				<tr>
					<td width=65 height=40 style="text-align:left">&nbsp;정보img</td>
					
					<td width=380 height=40 class="filebox2" style="font-size:15px;">
					<input class="upload-name2" value="${mList.image2 }" disabled="disabled">
					<label for="ex_filename2">파일찾기</label>
					<input type="file" id="ex_filename2" name="image2" class="upload-hidden"> 
					</td>		
				</tr>
				<tr height=0/>
			</table>
			
		</td>	
		<td width=100><button style="width:100%;height:44px;background-color:#5055B1;color:#FEFEFE;border-radius:12px;border:0px;font-size:16px;">수정</button>
		
		</td>
	</tr>
</table>

<table width=1400>
	<tr>
		<td style="width:350px;height:20px;">책소개 메인</td>
		<td style="width:350px;height:20px;">책소개 서브</td>
		<td style="width:350px;height:20px;">작가 정보</td>
		<td style="width:350px;height:20px;">목차</td>
	</tr>
	<tr>
		<td style="width:350px;height:200px;"><textarea name="cmt_main" id="cmt_main" style="width:350px;height:200px;">${mList.cmt_main }</textarea></td>
		<td style="width:350px;height:200px;"><textarea name="cmt_main" id="cmt_sub" style="width:350px;height:200px;">${mList.cmt_sub }</textarea></td>
		<td style="width:350px;height:200px;"><textarea name="cmt_main" id="cmt_writer" style="width:350px;height:200px;">${mList.cmt_writer }</textarea></td>
		<td style="width:350px;height:200px;"><textarea name="cmt_main" id="cmt_index" style="width:350px;height:200px;">${mList.cmt_index }</textarea></td>
	
	</tr>
</table>
</form>
</center>
</body>
</html>