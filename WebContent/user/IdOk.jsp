<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용 가능한 아이디</title>
<script>
	function okay(){
		opener.document.getElementById("checkbtn1").style.color = "#4DED30";
		opener.document.getElementById("checkbtn1").style.border = "1px solid #4DED30";
		opener.document.getElementById("checkbtn1").value = "중복 확인 완료";
		self.close();
	}
</script>
<style>
	#okayBtn {
		width:80px;
		height:30px;
		border:1px solid #00C6BD;
		border-radius:50px;
		background-color:#00C6BD;
		color:white;
	}
	#okayBtn:focus {
		outline: none;
	}
</style>
</head>
<body>
	<div style="text-align:center;">
		<p style="font-size:26px; font-weight:bold; color:#00C6BD; margin:40px 0 20px 0;">사용중인 아이디가 아닙니다.</p>
		<input type="button" value="확인" onclick="okay()" id="okayBtn"/>
	</div>
</body>
</html>