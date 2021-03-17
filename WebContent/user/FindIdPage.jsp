<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script>
	function getParam(sname) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);	
	    var sval = "";	
	    params = params.split("&");	
	    for (var i = 0; i < params.length; i++) {	
	        temp = params[i].split("=");	
	        if ([temp[0]] == sname) { sval = temp[1]; }	
	    }	
	    return sval;
	}
	
	window.onload = function(){
		var id = getParam("id");
		
		if (id == 'no'){
			var idno = document.getElementById("idno");
			idno.style.display = "block";
		}
	}
</script>
<style>
	#findid {
		width: 500px;
		height: 300px;
	}
	.input {
		border: 1px solid #00C6BD;
		width: 200px;
		height: 36px;
		margin-left:20px;
	}
	#idno {
		font-size: 18px;
		width: 100%;
		text-align: center;
		border: none;
		color: red;
		font-family: "나눔명조";
		display: none;
	}
	#idno:focus {
		outline: none;
	}
</style>
</head>
<body>
	<h1 style="text-align:center;">아이디 찾기</h1>
	<hr style="width:70%;"/>
	<div id="findid">
		<div style="width:80%; height:30px; margin:auto; margin-top:30px;">
			<input type="text" id="idno" value="정보와 일치하는 아이디가 없습니다." readonly/>
		</div>
		
		<form name="form" action="findid.do" method="post">
			<h3 style="display:inline; margin-left:100px;">이름</h3>
			<input type="text" name="name" class="input" style="margin-top:40px;" required/>
			
			<div style="height:10px;"></div>
			
			<h3 style="display:inline; margin-left:62px;">전화번호</h3>
			<input type="text" name="phone" class="input" required/>
			
			<input type="submit" value="찾기"
			style="margin-right:15px; font-size:17px; margin: auto;
			width:140px; height:40px; border:1px solid #00C6BD; border-radius:8px;
			background-color:#00C6BD; color:white; position:absolute; bottom:40px; left:190px;"/>
		</form>
	</div>
</body>
</html>