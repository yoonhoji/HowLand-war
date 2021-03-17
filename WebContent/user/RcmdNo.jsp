<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천인 확인</title>
<script>
	function okay(){
		opener.document.getElementById("checkbtn2").style.color = "red";
		opener.document.getElementById("checkbtn2").style.border = "1px solid red";
		opener.document.getElementById("checkbtn2").value = "다시 찾기";
		self.close();
	}
</script>
<style>
	#okayBtn {
		width:80px;
		height:30px;
		border:1px solid red;
		border-radius:50px;
		background-color:white;
	}
	#okayBtn:focus {
		outline: none;
	}
</style>
</head>
<body>
	<div style="text-align:center;">
		<p style="font-size:26px; font-weight:bold; color:red; margin:40px 0 20px 0;">추천인으로 등록 불가능합니다.</p>
		<input type="button" value="확인" onclick="okay()" id="okayBtn"/>
	</div>
</body>
</html>