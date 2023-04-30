<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<style>
#ftsize{
font-size:15px;
}
</style>

<%  
request.setCharacterEncoding("utf-8");
String mid = (String)session.getAttribute("id");
String cip = request.getRemoteAddr();


//7일전 날짜
java.util.Date today7 = new java.util.Date();
java.util.Date day7 = new java.util.Date(today7.getTime() - (long)(1000*60*60*24*7));
SimpleDateFormat bbb = new SimpleDateFormat("yyyyMMdd");
String day_7 = bbb.format(day7); //1일전

//1일전 날짜
java.util.Date today1 = new java.util.Date();
java.util.Date day1 = new java.util.Date(today1.getTime() - (long)(1000*60*60*24*1));
SimpleDateFormat bbb1 = new SimpleDateFormat("yyyyMMdd");
String day_1 = bbb1.format(day1); //1일전

//현재시간
Date today = new Date();
SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
String signdate = sd.format(today);
int date = Integer.parseInt(signdate);

%>
<script>

function accesor(){
	$.ajax({		
		url: "/accesor",
		type: "post",
		dataType: "text",
		error:function(result){
	     alert("실패");
	     },
		success:function(result){
			var arr = result.split(',');
// 			alert(arr[0]);
// 			alert(arr[1]);
// 			alert(arr[2]);
		$("td[name=today]").text(arr[0]);			
		$("td[name=total]").text(arr[1]);
		$("td[name=yesterday]").text(arr[2]);
		}
	});
}
accesor();

</script>


<center>
     <table align=center width=1200 height=100 border=0>
         <tr>
             <td>
                 <table border=0 width= 1200 height=80>
                    <tr>
                        <td colspan=3 width=900 height=30>
                            <table border=0 width=900 height=30>
                                <tr>
                                    <td width="33%"></td>
                                    <td width="55%" style="color: #7E7E7E;font-weight: bold;">사이트 정보</td>
                                    <td width="12%">접속자 집계</td>
                                </tr>
                            </table>
                            
                        </td>
                       
                    </tr>
                    <tr height=20/>
                    <tr>
                        <td height=10>
                            <table width=250 height=10>
                                <tr>
                                    <td width=5></td>
                                    <td id=ftsize ><a href="/notice/write">1:1 문의</a></td>
                                </tr>
                            </table>                            
                        </td>
                        <td height=10>
                            <table width=250 height=10 border=0>
                                <tr>
                                    <td id=ftsize width=45 >주소 :</td>
                                    <td id=ftsize>부산광역시 금정구 금강로 503</td>
                                </tr>
                            </table>                            
                        </td>
                        <td height=10>
                            <table width=250 height=10 border=0>
                                <tr>
                                    <td width=5></td>
                                    <td id=ftsize width=300>어제</td>
                                    <td id=ftsize name="yesterday" style=text-align: right></td>
                                </tr>
                            </table>                            
                        </td>
                    </tr>
                    <tr height=10/>
                    <tr>
                            <td height=10>
                            <table width=250 height=10>
                                <tr>
                                    <td width=5></td>
                                    <td id=ftsize ><a href="/foot/privacy.jsp?">개인정보처리방침</a></td>
                                </tr>
                            </table>                            
                        </td>
                        <td height=10>
                            <table width=250 height=10 border=0>
                                <tr>
                                    <td id=ftsize width=45 >대표 :</td>
                                    <td id=ftsize>책판다</td>
                                </tr>
                            </table>                            
                        </td>
                        <td height=10>
                            <table width=250 height=10 border=0>
                                <tr>
                                    <td width=5></td>
                                    <td id=ftsize width=300>오늘</td>
                                    <td id=ftsize name="today" style="text-align:right;"></td>
                                </tr>
                            </table>                            
                        </td>
                    </tr>
                    <tr height=10/>
                    <tr>
                        <td height=10>
                            <table width=250 height=10>
                                <tr>
                                    <td width=5></td>
                                    <td id=ftsize ><a href="/foot/terms.jsp?">서비스이용약관</a></td>
                                </tr>
                            </table>                            
                        </td>
                        <td height=10>
                            <table width=250 height=10 border=0>
                                <tr>
                                    <td id=ftsize width=45 >운영 :</td>
                                    <td id=ftsize>tjddmsd@naver.com</td>
                                </tr>
                            </table>                            
                        </td>
                        <td height=10>
                            <table width=250 height=10 border=0>
                                <tr>
                                    <td width=5></td>
                                    <td id=ftsize width=300>전체</td>
                                    <td id=ftsize name="total" style=text-align:right></td>
                                </tr>
                            </table>                            
                        </td>
                    </tr>                                                                                                                                                                                                           
                 </table>
                 
             </td>
             
         </tr>
     </table>
     <table align=center width=1200 height=2 border=0 class=tb3>
     <tr width=1200 height=2>
         <td width=1200 height=2></td>
     </tr>
    </table>
    <table align=center width=1200 height=30 border=0>
        <tr>
            <td style="text-align:center;font-size: 12px">Copyright © 책판다 . All rights reserved.</td>
        </tr>
    </table>
</center>
</body>
</html>