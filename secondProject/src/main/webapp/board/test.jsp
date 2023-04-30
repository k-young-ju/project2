<%@ include file="/include/header.jsp" %> 
<head>
    <style>
        .header  {
            position:sticky;
            width:100%;
            height:50px;
            top:0;
            background:skyblue;
            text-align:center;
        }
        body {
            margin:0;
            padding:0;
        }
        .content1 {
            background:pink;
/*             padding:60px; */
            height:1000px;
            width:1400px;
        }
        .content2 {
            background:peachpuff;
/*             padding:60px; */
            height:1000px;
            width:1400px;
        }
    </style>
</head>
<body>
    <table class="content1">
    	<tr>
    	<td>
        <table class="header">
            <tr><td>Header1</td></tr>
        </table>
        content1
        </td>
        </tr>
    </table>

    <table class="content2">
    	<tr>
    	<td>
    	
        <table class="header">
        	<tr><td>Header2</td></tr>    
        </table>
        
        content2
        </td>
        </tr>
    </table>
    <table height=1000>
    	<tr><td></td></tr>
    </table>
</body>
</html>