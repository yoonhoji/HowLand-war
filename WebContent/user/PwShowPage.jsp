<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 비밀번호를 찾았습니다.</title>
<script>
	function okay(){
		self.close();
	}
</script>
<style>
	#container {
		border: 2px solid #00C6BD;
		border-radius: 500px;
		text-align: center;
		margin: 120px auto 0 auto;
		width: 85%;
	}
	#pw {
		color: #00C6BD;
	}
</style>
</head>
<body>
	<div id="container">
		<h2>당신의 비밀번호는 [ <span id="pw">${pw}</span> ] 입니다.</h2>
	</div>
	<input type="button" value="확인" onclick="okay()"
	style="margin-right:15px; font-size:17px; margin: auto;
	width:140px; height:40px; border:1px solid #00C6BD; border-radius:800px;
	background-color:#00C6BD; color:white; position:relative; top:60px; left:185px;"/>
</body>
</html>