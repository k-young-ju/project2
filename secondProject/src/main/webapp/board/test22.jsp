<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
        #test_btn1{
            border-radius: 5px;
            margin-right:-4px;
             color:white;
        }
        #test_btn2{
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;    
            margin-left:-3px;
        }
        #btn_group button{
            border: 1px solid #5055B1;
            background-color: rgba(0,0,0,0);
            color: #5055B1;
            padding: 5px;
        }
        #btn_group button:hover{
            color:white;
            background-color: #5055B1;
        }

</style>

</head>
<body>
<table>
	<tr>
		<td id="btn_group"><button id="test_btn1">테스트1</button></td>
	</tr>
</table>
    <div id="btn_group">
        <button id="test_btn1">테스트1</button>
        <button id="test_btn2">테스트2</button>
    </div>
</body>
</html>

